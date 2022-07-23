from django.urls import path
from . import views

urlpatterns = [
    path('search/', views.search),
    path('all_categories/', views.get_categories),
    path('trending_books/', views.get_trending_books),
]
