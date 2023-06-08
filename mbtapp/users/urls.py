from django.urls import path
from . import views
#from knox import views as knox_views
#from .views import LoginAPI, SignupAPI

app_name = 'users'

urlpatterns = [
    path('signup/', views.signup, name='signup'),
    path('login/', views.login, name='login'),    
    path('logout/', views.logout_user, name='logout_user'),

    #path('api/signup/', SignupAPI.as_view(), name='signup_api'),
    #path('api/login/', LoginAPI.as_view(), name='login_api'),
   
    #path('logout/', views.CustomLogoutView.as_view(), name='logout'),
]