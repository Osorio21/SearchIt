# SearchIt!
Onramp/Realtor.com: Pre-Interview Project

## Purpose

The purpose of this application, SearchIt!, is to provide users the opportunity to retrieve perintent business information in an easily viewable and navigable format. Users will enter the product category, relevant geographical location, desired number of results, and sorting parameters. Through an API call to the Foursquare Places API, the application will decode the JSON data and return a number of locations in a table matching the user specifications. Clicking upon any table cell will transfer users to another screen with additional details about the selected business.

## Architectural Overview of SearchIt!

### Files

#### **Model**

##### > API_Constants

Contains all relevant URL data for FourSquare Places API call in a struct named *Foursquare_API_Constants*.

##### > Business

Contains Business struct that contains specified properties for business that are retrieved via API Call. Also, contains JSON decoder method.

##### > Businesses

Contains struct with properties to extract details from most external JSON container. 

##### > BackgroundScreenColor

Struct that presents a gradient layer for backgrounds.

##### > InputValues

Dummy struct used for testing before implementing JSON calls. 

##### > APICallFunction

Contains code that presents a function for url creation and API Call.

#### **Home Screen**

##### >  HomeScreenController

Contains view controller presenting home screen of app. Contains code for app title, start button, and background color properties. 

#### **Input Screen**

##### > InputTextController

Presents input screen for data to be used in API call. Composed of text labels, text fields, a gradient layer background, and an input button. Class conforms to APIInformation protocol to send input data to thrid screen upon user press.

#### **Business Screen**

##### BusinessTableViewController

Presents a table of relevant businesses based on user input data. Business info includes name and address. Clicking on a cell transfers user to the BusinessDetailsViewController.

#### **DetailViewScreen**

##### BusinessDetailsViewController

#### **View Objects**

##### Transition Button

Custom UIButton class with defined label, color, and shadow properties used for transtioning to new view controller upon being pressed.

##### Title Label

Custom UILabel class with text and shadow properties used for app title on *Home Screen*.

##### InputField

Custom UITextField class with defined placeholder text and border properties used for input gathering in *Input Screen*. 

##### InputLabel

Custom UILabel class with defined text and font properties used as headings for *InputFields*.

##### ViewAnimation

Function defined in extension of UIView that provides custom shaking animation.

#### **Assets**

Borrows collection of colors and assets from Apple's UKit tutorials. These colors are used in some list cell backgrounds and symbols. Additionally, stock image of globe is borrowed for initial screen.


## Architectural Design Pattern

### MVC Architecture

MVC design pattern assigns objects in an application a role as a model, view or controller. Roles, however, can be merged allowing an object to fulfill two roles such as a view controller or a model controller. This pattern defines the purpose of an object in the application and the ways it communicates with other parts of the applciation. Software that adheres to this pattern generally is scalable, maintainable, well-defined and testable. 

Model objects encapsulate the data specific to an application and define the logic and computation that manipulate and process that data. Ideally, a model object should have no explicit connection to the view objects that present its data. It should not be concerned with user-interface and presentation issues. 

A view object is an object in an application that users can see. A view object knows how to draw itself and can respond to user actions. A major purpose of view objects is to display data from the application’s model objects and to enable the editing of that data. 

A controller object acts as an intermediary between one or more of an application’s view objects and one or more of its model objects. Controller objects are thus a conduit through which view objects learn about changes in model objects and vice versa.

One can merge the MVC roles played by an object, making an object fulfill both the controller and view roles. This is called a view controller. A view controller is a controller that concerns itself mostly with the view layer. Its primary responsibilities are to manage the interface and communicate with the model. Action methods concerned with data displayed in a view are typically implemented in a view controller.

This application adheres to the MVC design pattern. Model objects located in the *Model* folder house data for the application and the computation for manipulating the data. For example, the *API_Constants* file houses data and logic on the URL that will used in the API call. The *Business* file contains select properties for any business searched by the user. Additionally, this file also contains code for the JSON decoding process. Views are held in a separate location with no direct influence on the models. *Transition Button* contains a custom UIButton with predefined properties and *ViewAnimation* provides custom animations on UIView objects. The view controllers are hybrid models that contain some info on view objects and also functionality to bridge communication between view and model objects. For example, *InputTextController* contains data on view objects such as *InputLabel* but also functions for communicating with the model data.


## Overall User Flow and Specific Design Decisions

Application was designed using UIKit programmatically. Upon running application, users are presented by the Home Screen which is controlled by the *HomeScreenController*. Relative to appearance, the home screen has a custom color gradient background, application title text, and a button that transitions to the *InputTextController*. *InputTextController* is designed with custom text labels and text fields, a slider, and a picker view. Users can enter relevant data and press the InputIt! button to shift to the *BusinessTableViewController*. If acceptable data was inputted, users are presented with a multi-color table of businesses depedning on the input parameters. At the bottom of the table view is a back button for users to transition back to the *InputTextController* for a new search. Pressing any business table cell tarnsitions users to the *BusinessDetailsViewController*.

## UI Components Utilized

+ UIColor
+ UITableView
+ UILabel
+ UIFont
+ UIButton
+ UIImage
+ UIPickerView
+ UISlider
+ UIView

## Screenshots of Simulator

See *Screenshots* folder.

## Further Development Concerns

### Debugging

SearchIt! application has undergone minimal debugging and testing. While there is some error handling, not enough has been developed yet to handle any situation. For example, erroneous user input on the *Input Screen* can cause errors during the API call. Additionally, some API calls with nil return values may disrupt presentation of business info in the views. Currently, only one word cities are allowed. 

### Additional Features

SearchIt! is designed to provide users with business options based on search criteria. Users, however, would want more data at their fingertips to make the most informed decision. With more development time, additional features can expand the application's reach in a competitive landscape. Some notable UI considerations to improve are better animations, more thoughtful backgrounds, and enhanced button designs. Another feature that would expand SearchIt!'s capabilities include utilization of a map API to provide a view of the locations relative to the user. Lastly, extra data such as recent reviews and images from a variety of sources would be greatly helpful to the user. 


