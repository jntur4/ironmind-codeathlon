import mariadb
from fastapi import APIRouter, Response
import requests
import hashlib
from src.item import Siege,Item,Utilisateur,UtilisateurConnexion,Sexe,Evenements,Programme
import json
router = APIRouter()
sql_connection = mariadb.connect(host='db', port=3306, user="username", password="password", database="database")


@router.get("/")
def index():
    return {"message": "Hello, World!"}


@router.get("/items")
def get_item():
    with sql_connection.cursor() as cursor:
        query = "SELECT name,description,price FROM items"
        cursor.execute(query)
        results = cursor.fetchall()
        return [Item(name=result[0], description=result[1], price=result[2]) for result in results]


@router.post("/item")
def add_item(item: Item):
    with sql_connection.cursor() as cursor:
        sql = "INSERT INTO items (name, description, price) VALUES (%s, %s, %s)"
        cursor.execute(sql, (item.name, item.description, item.price))
        sql_connection.commit()

@router.get("/programmes")
def get_programmes():
    try:
        with sql_connection.cursor() as cursor:
            query = "SELECT * FROM Programe"
            cursor.execute(query)
            results = cursor.fetchall()
            return [Programme(id=result[0], nom=result[1], departement=result[2]) for result in results]
    except:
        print("failed")

def get_sexes():
    try:
        with sql_connection.cursor() as cursor:
            query = "SELECT sexe FROM Sexe"
            cursor.execute(query)
            results = cursor.fetchall()
            return [Sexe(id=result[0], sexe=result[1]) for result in results]
    except:
        print("failed")

@router.get("/sexes")
def get_programmes():
    return get_sexes()

@router.post("/user/register")
def create_User(Utilisateur: Utilisateur):
    try:
        # should validate the infos missing pswd
        password = hashed(Utilisateur.password)
        gender = get_gender(Utilisateur.prenom)
        # get sex id from gender results

        sexes = get_sexes()

        sex_id = 3

        if(Utilisateur.sexe == gender.gender and Utilisateur.sexe != "Non-Binaire"):
            sex_id = sexes.index(Utilisateur.sexe)


        with sql_connection.cursor() as cursor:
            sql = "INSERT INTO Utilisateur (prenom, nom, email, sexe_id, email, password_hash) VALUES (%s, %s, %s,%s, %s, %s)"
            cursor.execute(sql, (Utilisateur.prenom, Utilisateur.nom, Utilisateur.email,sex_id, Utilisateur.email, Utilisateur.password))
            sql_connection.commit()
    except: 
        print("failed")


@router.post("/user/login")
def login(Utilisateur: UtilisateurConnexion, response: Response):
    try:
        password = hashed(Utilisateur.password)
        with sql_connection.cursor() as cursor:
            sql = "SELECT 1 FROM Utilisateur WHERE email = %s AND password_hash = %s"
            cursor.execute(sql, (Utilisateur.email, password))
            if(cursor.fetch()):
                response.set_cookie(key="session", value="fake-cookie-session-value")
    except:
        print("failed")


@router.get("/evenements")
def get_evenements():
    try:
        with sql_connection.cursor() as cursor:
            query = "SELECT * FROM Evenements"
            cursor.execute(query)
            results = cursor.fetchall()
            #check for the date should be type datetime
            return [Evenements(id=result[0], nom=result[1],date=results[2]) for result in results]
    except:
        print("error while fetching db")
        

@router.get("/tickets")
def reserve(EmailUser: str):
    with sql_connection.cursor() as cursor:
        query = "SELECT * FROM Reservations WHERE Email = " + EmailUser
        cursor.execute(query)
        results = cursor.fetchall()
        return results
    print("return all reserved tickets")

@router.post("/reserve")
def reserve_ticket(Siege: Siege, Utilisateur: Utilisateur, PourcentagePluie: float):
    try:
        if(Utilisateur != null):
            with sql_connection.cursor() as cursor:
                sql = "INSERT INTO Reservations (numero, section, prix) VALUES (%s, %s, %s)"
                cursor.execute(sql, (Siege.numero, Siege.section, Siege.prix * (1 - PourcentagePluie)))
                sql_connection.commit()
    except:
        print("failed")



def hashed(password):
    salt = 'Jean-Ni_pu' #J'adore
    hashed_password = hashlib.sha512(password + salt).hexdigest()
    return hashed_password

def get_gender(name):
    response = requests.get('https://api.genderize.io?name='+str(name))
    return response.json()
    # return {
    # "count": 29216,
    # "name": "edouard",
    # "gender": "male",
    # "probability": 0.99
    # }

def get_Nationale(name):
    response = requests.get('https://'+str(name))


#route get programmes /programmes should be ok
#route get sexes /sexes should be ok
#post cree /user
#get /user/login should be ok
#get /evenements should be ok
#post /reserve 
# get /tickets should be ok


# Les calls sont probablement tt la y manque login et get user ainsi que billets les 2 

 

# Manque le pswd dans la classe user que jean ni a pas cree 