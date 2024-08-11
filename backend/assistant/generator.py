from assistant import gemini_api
import google.generativeai as genai

genai.configure(api_key= gemini_api)

model = genai.GenerativeModel(model_name='gemini-1.5-pro', tools='code_execution')

response = model.generate_content(
    ('What is the sum of the first 50 prime numbers? Generate and run code for the calculation, and make sure you get all 50.'))

print(response.text)