from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from product.models import Product, Category
from .serializers import ProductSerializer, CategorySerializer
from django.db.models import Q


@api_view(['POST'])
def search(request):
    search = request.data.get("search")
    query = Q(name__contains=search) | Q(
        description__contains=search) | Q(author__contains=search)
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
