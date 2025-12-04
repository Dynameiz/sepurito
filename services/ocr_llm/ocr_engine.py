from paddleocr import PaddleOCR
import numpy as np
import cv2

class OCREngine:
    def __init__(self, lang='en'):
        self.ocr = PaddleOCR(
            use_angle_cls=True,
            lang=lang
        )

    def extract_text(self, image_bytes: bytes):
        np_arr = np.frombuffer(image_bytes, np.uint8)
        img = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

        result = self.ocr.predict(img)
        lines = []
        if not result:
            return ""

        for block in result:
            for line in block:
                lines.append(line[1][0])

        return "\n".join(lines)