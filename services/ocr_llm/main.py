from fastapi import FastAPI, File, UploadFile
from dotenv import load_dotenv
from ocr_engine import OCREngine
from llm_engine import LLMEngine
import json

load_dotenv()

ocr_engine = OCREngine()
llm_engine = LLMEngine()

app = FastAPI()

@app.post("/process")
async def process_receipt(file: UploadFile = File(...)):
    image_bytes = await file.read()

    ocr_text = ocr_engine.extract_text(image_bytes)
    llm_result = llm_engine.extract_fields(ocr_text)

    try:
        parsed = json.loads(llm_result)
        return parsed
    except:
        return {
            "ocr_text": ocr_text,
            "llm_result": llm_result
        }