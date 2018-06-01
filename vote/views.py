from django.shortcuts import render,get_object_or_404,redirect
from django.http import HttpResponse, HttpResponseRedirect
from . models import *
from django.contrib import auth
from django.urls import reverse
from django.views import View
from django.contrib.auth import authenticate, login,urls, logout
import datetime, time
import os
import cv2
import numpy as np
import logging
from sklearn.model_selection import train_test_split
from . import dataset_fetch as df
from . import cascade as casc
from PIL import Image
from time import time
from sklearn.decomposition import PCA
from sklearn.model_selection import GridSearchCV
from sklearn.svm import SVC
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix
import matplotlib.pyplot as plt
import pickle
eldate=datetime.date(2018,11,13)#définis la date des élections
regEnd=datetime.date(2018,10,1)#date de fin des enregistrements
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
path = BASE_DIR+'/ml/dataset'
# Create your views here.
def create_dataset(request):
    #print request.POST
    userId = request.POST['userId']
    print(cv2.__version__)
    # Detect face
    #Creating a cascade image classifier
    faceDetect = cv2.CascadeClassifier(BASE_DIR+'/ml/haarcascade_frontalface_default.xml')
    #camture images from the webcam and process and detect the face
    # takes video capture id, for webcam most of the time its 0.
    cam = cv2.VideoCapture(0)

    # Our identifier
    # We will put the id here and we will store the id with a face, so that later we can identify whose face it is
    id = userId
    # Our dataset naming counter
    sampleNum = 0
    # Capturing the faces one by one and detect the faces and showing it on the window
    while(True):
        # Capturing the image
        #cam.read will return the status variable and the captured colored image
        ret, img = cam.read()
        #the returned img is a colored image but for the classifier to work we need a greyscale image
        #to convert
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        #To store the faces
        #This will detect all the images in the current frame, and it will return the coordinates of the faces
        #Takes in image and some other parameter for accurate result
        faces = faceDetect.detectMultiScale(gray, 1.3, 5)
        #In above 'faces' variable there can be multiple faces so we have to get each and every face and draw a rectangle around it.
        for(x,y,w,h) in faces:
            # Whenever the program captures the face, we will write that is a folder
            # Before capturing the face, we need to tell the script whose face it is
            # For that we will need an identifier, here we call it id
            # So now we captured a face, we need to write it in a file
            sampleNum = sampleNum+1
            # Saving the image dataset, but only the face part, cropping the rest
            cv2.imwrite(BASE_DIR+'/ml/dataset/user.'+str(id)+'.'+str(sampleNum)+'.jpg', gray[y:y+h,x:x+w])
            if sampleNum==1:
                cv2.imwrite(BASE_DIR+'faces/'+str(id)+'.'+str(sampleNum)+'.jpg')
            # @params the initial point of the rectangle will be x,y and
            # @params end point will be x+width and y+height
            # @params along with color of the rectangle
            # @params thickness of the rectangle
            cv2.rectangle(img,(x,y),(x+w,y+h), (0,255,0), 2)
            # Before continuing to the next loop, I want to give it a little pause
            # waitKey of 100 millisecond
            cv2.waitKey(250)

        #Showing the image in another window
        #Creates a window with window name "Face" and with the image img
        cv2.imshow("Face",img)
        #Before closing it we need to give a wait command, otherwise the open cv wont work
        # @params with the millisecond of delay 1
        cv2.waitKey(1)
        #To get out of the loop
        if(sampleNum>35):
            break
    #releasing the cam
    cam.release()
    # destroying all the windows
    cv2.destroyAllWindows()

    #return redirect('/')
    return (BASE_DIR+'faces/'+str(id)+'.'+str(1)+'.jpg',id)

def trainer(request):
    '''
        In trainer.py we have to get all the samples from the dataset folder,
        for the trainer to recognize which id number is for which face.

        for that we need to extract all the relative path
        i.e. dataset/user.1.1.jpg, dataset/user.1.2.jpg, dataset/user.1.3.jpg
        for this python has a library called os
    '''
    import os
    from PIL import Image

    #Creating a recognizer to train
    recognizer = cv2.face.LBPHFaceRecognizer_create()
    #Path of the samples
    path = BASE_DIR+'/ml/dataset'

    # To get all the images, we need corresponing id
    def getImagesWithID(path):
        # create a list for the path for all the images that is available in the folder
        # from the path(dataset folder) this is listing all the directories and it is fetching the directories from each and every pictures
        # And putting them in 'f' and join method is appending the f(file name) to the path with the '/'
        imagePaths = [os.path.join(path,f) for f in os.listdir(path)] #concatinate the path with the image name
        #print imagePaths

        # Now, we loop all the images and store that userid and the face with different image list
        faces = []
        Ids = []
        for imagePath in imagePaths:
            # First we have to open the image then we have to convert it into numpy array
            faceImg = Image.open(imagePath).convert('L') #convert it to grayscale
            # converting the PIL image to numpy array
            # @params takes image and convertion format
            faceNp = np.array(faceImg, 'uint8')
            # Now we need to get the user id, which we can get from the name of the picture
            # for this we have to slit the path() i.e dataset/user.1.7.jpg with path splitter and then get the second part only i.e. user.1.7.jpg
            # Then we split the second part with . splitter
            # Initially in string format so hance have to convert into int format
            ID = int(os.path.split(imagePath)[-1].split('.')[1]) # -1 so that it will count from backwards and slipt the second index of the '.' Hence id
            # Images
            faces.append(faceNp)
            # Label
            Ids.append(ID)
            #print ID
            cv2.imshow("training", faceNp)
            cv2.waitKey(10)
        return np.array(Ids), np.array(faces)

    # Fetching ids and faces
    ids, faces = getImagesWithID(path)

    #Training the recognizer
    # For that we need face samples and corresponding labels
    recognizer.train(faces, ids)
    imagePaths = [os.path.join(path,f) for f in os.listdir(path)]
    # Save the recogzier state so that we can access it later
    recognizer.save(BASE_DIR+'/ml/recognizer/trainingData.yml')
    cv2.destroyAllWindows()
    for image in imagePaths:
        os.system("del image")

class IndexView(View):
    """vue présentant la page d'acceuil site de vote"""
    def get(self,request):
        party=Parties.objects.order_by('pk')
        context={'party':party}
        return render(request,'vote/index.html',context)

class LoginView(View):
    """vue de la page d'acceuil, pour le login"""
    def get(self,request):
        return render(request,'vote/login.html')

class ImgSave(View):
    def get(self,request):
        ip,id=create_dataset(request)
        trainer(request)
        container={'image':ip,'imName':id}
        return render(request,'vote/homeAdmin1.html',context)
class CheckData(View):
    """utilisée pouranalyser les donnés de l'utilisateur
    et le renvoyer vers la page correspondante"""
    def post(self,request):
        username=request.POST['nom']
        password=request.POST['pw']
        user=auth.authenticate(request,username=username,password=password)
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
                        return redirect('/')
                    else:
                        message=''
                        context={'message':message,'electeur':voter}
                        auth.login(request,user)#ouverture d'une session pour l'utilisateur en cour
                        return render(request,'vote/homeVoter.html',context)
                else:
                    if regEnd.year==datetime.date.today().year and regEnd.month<datetime.date.today().month:
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
                        if admin.status=='Agent':
                            context={'admin':admin,}
                            login(request,user)#ouverture d'une session pour l'utilisateur en cour
                            return render(request,'vote/homeAdmin1.html',context)
                        else:
                            return render(request,'vote/superAdmin.html')
        else:
            return HttpResponse('User not defined')

class RegisterVoter(View):
    def post(self,request):
        cni=request.POST['cni']
        name=request.POST['nom']
        surname=request.POST['surname']
        dob=request.POST['dob']
        pic =cni+'.jpg' #BASE_DIR+'/faces'
        electeur=Voters(cni_number=int(cni),name=name,surname=surname,date_of_birth=dob,picture=pic)
        user=User.objects.create_user(name,'',cni)
        user.save()
        electeur.save()
        user.set_password(cni)
        user.save()
        return render(request,'vote/homeAdmin.html')

class LogoutView(View):
    def get(self,request):
        logout(request)
        return render(request,'vote/index.html')
    
class RegParty(View):
    """vue chargée de retourner la page d'enregistrement des parties politiques"""
    def get(self,request):
        return render(request,'vote/regParty.html')
class RegCandidates(View):
    def get(self,request):
        party=Parties.objects.order_by('pk')
        context={'party':party}
        return render(request,'vote/regCandidates.html',context)
class RegAgents(View):
    def get(self,request):
            return render(request,'vote/RegisterAgents.html')
class SaveParty(View):
    """cette vue enregistre les parties politiques dans la base de données"""
    def post(self,request):
        pname=request.POST['party']
        logo=request.POST['logo']
        party=Parties(p_name=pname,logo=logo)
        party.save()
        return render(request,'vote/superAdmin.html')

class SaveCandidates(View):
    """cette vue enregistre les parties politiques dans la base de données"""
    def post(self,request):
        name=request.POST['nom']
        sname=request.POST['surname']
        dob=request.POST['dob']
        pname=request.POST['party']
        candidate=Candidates(name=name,surname=sname,date_of_birth=dob,p_party=party)
        candidate.save()
        return render(request,'vote/superAdmin.html')

class SaveAgents(View):
    """cette vue enregistre les agents d'enregistrement"""
    def post(self,request):
        cni=request.POST['cni']
        name=request.POST['nom']
        surname=request.POST['surname']
        dob=request.POST['dob']
        pic =cni+'.jpg' #BASE_DIR+'/faces'
        electeur=Voters(cni_number=int(cni),name=name,surname=surname,date_of_birth=dob,picture=pic)
        user=User.objects.create_user(name,'',cni)
        if user.save():
            electeur.save()
        else:
            return HttpResponse('Erreur 1')
        agent=Admin(Voters=electeur)
        if agent.save():  
            user.set_password(cni)
            user.save()
        else:
            return HttpResponse("Erreur2")
        return render(request,'vote/homeAdmin.html')
        