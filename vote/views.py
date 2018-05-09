from django.shortcuts import render
from django.http import HttpResponse
from . models import *
from django.views import View
from django.shortcuts import get_object_or_404
from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin
import datetime, time
eldate=datetime.date(2018,5,9)#définis la date des élections
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
                        return render(request,'vote/homeVoter.html',context)
                else:
                    context={'admin':admin,'electeur':voter}
                    return render(request,'vote/homeAdmin.html',context)
        else:
            return HttpResponse('User not defined')