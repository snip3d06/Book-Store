from unicodedata import category
from django.db import models

# Create your models here.


class Product(models.Model):
    name = models.CharField(max_length=100, default='Untitled')
    price = models.FloatField(default=20.0)
    description = models.TextField(default='No description')
    image = models.TextField(
        default='https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg')
    author = models.CharField(max_length=100, default='Anonymous')
    categories = models.ManyToManyField('Category', blank=True)
    trending = models.BooleanField(default=False)
    classic = models.BooleanField(default=False)

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=100, default='None')
    image = models.TextField(
        blank=True)

    def __str__(self):
        return self.name
