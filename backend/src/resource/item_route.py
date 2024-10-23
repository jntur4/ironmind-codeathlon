from fastapi import APIRouter, Depends

from src.config.service_locator import ServiceLocator
from src.domain.item import Item
from src.service.item_service import ItemService

router = APIRouter()

@router.get("/items")
def get_item(item_service: ItemService = Depends(
        lambda: ServiceLocator.get_dependency(ItemService)
    )):
    return item_service.get_items()

@router.post("/item")
def add_item(item: Item, item_service: ItemService = Depends(
        lambda: ServiceLocator.get_dependency(ItemService)
    )):
    item_service.add_item(item)
