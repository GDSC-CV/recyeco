# Recyeco
<p align = "center">
  <img src="https://user-images.githubusercontent.com/119331529/229814912-35bd887e-2ef1-4477-9dca-f4e8b5e13375.png"/>
</p>
This is a recycling app that helps users quickly understand how to properly identify various types of recyclable materials.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)

## Features

This app includes the following features:

- **Password Reset:** Users can reset their password via email if they forget it.
- **Recyclings Scanning:** Users can use their device's camera to take a photo of a recyclable material, and the app will use OpenCV image processing and deep learning database to classify the recyclings.

- **Related Articles:** Users can read articles related to recycling and sustainable living, to learn more about how to reduce their environmental impact.
- **Friend Invitations:** Users can invite their friends to join the app and compete on a recycling leaderboard.

- **Friend Leaderboard:** Users can compete for the top spot on the leaderboard.
- **Notifications:** Users receive reminders to log in and recycle daily.

<p align = "center">
  <img src="https://user-images.githubusercontent.com/119331529/229819645-a9972156-12fa-4463-92b4-be500edef10f.gif"/ width = 20%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://user-images.githubusercontent.com/119331529/229820590-efe63904-adc9-449c-9ecc-dc063a183820.gif"/ width = 20%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://user-images.githubusercontent.com/119331529/229822414-e33f8529-f189-4a4e-8627-41c74148a955.gif"/ width = 20.4%>
</p>

## Tech Used

<img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=Firebase&logoColor=white"/> <img src="https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=Flutter&logoColor=white"/> <img src="https://img.shields.io/badge/OpenCV-5C3EE8?style=flat-square&logo=Opencv&logoColor=white"/> <img src="https://img.shields.io/badge/Kaggle-20BEFF?style=flat-square&logo=Kaggle&logoColor=white"/> <img src="https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=Kaggle&logoColor=white"/>

- **Firebase:** Firebase Authentication and Cloud Firestore were used to handle user authentication and data storage.
- **Flutter:** Flutter was used to build the mobile app interface.
- **Kaggle:** Kaggle is a website where we collected recycling images for machine learning.
- **OpenCV:** OpenCV was used for image processing and object recognition, to classify the recyclings from user photos.
- **Deep Learning:** Deep learning models were used to train the image recognition algorithm for classifying the recyclings.
- **Firebase Cloud Messaging:** Firebase Cloud Messaging was used to send push notifications to users.

## Getting Started

To get started with **Recyeco**, follow these steps:

1. Sign up using your email to create an account and set up your password. Once you forget your password, our app will send you an email containing a link to reset your password.
2. Take a photo or upload a photo of your recyclables.
3. Our app will quickly and accurately identify the type of recyclable material you have.
4. When you successfully recycle your material, you'll earn points towards your account.
5. You also can read articles on our app to earn points!
6. Keep earning points to compete with your friends and climb up the leaderboard!
