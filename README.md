# News App 

## Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Getting Started](#getting-started)
   - [Clone the Repository](#clone-the-repository)
   - [Install Dependencies](#install-dependencies)
4. [API Key Configuration](#api-key-configuration)
5. [Running the Flutter Application](#running-the-flutter-application)

## Introduction

This repository houses a Flutter application that makes use of certain APIs requiring an API key for access. This document provides detailed instructions on how to set up and run the Flutter application, along with guidance on configuring the necessary API key.

## Prerequisites

Before you begin, ensure that you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Git](https://git-scm.com/)

## Getting Started

### Clone the Repository

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/JayarajChippada/News-App.git
```

### Install Dependencies

Navigate to the project directory and install the dependencies:

```bash
cd news_app
flutter pub get
```

### API Key Configuration

To run the application successfully, you need to obtain an API key for the required services. Follow these steps:

  1. Service API Key: Acquire an API key from the (https://newsapi.org/) service provider for the API used in the application.

  2. Constants File: Under constants folder, in globalvariables file update the apiKey variable with your api key.

```bash
String apiKey = "<Your-Api-Key>"
```

### Running the Flutter Application

Use the following commands to run the Flutter application:

```bash
flutter run
```
This will build and run the application on a connected device or emulator.

### App Demo
- [Video Link](https://drive.google.com/file/d/1orvyJHpQSclpR9uqDJMqOE5beiMIE_tM/view?usp=sharing)

## Resources:
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
"# Eighty7 Financial Planners" 
