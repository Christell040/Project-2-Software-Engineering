from django.urls import path
from . views import Listapp, appdetail

urlpatterns=[
    path('',Listapp.as_view()),
    path('<int:pk>/',appdetail.as_view())
]