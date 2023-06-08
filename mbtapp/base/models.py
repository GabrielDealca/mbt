from django.db import models

# Create your models here.
class Permission(models.Model):
    id = models.CharField(primary_key=True, max_length=500)
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=1000, blank=True, null=True)    

    created = models.DateTimeField(auto_now_add=True)    

    def __str__(self):
        return '{}'.format(self.id)

    class Meta:
        managed = False
        db_table = 'permission'

class Role(models.Model):
    id = models.CharField(primary_key=True, max_length=500)
    name = models.CharField(max_length=100)
    permissions = models.ManyToManyField(Permission, related_name = "role_permissions", blank=True)
    description = models.CharField(max_length=1000, blank=True, null=True)    

    created = models.DateTimeField(auto_now_add=True)    

    def __str__(self):
        return '{}'.format(self.id)

    class Meta:
        managed = False
        db_table = 'role'
