import pymysql
import uvicorn
from fastapi import FastAPI, Depends
from starlette.middleware.cors import CORSMiddleware

from src.config.service_locator import ServiceLocator
from src.infra.item_repository import ItemRepository
from src.resource.item_route import router as item_router
from src.service.item_service import ItemService


def launch():
    __initialize_dependencies()
    app = __setup_app()
    uvicorn.run(app, host="127.0.0.1", port=8080)

def __initialize_dependencies():
    ServiceLocator.clear()

    sql_connection = pymysql.connect(host="localhost", user="root", password="pass", database="database")

    item_repository = ItemRepository(sql_connection)
    ServiceLocator.register_dependency(ItemService, ItemService(item_repository))

def __setup_app() -> FastAPI:
    app = FastAPI()

    app.add_middleware(
        CORSMiddleware,
        allow_credentials=True,
        allow_origins=["*"],
        allow_methods=["*"],
        allow_headers=["*"],
    )

    app.include_router(item_router)

    return app