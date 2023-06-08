from django.urls import path
from . import views
from .views import *
#from knox import views as knox_views
#from .views import LoginAPI, SignupAPI

app_name = 'users'

urlpatterns = [    
    #path('api/signup/', SignupAPI.as_view(), name='signup_api'),
    #path('api/login/', LoginAPI.as_view(), name='login_api'),
    path('api/signup/', SignupAPIView.as_view(), name='signup_api'),
    path('api/login/', LoginAPIView.as_view(), name='login_api'),

    path('api/permissions/', PermAPIView.as_view(), name='perms_api'),
    path('api/roles/', RoleAPIView.as_view(), name='roles_api'),

    path('api/users/<str:user_id>/roles/', UserRoleAPIView.as_view(), name='user_roles_api'),
    path('api/roles/<str:role_id>/permissions/', RolePermAPIView.as_view(), name='role_perms_api'),
    path('api/users/<str:user_id>/permissions/', UserPermAPIView.as_view(), name='user_perms_api'),

    #path('logout/', views.CustomLogoutView.as_view(), name='logout'),
]