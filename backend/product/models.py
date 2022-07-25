from unicodedata import category
from django.db import models

# Create your models here.


class Product(models.Model):
    name = models.CharField(max_length=100, default='Untitled')
    price = models.FloatField(default=20.0)
    description = models.TextField(default='No description')
    main_image = models.TextField(
        default='https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg')
    author = models.ForeignKey(
        'Author', on_delete=models.CASCADE, blank=True, null=True)
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


class Author(models.Model):
    name = models.CharField(max_length=100, default='Anonymous')
    image = models.TextField(
        default='https://as1.ftcdn.net/v2/jpg/03/53/11/00/1000_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg')

    def __str__(self):
        return self.name


class Image(models.Model):
    name = models.CharField(max_length=100, default='Untitled')
    image = models.TextField(
        default='https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg')
    product = models.ForeignKey(
        'Product', on_delete=models.CASCADE, blank=True, null=True)
    has_background = models.BooleanField(default=False)

    def __str__(self):
        return self.name
