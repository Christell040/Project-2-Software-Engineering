from dataclasses import fields
from django.urls import clear_script_prefix
from rest_framework import serializers
from app import models

class appserializer(serializers.ModelSerializer):
    class Meta:
        fields=('name','st_id','level','gpa')
        model=models.info