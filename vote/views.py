from django.shortcuts import render
from django.http import HttpResponse
from . models import *
from django.views import View
from django.shortcuts import get_object_or_404
from django.contrib.auth import authenticate, login
from django.contrib.auth.mixins import LoginRequiredMixin
# Create your views here.
class IndexView(View):
    """vue présentant la page d'acceuil site de vote"""
    def get(self,request):
        return HttpResponse('Ok')