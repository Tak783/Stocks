# Stocks App
A simple stocks feed app

## Overview 
A simple stocks app that shows a list of stock symbols and prices for a set of stocks parsed from JSON endpoints. The App
1. Handles loading, error and empty states
2. Displays the returned stocks in a list 

<p float="left">
  <img width="200" alt="Stocks Feed" src="https://user-images.githubusercontent.com/3129728/162087633-3109a145-b16a-4d03-bb77-f29a85f7b946.png">
  <img width="200" alt="Empty Stocks Feed" src="https://user-images.githubusercontent.com/3129728/162087639-bfcaf49d-675c-4b1d-9c52-95ff212fb857.png">
  <img width="200" alt="Stocks Feed Error" src="https://user-images.githubusercontent.com/3129728/162087635-a5da7c00-2118-45c0-89eb-6797c5df13be.png">
</p>

## Architecture 
* App is built on top of multiple platform-agnostic frameworks that exist inside their own Swift Packages split into layers. Reasoning and design are discussed in the sections below
* Each layer project(framework) can be built and be tested on its own including the Presentation Layer Application targets.
* There are five layers: Core, Core Components, Core Cash App, Feature and the Presentation layer (Which contains the application targets)
* There is a sixth layer: CorePresentation which was not added
* Layers dependencies are used vertically: each module can import only from layers below 
* The core design pattern used in the Feature layer is MVVM. This is then used in the presentation. 
* MVVM was chosen becuase it allows us to easily separate responsibilities.

### Platform Agnostic Components (Reasoning)
Every layer that exists below the presentation layer is built with platform-agnostic components for the following reasons.
* Easily use in Mac, iOS, iPadOS, Watch OS apps using either UIKit, WatchKit or SwiftUI
* Highly *reusable* components that can easily be used to support other feature layer components and Presentation Layer Application targets
* Faster *build times* for tests, testing suites and projects locally and on pipelines. 
* Easier *collaboration* between teams (everything does not happen in one place)
* Easily use new technologies i.e. SwiftUI or Combine
* Applied Engineering business organisation considerations for *open-sourcing* capability, *hiring* and *demo apps* as layer components are independently relying on abstractions rather than concrete implementation. It is also very easy to bring on new technologies such as SwiftUI.

### Design and Development (Discussion) 
* Built applying SOLID principles with a relatively extensive Unit and Integration testing suite. The Snapshot & UITests will come.
* App Built in a TDD way, ensuring that functionality works as expected and also providing protection from regressions 
* A simple UI with Accessibility features in place including Dynamic type, Bold Text, Voice Over amongst others and also Dark Mode as a bonus
* Business and engineering organisations considerations were made when constructing this project as discussed in the previous section.

## Architectural decisions 

### Layers (overview)
* As seen in the overview, the app has four layers: Core Shared Utilities, Core Shared Components, Shared Features and the Application Target layer
* Each module lives in its own independent project with as few dependencies as possible, contains its own tests, this way each feature can be
   *  Built-in isolation without building the entire Presentation Layer Target 
   *  Be highly reusable, open sourceable and able to be used in demo apps
   *  Be platform agnostic usable in any presentation application target platform
* Vertical dependencies: each layer contains modules used as dependencies by higher-level modules. Modules can import only from the layers below. 

### Core Shared Utilities (explained)
Contains foundational shared frameworks to be shared across all above layers including presentation. These are base level ground 0 layers i.e those that extend Apples foundation framework.
* CoreFoundational: contains extensions to the `Foundation` framework. These are used across Feature frameworks and the app.
* CoreTesting: contains extensions to `XCTest` and helpers to used to support the Testing Suite across the project 

### Core Components (explained)
Contains shared ground level components such as the networking layer. Other examples can be Local Persistace and Keychain components. It has the following components
* CoreNetworking: Which is the networking layer
* MockNetworking: The mock networking layer 

### Core Cash app (explained)
Containes shared ground level cash app components i.e CashAppFoundation. The components in this layer should be level zero cash app components to be used in the above layers i.e. the feature layer. These components can include number, date formatters, core logic. *Under no circumstance* must there be any UI code in this layer. This is is reserved for presentation layers i.e. CoreCashAppPresentation. This layer contains.
* CashAppFoundation: Which contains Cash App Specific extensions to the Apples Foundation layer

### Feature Layer (explained)
Contains modules containing features used in Presentation Application Targets. The layer contains the following modules. These features again must be platform agnostic so they can be used in any Presentation Layer Application Targets. So no UI code *Under any circumstances*
* StocksFeedFeature: Feature to show the stocks feed. It has an API, Service and Presentation Layer ViewModels

### Application Target Presentation Layer (explained)
Application Target Layer: Where apps Mac, iOS, iPadOS, Watch OS use the feature frameworks to present features for users
* StocksiOSApp: A simple client to display the Stocks Feed   

## How to navigate the project 
As discussed above, the overall project has multiple layers. Dive in.
1. You can easily see how all of this works by opening `*/Stocks.xcworkspace`
2. The layer dependencies can be run and tested independently in their packages
3. The iOS app is in that workspace and can be ran from there too
4. Layers can be found in the `/Layers` folder
5. If you just want to see the iOS target navigate to `/Layers/Presentaion.xcodeproj`

### Warnings  
* Main Branch is `Dev`, view and branch of from here.

## Improvements 
There are many optimisations and improvements I can make across the project across the presentation App and Targets (open to discuss), but the following are some of the core changes I'd like to make.
* App mostly has business logic tested. 
* More Unit Integration tests could have been written. UI / Snapshot and possibly End to End tests could be been added to secure the app from regressions
* To separate navigation from presentaion Coordinators can be added.
* A sixth layer CorePresentation could be added. It would sit inbetween the Feature and Presention layer. It would house modules such as CoreUIKit which will contain extensions to UIKit. Same could be done for Watch, and SwiftUI.
* Strings were not localised but should be 
* Accessibilty was considered in some places but not all. In production it would be a first class citizen but for the purpose of this project it is not.
* There are so many  things in the actual code that could be improved i.e. moving functions resuable code int extensions or helpers or things putting items such as `UIView+Accessibility` into the appropriate layer modules.

##User Story
Load Stocks Feed: Load and shows a list of stock symbols and prices for a set of stocks parsed from JSON endpoints

**Acceptance Criteria **
AC1: Feed shows loading indicator when the feed API call starts  
Given that as user I have opened the app
Then I should see a loading indicator as the feed loads 

AC2: Feed hides loading indicator when the feed API call succeeds 
Given that as user I have opened the app and the feed is loading 
When when the feed API call suceeds 
Then the loading indicator disapears

AC3: Feed hides loading indicator when the feed API call fails 
Given that as user I have opened the app and the feed is loading 
When when the feed API call fails
Then the loading indicator disapears

AC4: Feed is visible to user when the feed API call succeeds and returns usable data 
Given that as user I have opened the app and the feed is loading 
When when the feed API call suceeds and returns usable data 
Then the loading indicator disapears
And the a list of stocks is visible to the user

AC4: Feed empty state is visible to the user when the feed API call succeeds and returns empty no data  
Given that as user I have opened the app and the feed is loading 
When when the feed API call suceeds but returns no usable data 
Then the loading indicator disapears
And the empty feed state is visible to the user

AC4: Error alert is shown when the load feed API call fails 
Given that as user I have opened the app and the feed is loading 
When when the feed API call fails 
Then the loading indicator disapears
And the an error alert is shown
