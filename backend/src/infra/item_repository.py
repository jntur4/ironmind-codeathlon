from typing import List, Union

import mariadb

from src.domain.item import Item


class ItemRepository:
    # def __init__(self, sql_connection: Union[MySQLConnection, PooledMySQLConnection]):
    def __init__(self, sql_connection: mariadb.connection):
        self.__sql__connection = sql_connection

    def get_items(self) -> List[Item]:
        with self.__sql__connection.cursor() as cursor:
            query = "SELECT name,description,price FROM items"
            cursor.execute(query)
            results = cursor.fetchall()
            print(results)
            return [Item(name=result[0], description=result[1], price=result[2]) for result in results]

    def add_item(self, item: Item):
        with self.__sql__connection.cursor() as cursor:
            sql = "INSERT INTO items (name, description, price) VALUES (%s, %s, %s)"
            cursor.execute(sql, (item.name, item.description, item.price))
            self.__sql__connection.commit()
