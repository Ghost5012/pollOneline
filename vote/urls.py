from django.conf import settings
from django.urls import path, include
from django.conf.urls.static import static
from vote.views import *
from django.urls import path,include
app_name='vote'
urlpatterns=[
    path('',IndexView.as_view(),name='index'),
]

#if settings.DEBUG:
 #   urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)