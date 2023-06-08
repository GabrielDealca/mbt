from django.contrib import admin
from .models import *

# Register your models here.
# Register your models here.
class PermissionAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'description', 'created')

class RoleAdmin(admin.ModelAdmin):
    list_display =  ('id', 'name', 'description', 'created')

admin.site.register(Permission, PermissionAdmin)
admin.site.register(Role, RoleAdmin)