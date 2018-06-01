from django.conf import settings
from django.urls import path, include
from django.conf.urls.static import static
from vote.views import *
from django.urls import path,include
app_name='vote'
urlpatterns=[
    path('',IndexView.as_view(),name='index'),
    path('login',LoginView.as_view(),name='login'),
    path('home',CheckData.as_view(),name='check'),
    path('logout',LogoutView.as_view(),name='logout'),
    path('register',RegisterVoter.as_view(),name='regVoter'),
    path('analyse',ImgSave.as_view(),name='analyse'),
    path('regparty',RegParty.as_view(),name='regParty'),
    path('saveP',SaveParty.as_view(),name="saveParty"),
    path('regcand',RegCandidates.as_view(),name='regCand'),
    path('regCandidates',RegAgents.as_view(),name='regAgents'),
]

#if settings.DEBUG:
 #   urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)