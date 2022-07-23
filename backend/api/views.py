from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from product.models import Product, Category, Author
from .serializers import ProductSerializer, CategorySerializer, AuthorSerializer
from django.db.models import Q


@api_view(['POST'])
def search(request):
    search = request.data.get("search")
    query = Q(name__contains=search) | Q(
        description__contains=search) | Q(author__name__contains=search)
    products = Product.objects.filter(query)
    return Response(ProductSerializer(products, many=True).data)


@api_view(['GET'])
def get_categories(request):
    categories = Category.objects.all()
    return Response(CategorySerializer(categories, many=True).data)


@api_view(['GET'])
def get_trending_books(request):
    products = Product.objects.filter(trending=True)
    return Response(ProductSerializer(products, many=True).data)


@api_view(['GET'])
def get_classic_books(request):
    products = Product.objects.filter(classic=True)
    return Response(ProductSerializer(products, many=True).data)


@api_view(['POST'])
def get_trending_books_by_category(request):
    category = request.data.get("category")
    products = Product.objects.filter(trending=True)
    products = products.filter(categories__name=category)
    return Response(ProductSerializer(products, many=True).data)


@api_view(['POST'])
def get_classic_books_by_category(request):
    category = request.data.get("category")
    products = Product.objects.filter(classic=True)
    products = products.filter(categories__name=category)
    return Response(ProductSerializer(products, many=True).data)


@api_view(['POST'])
def get_authors_books_by_category(request):
    category = request.data.get("category")
    products = Product.objects.filter(
        categories__name=category).filter(classic=True)
    authors = Author.objects.filter(product__in=products)
    authors = list(set(authors))
    return Response(AuthorSerializer(authors, many=True).data)
