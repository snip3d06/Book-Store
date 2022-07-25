from django.contrib import admin
from .models import *

# Register your models here.


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    search_fields = ['name']
    autocomplete_fields = ['author']


@admin.register(Image)
class ImageAdmin(admin.ModelAdmin):
    autocomplete_fields = ['product']


@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    search_fields = ['name']


admin.site.register(Category)
