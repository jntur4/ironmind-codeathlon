from typing import List

from src.domain.item import Item
from src.infra.item_repository import ItemRepository


class ItemService:
    def __init__(self, item_repository: ItemRepository):
        self.__item_repository = item_repository

    def get_items(self) -> List[Item]:
        return self.__item_repository.get_items()

    def add_item(self, item: Item):
        self.__item_repository.add_item(item)