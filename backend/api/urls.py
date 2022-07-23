from django.urls import path
from . import views

urlpatterns = [
    path('search/', views.search),
    path('all_categories/', views.get_categories),
    path('trending_books/', views.get_trending_books),
    path('classic_books/', views.get_classic_books),
    path('trending_books_by_category/', views.get_trending_books_by_category),
    path('classic_books_by_category/', views.get_classic_books_by_category),
    path('authors_by_category/', views.get_authors_books_by_category),
]
