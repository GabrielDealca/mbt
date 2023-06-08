from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
from django.utils import timezone
import uuid
from base.models import Role, Permission
# Create your models here.

class UserManager(BaseUserManager):
    def _create_user(self, email, password, is_staff, is_superuser, **extra_fields):
        if not email:
            raise ValueError('Users must have an email address')
        now = timezone.now()
        email = self.normalize_email(email)
        user = self.model(
            email=email,      
            is_staff=is_staff,
            is_superuser=is_superuser,      
            is_active=True,            
            last_login=now,
            date_joined=now, 
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password, **extra_fields):
        return self._create_user(email, password, False, False, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        user=self._create_user(email, password, True, True, **extra_fields)
        user.save(using=self._db)
        return user

class User(AbstractBaseUser, PermissionsMixin):    
    #boolean
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)

    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    last_login = models.DateTimeField(null=True, blank=True)
    date_joined = models.DateTimeField(auto_now_add=True)
   
    #Personal Information   
    username = models.CharField(max_length=254)
    roles = models.ManyToManyField(Role, related_name='user_roles', null=True)
    
    #last_name = models.CharField(max_length=254, null=True, blank=True)
    #middle_name = models.CharField(max_length=254, null=True, blank=True)
    #suffix = models.CharField(max_length=20, null=True, blank=True)
    #sex = models.CharField(max_length=10, choices=SEXCHOICES, default=SEXCHOICES[0])
    #birth_date = models.DateField(null=True, blank=True)
    #birth_place = models.CharField(max_length=254, null=True, blank=True)
    
    #Contact Details
    #phone_number = models.CharField(max_length=20, null=True, blank=True)
    #landline_number = models.CharField(max_length=20, null=True, blank=True)      

    email = models.EmailField(max_length=254, unique=True)
    #alternative_email = models.EmailField(max_length=254, unique=True)   

    USERNAME_FIELD = 'email'
    EMAIL_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def get_absolute_url(self):
        return "/users/%i/" % (self.pk)
    
    def __str__(self):
        return "%s" % self.email
        #return "%s" % self.player_id.

    class Meta:
        managed = True
        db_table = 'user'

