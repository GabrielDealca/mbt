from django.contrib.auth import logout
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import auth, messages
from .models import *
from .forms import SignUpForm
from django.urls import reverse
import requests
import json

# Create your views here.
def signup(request):
    if request.user.is_authenticated:
        return redirect('/home/')
    else:
        #next_url = request.GET.get('next', None)
        if request.method == 'POST':    
            base_url = request.build_absolute_uri('/')[:-1]
            api_url = base_url + '/api/signup/'
            print(api_url)  

            form = SignUpForm(request.POST)
            if form.is_valid():  
                form_data = form.cleaned_data                

                #json_input = json.dumps(form_data)
                print(form_data)

                response = requests.post(api_url, json=form_data)

                print(response.status_code)
                if response.status_code == 201:  
                    messages.success(request, "Signup successful. You can log in now.")                     
                    return render(request, 'login.html')    
                else:             
                    
                    return render(request, 'signup.html')
            else:
                field_errors = form.errors
                print(field_errors)                
                context = {                    
                    'field_errors': field_errors		
                }
                return render(request, "signup.html", context)

        else:                         
            return render(request, "signup.html")


def logout_user(request):
    next_url = request.GET.get('next', None)
    logout(request)
    return redirect(next_url)


def login(request):    
    #next_url = request.GET.get('next', None)    
    if request.user.is_authenticated:
        return redirect('/home/')
    else:
        if request.method == 'POST':   
            base_url = request.build_absolute_uri('/')[:-1]
            api_url = base_url + '/api/login/'
            print(api_url)         

            credential=request.POST.get('credential')
            password=request.POST.get('password')  

            input = {
                'credential': credential,
                'password': password,            
            }

            json_input = json.dumps(input)
            print(json_input)

            response = requests.post(api_url, json=input)

            print(response.status_code)
            if response.status_code == 200:
                user_json = response.json()                
                user_json = user_json['user']
                x = auth.authenticate(email=user_json['credential'], password=user_json['password'])
                if x is not None: 
                    auth.login(request, x)  
                    return redirect('/home/')  
                else:       
                    user_email = get_object_or_404(User, username=user_json['credential']) 
                    x = auth.authenticate(email=user_email, password=user_json['password'])
                    auth.login(request, x)  
                    return redirect('/home/')                 
            else:           
                print("invalid")               
            
                messages.error(request, "Invalid credentials.")
                return render(request, 'login.html')
        else:	
            print("not post")
            pass	
            
            return render(request, "login.html")
