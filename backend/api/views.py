from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from product.models import Item
from .serializers import ItemSerializer


@api_view(['POST'])
def search(request):
    ##search = request.data.get("search")
    items = Item.objects.all()  # name__contains=search
    return Response(items)
