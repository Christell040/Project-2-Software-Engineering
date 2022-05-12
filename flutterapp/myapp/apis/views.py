import imp
from typing import Generic
from django.shortcuts import render
from app import models
from .serializers import appserializer
from rest_framework import generics
# Create your views here.

class Listapp(generics.ListCreateAPIView):
    queryset=models.info.objects.all()
    serializer_class=appserializer

class appdetail(generics.RetrieveUpdateDestroyAPIView):
    queryset=models.info.objects.all()
    serializer=appserializer