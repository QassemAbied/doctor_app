<div align="center">

# 🩺 Doctor App

### Production Ready Telemedicine Application built with Flutter

A modern healthcare platform that allows patients to discover doctors, book appointments, chat in real time, make secure online payments, and receive instant push notifications.

<p align="center">

<img src="assets/readme/home.png" width="260">

</p>

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![Supabase](https://img.shields.io/badge/Supabase-Backend-3ECF8E?logo=supabase)
![Firebase](https://img.shields.io/badge/Firebase-FCM-FFCA28?logo=firebase)
![Stripe](https://img.shields.io/badge/Stripe-Payment-635BFF?logo=stripe)
![Bloc](https://img.shields.io/badge/State-Bloc-blue)
![Architecture](https://img.shields.io/badge/Clean-Architecture-success)

</div>

---

# 📑 Table Of Contents

- Overview
- Features
- Screenshots
- Architecture
- Folder Structure
- Tech Stack
- Backend
- Push Notifications
- Chat
- Payment
- CI/CD
- Installation
- Environment Variables
- Future Improvements

---

# 📱 Overview

Doctor App is a complete telemedicine platform developed using **Flutter** following **Clean Architecture** principles.

The application provides a complete healthcare ecosystem where patients can easily search for doctors, schedule appointments, communicate through real-time chat, pay securely using Stripe, and receive real-time push notifications powered by Firebase Cloud Messaging.

The backend is fully powered by **Supabase**, including Authentication, PostgreSQL Database, Storage, Realtime subscriptions, and Edge Functions.

This project was designed with scalability, maintainability, and production-readiness in mind.

---

# ✨ Main Features

## 👤 Authentication

- Email & Password Authentication
- Secure Login
- Register Account
- Forgot Password
- Reset Password
- Email Verification
- Deep Link Password Reset
- Session Persistence

---

## 🏥 Doctor Discovery

- Browse Medical Specialties
- Recommended Doctors
- Nearby Doctors
- Doctor Details
- Doctor Ratings
- Reviews
- Search by Specialty

---

## 📅 Appointment Booking

- Multi-step Booking Wizard
- Date Selection
- Time Selection
- Appointment Type
- Appointment Confirmation
- Upcoming Appointments
- Completed Appointments
- Cancelled Appointments
- Doctor Schedule Management

---

## 💳 Online Payments

Integrated with Stripe Payment Sheet.

Features include:

- Payment Intent
- Secure Checkout
- Test Mode
- Payment Confirmation
- Edge Function Integration

---

## 💬 Real-time Chat

Real-time messaging powered by Supabase.

Supports:

- Text Messages
- Image Messages
- Voice Messages
- Last Message Preview
- Conversation List
- Auto Scroll
- Read Status

---

## 🔔 Notifications

Integrated with Firebase Cloud Messaging.

Supports:

- Foreground Notifications
- Background Notifications
- Terminated Notifications
- Local Notifications
- Push Notifications
- Notification History
- Notification Read Status

---

## 👨‍⚕️ Doctor Dashboard

Dedicated Doctor Module.

Doctors can:

- View Appointments
- View Patients
- Accept Appointments
- Complete Appointments
- Cancel Appointments
- Chat with Patients
- Receive Notifications

---

## 👤 User Profile

- Edit Profile
- Upload Avatar
- Update Personal Information
- Appointment History
- Notification Center

---

# ⭐ Advanced Features

- Firebase Cloud Messaging
- Firebase Admin SDK
- Supabase Edge Functions
- Stripe Payment Sheet
- Deep Linking
- Voice Recording
- Image Upload
- Realtime Chat
- Local Notifications
- Push Notifications
- Shared Preferences
- Geolocation
- CI/CD
- Fastlane
- Firebase App Distribution
- GitHub Actions

---

# 🏗 Clean Architecture

This project follows a strict Clean Architecture approach.

```
Presentation
     │
     ▼
Use Cases
     │
     ▼
Repository
     │
     ▼
Remote Data Source
     │
     ▼
Supabase / Firebase
```

Each feature is divided into

- Presentation Layer
- Domain Layer
- Data Layer

making the project easy to scale and maintain.

---

# 📂 Project Structure

```
lib
│
├── core
│   ├── constants
│   ├── services
│   ├── helpers
│   ├── utils
│   ├── theme
│   ├── widgets
│   └── dependency injection
│
├── features
│
│   ├── auth
│   ├── onboarding
│   ├── home
│   ├── search
│   ├── profile
│   ├── notification
│   ├── chat
│   ├── doctor_app
│   ├── doctor_profile
│   ├── details_doctor
│   ├── appointment
│   └── book_appointment
│
├── firebase_options.dart
├── main_user.dart
└── main_dev.dart
```

---

# 🛠 State Management

The application is built using **Bloc/Cubit**.

Implemented Cubits include:

- Authentication Cubit
- Home Cubit
- Search Cubit
- Recommendation Cubit
- Notification Cubit
- Chat Cubit
- Doctor Cubit
- Appointment Cubit
- Profile Cubit

Business logic is completely separated from UI.

---

# ⚙ Tech Stack

| Technology | Usage |
|------------|----------------|
| Flutter | Cross-platform development |
| Dart | Programming Language |
| Bloc | State Management |
| GetIt | Dependency Injection |
| Dio | Networking |
| Retrofit | REST API |
| Supabase | Backend |
| PostgreSQL | Database |
| Firebase Messaging | Push Notifications |
| Firebase Admin SDK | Sending Notifications |
| Stripe | Online Payments |
| Shared Preferences | Local Storage |
| Geolocator | User Location |
| Image Picker | Image Upload |
| Audio Waveforms | Voice Recording |
| Just Audio | Audio Playback |

---

# 🔐 Backend Services

The application uses **Supabase** as the primary backend.

### Authentication

- Email Login
- Register
- Password Recovery

### Database

- PostgreSQL

### Storage

- User Images

### Realtime

- Chat Messages

### Edge Functions

- Stripe Payment Intent
- Push Notification Sender



# 📸 Application Screens

---

# 🚀 Onboarding

<table>
<tr>
<td align="center">

### Onboarding 1

<img src="assets/readme/on_boarding1.png" width="250"/>

</td>

<td align="center">

### Onboarding 2

<img src="assets/readme/onboarding2.png" width="250"/>

</td>
</tr>
</table>

---

# 🔐 Authentication

<table>

<tr>

<td align="center">

### Sign Up

<img src="assets/readme/signup.png" width="250"/>

</td>

<td align="center">

### Forgot Password

<img src="assets/readme/forget_password.png" width="250"/>

</td>

</tr>

</table>

---

# 🏠 Home

<table>

<tr>

<td align="center">

### Home

<img src="assets/readme/home.png" width="250"/>

</td>

<td align="center">

### Recommendation

<img src="assets/readme/recommendation_1.png" width="250"/>

</td>

<td align="center">

### Recommendation

<img src="assets/readme/recommendation_2.png" width="250"/>

</td>

</tr>

</table>

---

# 🩺 Medical Categories

<table>

<tr>

<td align="center">

### All Categories

<img src="assets/readme/all_category.png" width="250"/>

</td>

</tr>

</table>

---

# 🔍 Search

<table>

<tr>

<td align="center">

### Search Doctors

<img src="assets/readme/search_1.png" width="250"/>

</td>

<td align="center">

### Search Result

<img src="assets/readme/search_2.png" width="250"/>

</td>

</tr>

</table>

---

# 👨‍⚕️ Doctor Details

<table>

<tr>

<td align="center">

### Doctor Details

<img src="assets/readme/doctor_profile_1.png" width="250"/>

</td>

<td align="center">

### Doctor Reviews

<img src="assets/readme/doctor_profile_2.png" width="250"/>

</td>

</tr>

</table>

---

# 📅 Appointment Booking

### Step 1

<img src="assets/readme/appointment_1.png" width="270"/>

---

### Step 2

<img src="assets/readme/appointment_2.png" width="270"/>

---

### Stripe Payment

<img src="assets/readme/appointment_3.png" width="270"/>

---

### Appointment Summary

<img src="assets/readme/appointment_4.png" width="270"/>

---

# 💳 Stripe Payment Sheet

<p align="center">

<img src="assets/readme/done.png" width="270"/>

</p>

---

# 📆 My Appointments

<table>

<tr>

<td align="center">

### Upcoming

<img src="assets/readme/upcoming.png" width="250"/>

</td>

<td align="center">

### Completed

<img src="assets/readme/completed.png" width="250"/>

</td>

<td align="center">

### Cancelled

<img src="assets/readme/cancelled.png" width="250"/>

</td>

</tr>

</table>

---

# 👤 User Profile

<table>

<tr>

<td align="center">

### Profile

<img src="assets/readme/user_profile.png" width="250"/>

</td>

<td align="center">

### Personal Information

<img src="assets/readme/user_details.png" width="250"/>

</td>

<td align="center">

### Edit Profile

<img src="assets/readme/user_details_2.png" width="250"/>

</td>

</tr>

</table>

---

# 💬 Chat

<table>

<tr>

<td align="center">

### Conversations

<img src="assets/readme/message_user.png" width="250"/>

</td>

<td align="center">

### Chat Screen

<img src="assets/readme/chat_user.png" width="250"/>

</td>

</tr>

</table>

---

# 🔔 Notifications

<table>

<tr>

<td align="center">

### Notification Center

<img src="assets/readme/notification_user.png" width="250"/>

</td>

</tr>

</table>

---

# 👨‍⚕️ Doctor Application

Doctor App has a dedicated dashboard completely separated from the Patient Application.

---

## 🏥 Doctor Home

<img src="assets/readme/doctor_details.png" width="250"/>

<img src="assets/readme/doctor_details_2.png" width="250"/>

---

## 👨‍⚕️ Doctor Profile

<table>

<tr>

<td align="center">

### Doctor Profile

<img src="assets/readme/doctor_profile.png" width="/>

</td>

<td align="center">

### Edit Profile

<img src="assets/readme/doctor_profile_home_2.png" width="/>

</td>


</table>

---

## 👥 Patients

<img src="assets/readme/patients.png" width="270"/>

---

## 👤 Patient Details

<table>

<tr>

<td align="center">

### Details

<img src="assets/readme/patient_details_1.png" width="250"/>

</td>

<td align="center">

### Medical Information

<img src="assets/readme/patient_details_2.png" width="250"/>

</td>

</tr>

</table>

---

## 💬 Doctor Chat

<img src="assets/readme/doctor_message.png" width="270"/>

---

## 🔔 Doctor Notifications

<img src="assets/readme/doctor_notification.png" width="270"/>

---

## 📅 Doctor Appointment Management

<table>

<tr>

<td align="center">

### Completed Appointment

<img src="assets/readme/completed_doctor.png" width="250"/>

</td>

<td align="center">

### Cancelled Appointment

<img src="assets/readme/cancel_doctor.png" width="250"/>

</td>

</tr>

</table>

---

## 🚪 Logout

<p align="center">

<img src="assets/readme/logout.png" width="260"/>

</p>




# 🏛 System Architecture

The application follows **Clean Architecture** with clear separation of responsibilities.

```
                   Presentation Layer
        (Screens • Widgets • Bloc/Cubit)

                        │
                        ▼

                  Domain Layer
      (Use Cases • Repository Contracts)

                        │
                        ▼

                    Data Layer
 (Repository Implementation • Data Sources)

                        │
                        ▼

        ┌───────────────────────────────┐
        │                               │
        ▼                               ▼

   Supabase Backend               Firebase

        │                           │
        ▼                           ▼

 PostgreSQL Database          Firebase Cloud
 Storage                      Messaging
 Authentication               Admin SDK
 Realtime
 Edge Functions
```

---

# 📨 Push Notification Flow

When a patient books an appointment:

```
Flutter App

      │

Book Appointment

      │

Supabase Edge Function

      │

Save Notification

      │

Get Doctor FCM Token

      │

Firebase Admin SDK

      │

Firebase Cloud Messaging

      │

Doctor Device

      │

Local Notification
```

The entire notification flow is server-side, making it secure and preventing exposure of Firebase Admin credentials inside the mobile application.

---

# 💳 Stripe Payment Flow

```
Flutter

      │

Select Appointment

      │

Create Payment Intent

      │

Supabase Edge Function

      │

Stripe Secret Key

      │

Payment Intent

      │

Flutter Payment Sheet

      │

Payment Success

      │

Book Appointment
```

Stripe Secret Key is never exposed to the client application.

---

# 💬 Chat Flow

```
User

      │

Send Message

      │

Supabase Realtime

      │

Database

      │

Realtime Subscription

      │

Doctor
```

Supported message types

- Text
- Images
- Voice Messages

---

# 🔔 Notification Flow

```
Book Appointment

        │

Insert Notification

        │

Push Notification

        │

Notification Screen

        │

Read / Unread Status
```

---

# 🗄 Database

Main tables used inside Supabase

- users
- doctors
- specializations
- appointments
- messages
- notifications

---

# 📦 Dependency Injection

The project uses **GetIt** as the Service Locator.

Benefits

- Loose Coupling
- Testability
- Better Scalability
- Easier Feature Isolation

---

# 🧠 State Management

Implemented using Bloc/Cubit.

Features using Bloc include

- Authentication
- Home
- Recommendation
- Search
- Doctor
- Appointment
- Notifications
- Chat
- Profile

Every feature has its own Cubit and State classes.

---

# 🔒 Security

The project follows several production-ready security practices.

✔ Environment Variables

✔ Supabase Row Level Security

✔ Secure Authentication

✔ Firebase Admin SDK on Server

✔ Stripe Secret Key stored only inside Edge Functions

✔ Service Role Key never exposed inside Flutter

✔ Secure Password Reset via Deep Links

---

# 🌍 Backend

Backend services are implemented using Supabase.

Features include

- Authentication
- PostgreSQL Database
- Realtime
- Storage
- Edge Functions
- Row Level Security
- Server-side Push Notifications

---

# ⚡ CI/CD

Continuous Integration & Delivery is implemented using

```
GitHub

      │

GitHub Actions

      │

Flutter Build

      │

Fastlane

      │

Firebase App Distribution

      │

Android Testers
```

Automated workflow includes

- Flutter Build
- Environment Variables Injection
- Firebase Authentication
- Fastlane Distribution
- Automatic APK Upload

---

# 📋 Environment Variables

Create a `.env` file inside the project root.

```env
SUPABASE_URL=

SUPABASE_ANON_KEY=

STRIPE_PUBLISHABLE_KEY=
```

---

# 🚀 Getting Started

Clone the repository

```bash
git clone https://github.com/QassemAbied/doctor_app.git
```

Install packages

```bash
flutter pub get
```

Run code generation

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the project

```bash
flutter run
```

---

# 🎯 What I Learned

During this project I gained hands-on experience with

- Flutter Clean Architecture
- Bloc State Management
- Repository Pattern
- Dependency Injection
- REST APIs
- Supabase
- Firebase Cloud Messaging
- Firebase Admin SDK
- Stripe Integration
- Edge Functions
- GitHub Actions
- Fastlane
- CI/CD
- Deep Linking
- Realtime Applications

---

# 🚧 Challenges Solved

✔ Real-time Chat

✔ Voice Recording

✔ Audio Playback

✔ Push Notifications

✔ Background Notification Handling

✔ Local Notifications

✔ Stripe Payment Integration

✔ Deep Links

✔ Appointment Scheduling

✔ Doctor Dashboard

✔ User Dashboard

✔ Realtime Messaging

✔ Image Upload

✔ Environment Variables

✔ Automated Deployment

---

# 🔮 Future Improvements

- AI Medical Assistant
- AI Symptom Checker
- Video Consultation
- Electronic Prescription
- Medical Reports OCR
- Calendar Synchronization
- Multi-language Support
- Dark Mode
- Offline Mode
- Doctor Availability Management
- AI Appointment Recommendation
- Medical History Timeline

---

# 📈 Project Statistics

✔ 2 Applications (Patient & Doctor)

✔ 25+ Screens

✔ Clean Architecture

✔ 10+ Features

✔ Realtime Chat

✔ Stripe Payments

✔ Firebase Push Notifications

✔ Supabase Backend

✔ CI/CD Pipeline

✔ Production Ready Structure

---

# 👨‍💻 Author

## Qassem Abied

Flutter Developer

### Connect with me

GitHub

https://github.com/QassemAbied

LinkedIn

https://www.linkedin.com/in/qassem-abied-14bb14233/

---

If you found this project useful, don't forget to ⭐ star the repository.

It motivates me to continue building more open-source Flutter applications.