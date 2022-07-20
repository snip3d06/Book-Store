from django.db import models

# Create your models here.


class Item(models.Model):
    name = models.CharField(max_length=100, default='Untitled')
    price = models.FloatField(default=20.0)
    description = models.TextField(default='No description')
    image = models.ImageField(upload_to='images/')

    def __str__(self):
        return self.name
