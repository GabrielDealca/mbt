from django import forms
from .models import *
#from crispy_forms.helper import FormHelper
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import password_validation

class SignUpForm(UserCreationForm): 
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields.pop('password2')
        self.fields['password'] = self.fields['password1']
        self.fields.pop('password1')
        self.fields['password'].widget.attrs['name'] = 'password'
    class Meta:
        model = User
        fields = ['email', 'username', 'password']
    
    #def clean_username(self):
        # Validate username field
        #username = self.cleaned_data['username']
        # Add your validation logic here, e.g., check for uniqueness
        #if not username.isalnum():
        #    raise forms.ValidationError("Username can only contain letters and numbers.")
