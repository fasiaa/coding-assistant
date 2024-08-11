from assistant import app
from flask import render_template, redirect, url_for, request, jsonify, session
# from authentication import log_in, sign_up, get_user_details, reset_password
from assistant import authentication

basic_questions_and_responses = [{''}]

@app.route("/")
@app.route("/home")
def home_page():
    # return the home page index
    return "home page"

@app.route('/ask', methods=['GET', 'POST'])
def get_chat_response():
    if request.method == 'POST':
        pass    # implement the logic for chat response and return 

    # if the request method is get then return the normal thing

@app.route("/signup", methods=['GET', 'POST'])
def sign_up():
    # implement the sign up 
    if "user" in session: 
        return f"Hi {session['user']}"
    
    if request.method == "POST":
        # get the data from the form
        email = request.form.get("email")
        password = request.form.get("password")

        try:
            authentication.sign_up(email, password)
            return redirect('/login')
        except: 
            return "Failed to Sign Up"
        

@app.route("/login", methods=['GET', 'POST'])
def login_page():
    if "user" in session: 
        return f"Hi {session['user']}"
    # implement the login logic here 
    if request.method == "POST":
        # get the username and password from the form
        email = request.form.get("email")
        password = request.form.get("password")

        try: 
            user = authentication.log_in(email, password)
            session['user'] = email 
        except: 
            return "Incorrect Email or Password"
    
    return render_template("login.html")

@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/')

@app.route('/user-details')
def user_details():
    if "user" in session:
        return jsonify(authentication.get_user_details())
    
@app.route('/forgot-password', methods=["POST", "GET"])
def forgot_password():
    if request.method == "POST":
        email = request.form.get("email")
        try:
            authentication.reset_password(email)
            return "Password Reset Email Sent"
        except:
            return "Failed to Reset Password"