# Table of Contents
1. [Description](#description)
2. [Getting started](#getting-started)
3. [Arhitecture](#arhitecture)
4. [Structure](#structure)
5. [Running the tests](#running-the-tests)
6. [Deployment](#deployment)
7. [Dependencies](#dependencies)
8. [API](#api)

# WeatherForecast
A simple app to hit the Open Weather Map API and show the weather data based on entered city name.
<strong>Note:</strong> As of now only Indian city names are acceptable. Ex. Delhi, Pune, Kerla, Patna, Goa, Shimla, Jaipur, Manali etc

# Description
<p>The WeatherForecast project is a simple and straightforward weather forecast sample application.<br>
It consume WeatherForecast APIs and showing weather data based on entered city name<br> 
</p>

# Getting started
<p>
1. Make sure you have the Xcode version 15.0 or above installed on your computer.<br>
2. Download the WeatherForecast project files from the repository.<br>
3. Open the project files in Xcode.<br>
4. Wait for SPM depedency to be downloaded.<br>
5. Review the code and make sure you understand what it does.<br>
6. Run the active scheme.<br>
You should see the content in tableView.<br></p>

# Architecture
* WeatherForecast project is implemented using the <strong>Model-View-ViewModel (MVVM)</strong> architecture pattern.
* Model has any necessary data or business logic needed to get list of most popular acticles.
* View is responsible for displaying the list of article in TableView, such as printing it to the console.
* Controller handles any user interactions and update the Model and View as needed.

# Structure 
* "Utility": Files or resources that are shared across multiple parts of the project. Such as utility classes, global constants, or reusable UI elements.
* "Modules": The source code files for a specific module. Files within a module folder are organized into subfolders, such as "Views" or "Models".
* "Resources": Non-code files that are used by the project. These can include images, audio files, video files, and other types of assets. 
* "APIManager": Files or classes related to communicating with an external API. This could include code for making HTTP requests to a web server, parsing responses, and handling any errors that may occur.

# Running the tests
<p>The WeatherForecast project can be tested using the built-in framework XCTest.<br>
To start testing the project, you will need to create a new test target in your Xcode project, 
and then add test files to that target.<br>These test files should be placed in the "test" folder, following the project structure.
Once you have created your test files, you can write test functions using the XCTest</p>

# Deployment
Keep in mind that deploying an iOS app to the App Store requires having an Apple Developer account.

1. Click on the "Product" menu in Xcode and select "Archive." This will create an archive of your project.
2. Once the archive has been created, select it in the Organizer window and click on the "Validate" button to perform some preliminary tests on the app.
3. Once validation is complete, click on the "Distribute" button and select "Ad Hoc" or "App Store" distribution. 
This will create a signed IPA file that can be installed on iOS devices.
4. Follow the prompts in the distribution wizard to complete the distribution process.
5. Once the distribution is complete, you can use the IPA file to install the app on iOS devices

# Dependencies
[SPM](Swift Package Manager) is used as a dependency manager.
List of dependencies: 
* 'ProgressHUD' -> A convenient and intuitive HUD tool designed specifically for iOS which enables seamless presentation of concise alerts or notifications to users of your app in a simple and non-disruptive way.


# API 
* We are using a REST API
* List of API calls is [here](https://api.openweathermap.org/) 
