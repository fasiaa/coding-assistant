import google.generativeai as genai
import os 
import dotenv

dotenv.load_dotenv()

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
    history=[
        {"role": "user", "parts": "Hello"},
        {"role": "model", "parts": "Great to meet you. What would you like to know? I am a very helpful coding assistant"},
    ]
    )


    response = chat.send_message(prompt)

    return response

'''-----------------------------------------------Chat Backup----------------------------------------------------------------'''

prompt = "write a descending sort in c++"
response = chat_response(prompt)
print(response.text)
prompt = "write a merge sort"
response = chat_response(prompt)
print(response.text)