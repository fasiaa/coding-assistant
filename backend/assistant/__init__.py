from flask import Flask
import pyrebase

app = Flask(__name__)

# Key for session cookies 
app.secret_key = "6447247876"

config = {
    "apiKey": "AIzaSyDOVle15rENt693CsICQTzLnE4RAzMaaHY",
    "authDomain": "coding-assistant-2c00b.firebaseapp.com",
    "projectId": "coding-assistant-2c00b",
    "storageBucket": "coding-assistant-2c00b.appspot.com",
    "messagingSenderId": "530414090463",
    "appId": "1:530414090463:web:f67cb3ad5be0bb7540516a",
    "measurementId": "G-5XVRLRS97M",
    "databaseURL": "",
}

firebase = pyrebase.initialize_app(config)

from assistant import routes
