from assistant import gemini_api
import google.generativeai as genai

genai.configure(api_key= gemini_api)

model = genai.GenerativeModel(model_name='gemini-1.5-pro')
chat = model.start_chat(
    history=[
        {"role": "user", "parts": "Hello"},
        {"role": "model", "parts": "Great to meet you. What would you like to know? I am a very helpful coding assistant"},
    ]
)

response = chat.send_message("write me a program for firebase authentication in java?")
print(response.text)
response = chat.send_message("Also for google sign in?")
print(response.text)