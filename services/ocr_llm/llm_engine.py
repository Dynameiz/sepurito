from google import genai
import os


GENERATION_PROMPT = '''
You are a receipt parser. Convert the OCR text into structured JSON.

OCR Text:
{ocr_text}

Return ONLY valid JSON in the following format:
{{
    "items": [
        {{
            "name": "string",
            "quantity": 0,
            "price": 0
        }}
    ],
    "tax": 0,
    "service": 0,
    "total": 0
}}
'''

class LLMEngine:
    def __init__(self):
        api_key = os.getenv("GEMINI_API_KEY")
        if not api_key:
            raise ValueError("GEMINI_API_KEY environment variable not set.")
        self.client = genai.Client(api_key=api_key)

    def extract_fields(self, ocr_text: str):
        prompt = GENERATION_PROMPT.format(ocr_text=ocr_text)
        response = self.client.models.generate_content(
            model="gemini-2.5-flash",
            contents=prompt
        )
        return response.text