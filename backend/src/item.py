from pydantic import BaseModel

class Item(BaseModel):
    name: str
    description: str
    price: float

class Sexe(BaseModel):
    id: int
    sexe: str

class Utilisateur(BaseModel):
    prenom:str
    nom:str
    email:str
    sexe:str
    password: str

class UtilisateurConnexion(BaseModel):
    email:str
    password: str

class Programme(BaseModel):
    id:int
    nom:str
    departement:str

class Siege(BaseModel):
    numero:int
    section:int
    prix:float

class Evenements(BaseModel):
    id:int
    nom:str
    date:str #should be a datetime