from django.shortcuts import render,get_object_or_404,redirect
from django.http import HttpResponse, HttpResponseRedirect
from . models import *
from django.urls import reverse
from django.views import View
from django.contrib.auth import authenticate, login
import datetime, time
eldate=datetime.date(2018,5,13)#définis la date des élections
regEnd=datetime.date(2018,5,12)#date de fin des enregistrements
# Create your views here.
class IndexView(View):
    """vue présentant la page d'acceuil site de vote"""
    def get(self,request):
        return render(request,'vote/index.html')

class LoginView(View):
    """vue de la page d'acceuil, pour le login"""
    def get(self,request):
        return render(request,'vote/login.html')

class CheckData(View):
    """utilisée pouranalyser les donnés de l'utilisateur
    et le renvoyer vers la page correspondante"""
    def post(self,request):
        username=request.POST['nom']
        password=request.POST['pw']
        user=authenticate(request,username=username,password=password)
        if user is not None:
            """récupérer l'id de l'utilisateur, le rechercher dans la table des 
            électeurs puis chercher à quel type d'électeur il apartient (admin, 
            électeur simple ou candidat) puis le retourner vers page correspondante"""
            if get_object_or_404(Voters,user_ptr_id=user.id):
                voter=get_object_or_404(Voters,user_ptr_id=user.id)
                admin=None
                try:
                    admin=Admin.objects.get(voters_ptr_id=voter.cni_number)
                except Admin.DoesNotExist:
                    #les électeurs n'auront accès ausite que le jour des élections
                    if datetime.date.today()==eldate:
                        message='Vous avez moins de 24h pour voter pour votre candidat'
                        context={'message':message,'electeur':voter}
                        return render(request,'vote/homeVoter.html',context)
                    else:
                        message=''
                        context={'message':message,'electeur':voter}
                        login(request,user)#ouverture d'une session pour l'utilisateur en cour
                        return render(request,'vote/homeVoter.html',context)
                else:
                    if regEnd.year==datetime.date.today().year and (regEnd.month<datetime.date.today().month or regEnd.day<datetime.date.today().day):
                        if datetime.date.today()==eldate:
                            message='Vous avez moins de 24h pour voter pour votre candidat'
                            context={'message':message,'electeur':voter}
                            return render(request,'vote/homeVoter.html',context)
                        else:
                            message=''
                            context={'message':message,'electeur':voter}
                            login(request,user)#ouverture d'une session pour l'utilisateur en cour
                            return render(request,'vote/homeVoter.html',context)
                    else:
                        context={'admin':admin,'electeur':voter}
                        login(request,user)#ouverture d'une session pour l'utilisateur en cour
                        return render(request,'vote/homeAdmin1.html',context)
        else:
            return HttpResponse('User not defined')

class RegisterVoter(View):
    def post(self,request):
        cni=request.POST['cni']
        name=request.POST['nom']
        surname=request.POST['surname']
        dob=request.POST['dob']
        electeur=Voters(cni_number=int(cni),name=name,surname=surname,date_of_birth=dob)
        user=User.objects.create_user(name,'',cni)
        user.save()
        electeur.save()
        return render(request,'vote/homeAdmin.html')

class LogoutView(View):
    def get(self,request):
        logout(request)
        return render(request,'vote/index.html')