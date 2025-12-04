# Sepurito Monorepo

A unified monorepo containing all major components of the **Sepurito** ecosystem: mobile app, web app, API server, and OCR+LLM service.

---

## 📁 Project Structure

```
sepurito_monorepo/
│
├── client/
│   ├── mobile/        # Flutter mobile application
│   └── website/       # NuxtJS (Vue) web application
│
├── server/
│   └── api/           # NestJS backend API service
│
└── service/
    └── ocr_llm/       # OCR + LLM microservice (FastAPI or similar)
```

---

## 🧰 Tech Stack

### **Mobile**

* Flutter

### **Website**

* NuxtJS (Vue 3)
* TailwindCSS

### **Backend API**

* NestJS
* PostgreSQL / MySQL (or any ORM-supported DB)

### **OCR + LLM Service**

* FastAPI
* OCR Engine (e.g., EasyOCR, PaddleOCR)
* LLM (OpenAI, Google Gemini, or Local model)

---

## 🚀 Getting Started

### 1. Clone the Repository

```
git clone https://github.com/yourname/sepurito_monorepo.git
cd sepurito_monorepo
```

---

## 📦 Setup Instructions

### **Mobile (Flutter)**

```
cd client/mobile
flutter pub get
flutter run
```

---

### **Website (NuxtJS)**

```
cd client/website
npm install
npm run dev
```

Access at: **[http://localhost:3000](http://localhost:3000)**

---

### **API Server (NestJS)**

```
cd server/api
npm install
npm run start:dev
```

---

### **OCR + LLM Service (FastAPI)**

```
cd service/ocr_llm
python -m venv venv
source venv/bin/activate   # Windows: venv\Scripts\activate
pip install -r requirements.txt
uvicorn main:app --reload
```

Access docs at: **[http://localhost:8000/docs](http://localhost:8000/docs)**

---

## 🔄 Git Workflow Suggestion

* `main` → production-ready code
* `dev` → development branch
* `feature/*` → feature branches per module

```
git checkout -b feature/website-homepage
```

---

## 🌐 Deployment Strategy

* **Mobile**: Play Store / internal APK downloads
* **Website**: Vercel or Netlify
* **API & OCR/LLM services**: Docker + VPS or Render

---

## 📜 License

MIT or your chosen license.

---

## 🙌 Contributors

* HN (Founder / Developer)
