from django.db import models

# Create your models here.

class info(models.Model):
    name=models.TextField(max_length=20)
    st_id=models.CharField(max_length=20)
    level=models.IntegerField()
    gpa=models.IntegerField()

    def __str__(self):
        return self.st_id