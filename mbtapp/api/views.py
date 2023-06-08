from django.shortcuts import get_object_or_404
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from api.serializers import SignUpSerializer, LoginSerializer
from django.contrib import auth
from base.models import *
from .serializers import *

class SignupAPIView(APIView):
    """
        API endpoint for logging in.

        Request Body:
        {
            "email": "email@email.com",
            "username": "user",
            "password": "password"           
        } 
    """   
    def post(self, request):
        serializer = SignUpSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            token, _ = Token.objects.get_or_create(user=user)
            return Response({'token': token.key}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class LoginAPIView(APIView):
    """
        API endpoint for logging in.

        Request Body:
        {
            "credential": "email or username",
            "password": "password"           
        } 
    """
    def post(self, request):
        serializer = LoginSerializer(data=request.data)        
        if serializer.is_valid():            
            user = serializer.validated_data
            print(user)
            
            x = auth.authenticate(email=user['credential'], password=user['password'])             
            
            if x is not None:    
                print(x)      		
                auth.login(request, x)
                #token = AuthToken.objects.create(x)[1]
                return Response({'user': user}, status=status.HTTP_200_OK)
            else:
                user_email = get_object_or_404(User, username=user['credential'])               
                x = auth.authenticate(email=user_email.email, password=user['password'])
                if x is not None:    
                    print(x)      		
                    auth.login(request, x)
                    #token = AuthToken.objects.create(x)[1]
                    return Response({'user': user}, status=status.HTTP_200_OK)
                else:
                    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:    
            print("not valid")   
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class RoleAPIView(APIView):
    """
        API endpoint for creating new roles

        Request Body:
        {
            "id": "staff",
            "name": "Staff",
            (OPTIONAL) "description": "description",        
            "permissions": [
                "access",
                "read",
                "write"
            ]
        } 
    """
    def get(self, request):
        roles = Role.objects.all()
        serializer = RoleSerializer(roles, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = RoleSerializer(data=request.data)
        if serializer.is_valid():
            #role_input = serializer.validated_data
            #print(role_input)

            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class PermAPIView(APIView):
    """
    API endpoint for craeting new permissions

    Request Body:
    {
        "id": "read",
        "name": "Read",
        (OPTIONAL) "description": "description"  
    }    
    """
    def get(self, request):
        roles = Permission.objects.all()
        serializer = PermSerializer(roles, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = PermSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class UserRoleAPIView(APIView):
    """
    API endpoint for adding roles to a user.

    Request Body:
    {
        "roles": ["hr", "staff"]
    }    
    """
    def get(self, request, user_id):
        user = User.objects.get(id=user_id)
        roles = user.roles.all()
        serializer = RoleSerializer(roles, many=True)        
        return Response(serializer.data)
        
    
    def post(self, request, user_id):
        user = User.objects.get(id=user_id)
        role_ids = request.data.get('roles', [])
        roles = Role.objects.filter(id__in=role_ids)
        if roles:
            for role in roles:   
                print(role)             
                user.roles.add(role)               
            return Response(status=status.HTTP_201_CREATED)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
    
class RolePermAPIView(APIView):
    """
    API endpoint for adding permissions to a role.

    Request Body:
    {
        "permissions": ["read", "access"]
    }    
    """
    def get(self, request, role_id):
        role = Role.objects.get(id=role_id)
        permissions = role.permissions.all()
        serializer = PermSerializer(permissions, many=True)        
        return Response(serializer.data)
        
    
    def post(self, request, role_id):
        role = Role.objects.get(id=role_id)
        perm_ids = request.data.get('permissions', [])
        permissions = Permission.objects.filter(id__in=perm_ids)
        print(permissions)
        if permissions:
            for perm in permissions:   
                print(perm)             
                role.permissions.add(perm)
            return Response(status=status.HTTP_201_CREATED)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)


class UserPermAPIView(APIView):
    """
    API endpoint for viewing user permissions    
    """
    def get(self, request, user_id):
        user = User.objects.get(id=user_id)
        roles = user.roles.all()

        permissions = set()
        for role in roles:
            permissions |= set(role.permissions.all())
       
        serializer = PermSerializer(permissions, many=True)        
        return Response(serializer.data)       
    
    