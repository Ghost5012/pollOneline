from django.db import models
from django.contrib.auth.models import User
# Create your models here.
class Voters(User):
    """regroupe tous les citoyens camerounais capable de voter
    y compris les cadidates aux élections, les agents d'enregistrements 
    et le président de la cour constitutionelle qui sera chargé de la 
     proclamation du resultat des élections"""
    cni_number=models.IntegerField(primary_key=True)
    name=models.CharField(max_length=20)
    surname=models.CharField(max_length=25)
    date_of_birth=models.DateField()
    picture=models.ImageField(upload_to="faces/")

class Candidates(Voters):
    """regroupe les candidats en lisse pour les élections en cours"""
    p_party=models.CharField(max_length=15,primary_key=True)
    logo=models.ImageField(upload_to="logos/")

class Admin(Voters):
    """regroupe toute les personnes responsables responsables de l'enregistrement 
    des électeurs(les agents) et de la surveillance des élections(le président de 
    la cour suprème) """
    level=[("Agent","Agent"),("President","Surpeme court présidents")]
    status=models.CharField(max_length=12,choices=level)

class Votes(models.Model):
    """enregitre les votes des électeurs"""
    electeur=models.ForeignKey(Voters,on_delete=models.CASCADE)
    date=models.DateTimeField()
    place=models.CharField(max_length=15)