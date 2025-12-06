# Sepurito

A modern mobile application for receipt scanning, smart bill splitting, and seamless group expense management — powered by **Flutter**, **ML Kit Text Recognition**, and **Firebase AI Logic (Gemini 2.5 Flash)**.

---

## 📱 Overview

The Sepurito mobile app helps users:

* Scan receipts quickly using **ML Kit's on-device OCR**
* Clean and structure extracted data using **Firebase AI Logic**
* Automatically split bills among participants
* Apply tax & service charges
* Export final results

---

## 🧰 Tech Stack

### **Mobile (Flutter App)**

* Flutter 3+
* Google ML Kit (Text Recognition)
* Firebase AI Logic (Gemini 2.5 Flash)

---

## 📂 Folder Structure (Mobile)

```
client/mobile/
│
├── lib/
│   ├── features/          # App features (scan, split bill, summary, etc.)
│   ├── components/        # Shared UI widgets
│   ├── models/            # Data models (Receipt, Item, Participant, SplitBill)
│   ├── services/          # ML Kit + Firebase AI Logic integrations
│   └── main.dart          # Entry point
│
├── android/               # Android native config
├── ios/                   # iOS native config
└── pubspec.yaml           # Dependencies
```

---

## 🚀 Getting Started

### Install Dependencies

```
flutter pub get
```

### Run the App

```
flutter run
```

---

## 🔍 Receipt Scanning Pipeline

The mobile app uses a **two-stage extraction process** designed for accuracy and speed.

### **1. Text Recognition – ML Kit (On-Device)**

* Fast
* Extracts raw OCR text from captured receipt images

### **2. Structuring – Firebase AI Logic (Gemini 2.5 Flash)**

Gemini receives the OCR text and returns structured JSON:

```json
{
  "items": [
    { "name": "Nasi Goreng", "quantity": 1, "price": 20000, "subtotal": 20000 }
  ],
  "tax": 10,
  "service": 5,
  "total": 23000,
  "category": "food"
}
```

---

## 📦 Build Release APK

```
flutter build apk --release
```

The APK will appear in:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 👤 Author

Hans William Christianto Wijaya
