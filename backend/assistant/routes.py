from assistant import app
from flask import render_template, redirect, url_for, request, jsonify, session
# from authentication import log_in, sign_up, get_user_details, reset_password
from assistant import authentication
from generator import chat_response, reset_chat
from general_chatbot import response , reset
import markdown

basic_questions_and_responses = {
    'thank': 'I am glad I was able to help. Good luck with your project. Necroder at your service 24/7.',
    'hello': "Hello, I am Necroder, I am a super helpful coding assistant. No bug goes from my sight uncaught. How may I help you today?",
    'bye': 'Happy coding. Do not let a bug get you down :)',
}

@app.route("/")
@app.route("/home")
def home_page():
    # return the home page index
    return "home page"

@app.route('/ask', methods=['GET', 'POST'])
def get_chat_response():
    if request.method == 'POST':
        prompt = request.form.get("prompt")    # implement the logic for chat response and return 

        try:
            for question, answer in basic_questions_and_responses:
                if question in prompt.lower():
                    return jsonify({'response': answer})

            response = chat_response(prompt)
            return format_markdown({'response': response})
        
        except:
            return "Error generating answer"

    # if the request method is get then return the normal thing
    return "Hello, I am Necroder, I am a super helpful coding assistant. No bug goes from my sight uncaught. How may I help you today?"

    def get_response():
        if request.method == 'POST':
            prompt = request.form.get("prompt")    # implement the logic for chat response and return 

        try:
            for question, answer in basic_questions_and_responses:
                if question in prompt.lower():
                    return jsonify({'response': answer})

            response = response(prompt)
            return format_markdown({'response': response})
        
        except:
            return "Error generating answer"

    # if the request method is get then return the normal thing
    return "Hello, I am Necroder, I am a super helpful coding assistant. No bug goes from my sight uncaught. How may I help you today?"


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
        
@app.route('/reset-chat')
def reset_chat_history():
    reset_chat()

def reser_chat():
    reset()

@app.route('/feedback', methods=['POST', 'GET'])
def give_feedback():
    if request.method == "POST":
        # is your problem solved: yes or no
        # are you satisfied with it: 
        # 
        pass

def format_markdown(markdown_text):
    return markdown.markdown(markdown_text)