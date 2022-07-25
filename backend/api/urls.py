from django.urls import path
from . import views

urlpatterns = [
    path('search/<str:search>', views.search),
    path('all_categories/', views.get_categories),
    path('trending_books/', views.get_trending_books),
    path('classic_books/', views.get_classic_books),
    path('trending_books_by_category/<str:category>',
         views.get_trending_books_by_category),
    path('classic_books_by_category/<str:category>',
         views.get_classic_books_by_category),
    path('authors_by_category/<str:category>',
         views.get_authors_by_category),
    path('images_for_book/<str:book_name>', views.get_images_for_book),
]
