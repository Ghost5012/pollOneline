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
]

#if settings.DEBUG:
 #   urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)