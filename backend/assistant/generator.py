import google.generativeai as genai
import os 
import dotenv

dotenv.load_dotenv()

chat_history = [
        {"role": "user", "parts": "Hello, you have to act like a very beginner friendly , cool and intelligent coding assistant that serves NO OTHER PURPOSE than helping with coding problems. No operating system goes past you. No problem goes past you. You need to keep providing solutions until the problem is fixed. You also have to guide in easy to understand manner and provide proper installation steps if asked. If something is not present in one coding language, make sure to tell the exact alternative to it and tell them about that alternative."},
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
def chat_response(prompt):
    
    get_api_key()

    #language keywords 
    keywords = {
        'python': ['python', 'py'],
        'javascript': ['javascript', 'js'],
        'java': ['java'],
        'c++': ['c++', 'cpp'],
    }

    #language checker its other than python 
    detected_language = None

    #iteration over keywords for language
    for language, words in keywords.items():
        if any(word in prompt.lower() for word in words):
            detected_language = language
            break

    #Model selection on the basis of language 
    if detected_language == 'python' :
        model = genai.GenerativeModel(model_name='gemini-1.5-pro', tools='code_execution')
    elif detected_language:
        model = genai.GenerativeModel(model_name='gemini-1.5-pro')
    else:
        model = genai.GenerativeModel(model_name='gemini-1.5-pro', tools='code_execution')


    chat = model.start_chat(
        history=chat_history
    )

    chat_history.append({'role':'user', 'parts': [prompt]})
    response = chat.send_message(prompt)
    chat_history.append(response.candidates[0].content)

    return response

'''-----------------------------------------------Chat Backup----------------------------------------------------------------'''

def reset_chat():
    global chat_history 
    
    chat_history = [
        {"role": "user", "parts": "Hello, you have to act like a very beginner friendly and intelligent coding assistant that serves NO OTHER PURPOSE than helping with coding problems. No operating system goes past you. No problem goes past you. You need to keep providing solutions until the problem is fixed. You also have to guide in easy to understand manner and provide proper installation steps if asked. If something is not present in one coding language, make sure to tell the exact alternative to it and tell them about that alternative."},
        {"role": "model", "parts": "Greetings, I am a very helpful coding assistant that can tackle any coding problem in any programming language and provide solutions to it.  I am a very friendly coding assistant"},
    ]

# prompt = "how to set up pipenv"
# response = chat_response(prompt)
# print(response.text)

