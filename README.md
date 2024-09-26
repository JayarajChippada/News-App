# 📰 News App

A **Flutter** application that fetches and displays news articles using an external API service like **NewsAPI**. This document provides detailed instructions on how to set up the application and configure the required API key to run it on your local machine.

---

## 📋 Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Getting Started](#getting-started)
   - [Clone the Repository](#clone-the-repository)
   - [Install Dependencies](#install-dependencies)
4. [API Key Configuration](#api-key-configuration)
5. [Running the Flutter Application](#running-the-flutter-application)
6. [App Demo](#app-demo)
7. [Resources](#resources)

---

## 🌟 Introduction

This repository contains a **Flutter** app that retrieves news articles from external APIs, requiring an API key for access. The app is built using **Flutter** and **Dart** and displays news articles with a sleek UI.

---

## 🛠️ Prerequisites

Before you begin, ensure that the following are installed on your local machine:

- ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white) **[Flutter SDK](https://flutter.dev/docs/get-started/install)**
- ![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white) **[Dart SDK](https://dart.dev/get-dart)**
- ![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white) **[Git](https://git-scm.com/)**

---

## 🚀 Getting Started

Follow the instructions below to set up the project locally.

### 📂 Clone the Repository

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/JayarajChippada/News-App.git
```

### 📦 Install Dependencies

Once the repository is cloned, navigate to the project directory and install the necessary dependencies:

```bash
cd news_app
flutter pub get
```

### 🔑 API Key Configuration

To access the news data, you’ll need to configure the NewsAPI key. Follow the steps below:

1. **Get the API Key**: Obtain an API key by registering at [NewsAPI](https://newsapi.org/).

2. **Configure the Key**:
   - Go to the `constants` folder and locate the `globalvariables.dart` file.
   - Update the `apiKey` variable with your obtained API key:

   ```dart
   String apiKey = "<Your-Api-Key>";
   ```

### ▶️ Running the Flutter Application

With everything set up, you can now run the Flutter app using the following command:

```bash
flutter run
```
---
## 🖼️ Screenshots

<div style="display: flex; flex-direction: row; justify-content: space-between;">
    <img src="https://github.com/user-attachments/assets/0ddce0b3-ab2c-4d71-bf65-b274eb27dc1f" alt="Home-page" height="300"/>
    <img src="https://github.com/user-attachments/assets/8158d635-4c4b-40cc-8d24-5b22a778a061" alt="Search-screen" height="300"/>
    <img src="https://github.com/user-attachments/assets/f00d267e-7638-4ec3-bd50-239e01b6b0bb" alt="Profile-screen" height="300"/>
</div>


---

## 🎥 App Demo

Watch the demo of the News App in action:

- [App Demo Video](#) (Link to your demo video)

---

## 🎨 UI Overview

### Screens available:
- **Home Page**: View upcoming flights and explore options.
- **Search Page**: Search for flights and hotel options.
- **Saved Posts Page**: Manage user profile information.

---

## 🤝 Contribution

Contributions are always welcome! Feel free to:
1. Fork the repository
2. Create a new branch (`git checkout -b feature-name`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push the branch (`git push origin feature-name`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for more details.

---

## 📬 Contact

Got questions or feedback? Reach out to me at:

✉️ **Email**: jayarajchippada4@gmail.com

---

## 🌐 Resources

If you're new to Flutter, here are a few resources to help you get started:

- 📘 [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- 🧑‍🍳 [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For detailed Flutter development documentation, visit the official [Flutter docs](https://docs.flutter.dev/), which offers tutorials, samples, and comprehensive API references.

---

🌟 **Get started with Flutter today and join a growing community of developers building beautiful UIs!**

