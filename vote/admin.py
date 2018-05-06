from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(Voters)
admin.site.register(Candidates)
admin.site.register(Admin)