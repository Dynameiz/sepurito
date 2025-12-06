# Sepurito

<img width="1057" height="525" alt="sepurito" src="https://github.com/user-attachments/assets/33819a94-bf3c-41d2-864c-12d089649f95" />

A unified ecosystem for receipt scanning, smart bill splitting, and streamlined group expense management.

This monorepo contains all major components of the Sepurito platform, including the mobile app, website, and backend API.

---

## 📁 Project Structure

```
sepurito_monorepo/
│
├── client/
│   ├── mobile/        # Flutter mobile application
│   └── website/       # NuxtJS (Vue) web application
│
└── server/
    └── api/           # NestJS backend API service
```

---

## 🧰 Tech Stack

### **Mobile**

* Flutter

### **Website**

* NuxtJS
* TailwindCSS

### **Backend API**

* NestJS
* PostgreSQL

### **Receipt Text Extraction**

* ML Kit Text Recognition (on-device)
* Firebase AI Logic (Gemini 2.5 Flash)

---

## 🚀 Getting Started

### 1. Clone the Repository

```
git clone https://github.com/Dynameiz/sepurito.git
cd sepurito
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

Access docs at: **[http://localhost:8000/docs](http://localhost:8000/docs)**

---

## 🌐 Deployment Strategy

* **Mobile**: Internal APK downloads
* **Website**: Vercel
* **API services**: Vercel

---

## 🙌 Contributors

* Hans William Christianto Wijaya (Founder / Developer)
