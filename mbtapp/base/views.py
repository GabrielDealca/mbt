from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from users.models import User
from .models import *
from django.contrib.auth.decorators import login_required
import requests

# Create your views here.
def index(request):
    return render(request, "index.html")

@login_required(login_url='/login/')
def home(request):
    if request.user.is_authenticated:
        user = get_object_or_404(User, id=request.user.id)        

        base_url = request.build_absolute_uri('/')[:-1]
        roles_api_url = base_url + '/api/users/' + str(user.id) + '/roles/'
        perms_api_url = base_url + '/api/users/' + str(user.id) + '/permissions/'

        response_roles = requests.get(roles_api_url)
        response_perms = requests.get(perms_api_url)
        
        roles = response_roles.json() 
        permissions = response_perms.json() 
         
        
        #permissions = user.roles.permissions.all()
        
        #print(permissions)

        context = {     
            'user' : user,      
            'Roles': roles, 
            'User_Permissions' : permissions,
            #'User_Permissions' : permissions,

        }
        return render(request, "home.html", context)
    else:
        return render(request, "home.html")