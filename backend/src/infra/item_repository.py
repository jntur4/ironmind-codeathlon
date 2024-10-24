from typing import List, Union

import mariadb.connections
from mysql.connector.aio import MySQLConnection
from mysql.connector.pooling import PooledMySQLConnection

from src.domain.item import Item


class ItemRepository:
    # def __init__(self, sql_connection: Union[MySQLConnection, PooledMySQLConnection]):
    def __init__(self, sql_connection: mariadb.connections.Connection):
        self.__sql__connection = sql_connection

    def get_items(self) -> List[Item]:
        with self.__sql__connection.cursor() as cursor:
            query = "SELECT * FORM items"
            cursor.execute(query)
            results = cursor.fetchall()
            return [Item(**result) for result in results]

    def add_item(self, item: Item):
        with self.__sql__connection.cursor() as cursor:
            sql = "INSERT INTO items (name, description, price) VALUES (%s, %s, %s)"
            cursor.execute(sql, (item.name, item.description, item.price))
            self.__sql__connection.commit()
