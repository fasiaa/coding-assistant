from flask import Flask

app = Flask(__name__)

from assistant import routes
