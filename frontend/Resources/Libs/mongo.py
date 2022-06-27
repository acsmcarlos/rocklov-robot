from pymongo import MongoClient
import bson
# import ssl    ssl_cert_reqs=ssl.CERT_NONE

# abrir uma conexão com BD           senha                                       banco
client = MongoClient('mongodb+srv://rocklov:rocklov@cluster0.i1dcd.mongodb.net/?rocklov=true&w=majority')

# Conecta no banco de dados
db = client['rocklov']

# Gerar um object Id MongoDB dinamicamente
def get_mongo_id():
     return bson.objectid.ObjectId()

# Conecta na collection users e excluir um registro pelo email
def remove_user_email(user_email):
    users = db['users']
    users.delete_many({'email': user_email})

# Conecta na collection EQUIPOS e excluir um registro pelo NOME
def remove_equipo(equipo_name):
    equipos = db['equipos']
    equipos.delete_many({'name': equipo_name})
