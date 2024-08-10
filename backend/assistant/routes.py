from assistant import app
from flask import render_template, redirect, url_for, request, jsonify

@app.route("/")
@app.route("/home")
def home_page():
    # return the home page index
    pass

@app.route('/ask', methods=['GET', 'POST'])
def get_chat_response():
    if request.method == 'POST':
        pass    # implement the logic for chat response and return 

    # if the request method is get then return the normal thing

@app.route("/signup", methods=['GET', 'POST'])
def sign_up():
    # implement the sign up 
    pass

@app.route("/login", methods=['GET', 'POST'])
def login_page():
    # implement the login logic here 
    pass 
