from assistant import firebase

auth = firebase.auth()

def log_in(email, password):
    user = auth.sign_in_with_email_and_password(email, password)

def sign_up(email, password):
    user = auth.create_user_with_email_and_password(email, password)
    auth.send_email_verification(user['idToken'])

def get_user_details():
    user = auth.get_account_info(user['idToken'])

def reset_password(email):
    auth.send_password_reset_email(email)