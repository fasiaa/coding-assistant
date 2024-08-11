from assistant import app
from flask import render_template, redirect, url_for, request, jsonify, session
# from authentication import log_in, sign_up, get_user_details, reset_password
from assistant import authentication
from assistant.generator import chat_response, reset_chat
from assistant.general_chatbot import response , reset
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
    return jsonify({'response':"home page"})

@app.route('/ask', methods=['GET', 'POST'])
def get_chat_response():
    if request.method == 'POST':
        prompt = request.form.get("prompt")    # implement the logic for chat response and return 

        try:
            for question, answer in basic_questions_and_responses:
                if question in prompt.lower():
                    return jsonify({'response': answer})

            response = chat_response(prompt)
            return jsonify({'response': format_markdown(response)})
        
        except:
            return jsonify({'response':"Error generating answer"}) 

    # if the request method is get then return the normal thing
    return jsonify({'response':"Hello, I am Necroder, I am a super helpful coding assistant. No bug goes from my sight uncaught. How may I help you today?"})
@app.route('/askgeneral' , methods=['GET', 'POST'])
def get_response():
    if request.method == 'POST':
        prompt = request.form.get("prompt")    # implement the logic for chat response and return 
    try:
        for question, answer in basic_questions_and_responses:
            if question in prompt.lower():
                return jsonify({'response': answer})
        response = response(prompt)
        return jsonify({'response': format_markdown(response)})
    
    except:
        return jsonify({'response':"Error generating answer"}) 
# if the request method is get then return the normal thing
    return jsonify({'response':"Hello, I am Necroder, I am a super helpful coding assistant. No bug goes from my sight uncaught. How may I help you today?"})


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
            return user_details()
        except: 
            return jsonify({'response':"Failed to Sign Up"})
        
@app.route("/login", methods=['GET', 'POST'])
def login_page():
    if "user" in session: 
        return jsonify({'response':f"Hi {session['user']}"})
    # implement the login logic here 
    if request.method == "POST":
        # get the username and password from the form
        email = request.form.get("email")
        password = request.form.get("password")

        try: 
            user = authentication.log_in(email, password)
            session['user'] = email 
        except: 
            return jsonify({'response':"Incorrect Email or Password"})
    

@app.route('/logout')
def logout():
    session.pop('user')

@app.route('/user-details')
def user_details():
    if "user" in session:
        return jsonify({'response':authentication.get_user_details()})
    
@app.route('/forgot-password', methods=["POST", "GET"])
def forgot_password():
    if request.method == "POST":
        email = request.form.get("email")
        try:
            authentication.reset_password(email)
            return jsonify({'response':"Password Reset Email Sent"})
        except:
            return jsonify({'response':"Failed to Reset Password"})
        
@app.route('/reset-chat')
def reset_chat_history():
    reset_chat()

@app.route('/generalreset')
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

if __name__ == "__main__":
    app.run(debug=True)

