from flask import Flask
import pyrebase
import os
import dotenv

dotenv.load_dotenv()

app = Flask(__name__)

# Key for session cookies 
app.secret_key = "6447247876"

config = {
    "apiKey":os.getenv("GOOGLE_API_KEY") , 
    "authDomain":os.getenv("GOOGLE_AUTH_DOMAIN"),
    "projectId":os.getenv("GOOGLE_PROJECT_ID") ,
    "storageBucket":os.getenv("GOOGLE_STORAGE_BUCKET") ,
    "messagingSenderId":os.getenv("GOOGLE_MESSAGING_SENDER_ID"),
    "appId":os.getenv("GOOGLE_APP_ID"),
    "measurementId":os.getenv("GOOGLE_MEASUREMENT_ID"),
    "databaseURL": "",
}

firebase = pyrebase.initialize_app(config)
gemini_api = os.getenv("API_KEY")

from assistant import routes