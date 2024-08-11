import google.generativeai as genai
import os 
import dotenv

dotenv.load_dotenv()

chat_history = [
        {"role": "user", "parts": "Hello, you have to act like a very friendly cool and intelligent person who have knowledge on variety of topics and is multilingual"},
        {"role": "model", "parts": "Greetings, I am a very helpful coding assistant that can tackle any coding problem in any programming language and provide solutions to it.  I am a very friendly coding assistant"},
    ]

'''----------------------------------------------connecting to Gemini---------------------------------------'''
'''---------------------------------------------------------------------------------------------------------'''
#retrival of gemini api 
def get_api_key():
    gemini_api = os.getenv("API_KEY")
    client = genai.configure(api_key= gemini_api)

    return client

'''------------------------------------------- chat Response -----------------------------------------------'''
'''---------------------------------------------------------------------------------------------------------'''
def response(prompt):

    model = genai.GenerativeModel('gemini-1.5-flash')
    
    get_api_key()   
    chat = model.start_chat(
        history=chat_history
    )

    chat_history.append({'role':'user', 'parts': [prompt]})
    response = chat.send_message(prompt)
    chat_history.append(response.candidates[0].content)

    return response

'''-----------------------------------------------Chat Backup----------------------------------------------------------------'''

def reset():
    global chat_history 
    
    chat_history = [
        {"role": "user", "parts": "Hello, you have to act like a very friendly cool and intelligent person who have knowledge on variety of topics and is multilingual "},
        {"role": "model", "parts": "Greetings, I am a very helpful coding assistant that can tackle any coding problem in any programming language and provide solutions to it.  I am a very friendly coding assistant"},
    ]

# prompt = "write a descending sort in java"
# response = chat_response(prompt)
# print(response.text)
# prompt = "what is the meaning of life"
# response = chat_response(prompt)
# print(response.text)