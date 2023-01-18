# SearchIt!
Onramp/Realtor.com: Pre-Interview Project

## Purpose

The purpose of this application, SearchIt!, is to provide users the opportunity to retrieve perintent business information in an easily viewable and navigable format. Users will enter the product category, relevant geographical location, desired number of results, and sorting parameters. Through an API call to the Foursquare Places API, the application will decode relevant JSON data and return a number of locations in a table matching the user specifications. Clicking upon any table cell will transfer users to another screen with additional details about the selected business. Users can gain gain further insights by clicking a map button to present a map showing routes connecting the current user location to the selected business's location.

## Architectural Overview of SearchIt!

### Files

#### **Models**

##### > API_Constants

Struct that contains all relevant URL data for FourSquare Places API call. Properties are set after user inputs text in *InputTextController* and presses the input button. 

##### > Business

Contains decodable Business struct that contains specified properties for Business objects that are created after API call and JSON decoding process. Business objects are later used to populate data in multiple table cells and for location plotting in maps.

##### > Businesses

Contains decodable struct with properties to extract list of Business objects from most external JSON container. 

##### > BackgroundScreenColor

Struct that presents a gradient layer for custom backgrounds.

##### > InputValues

Dummy struct used for testing before implementing API calls. 

##### > APICallFunction

Contains class that has a function that initiates API call and JSON decoding process. Result of function is transferred to the *BusinessTableViewController* as a list of Business objects via delegate pattern. 

##### > Business Location

Custom class for MKMapView annotations used in creating info pop-up for businesses.

#### **HomeScreen**

##### >  HomeScreenController

Contains view controller (UIViewController) presenting home screen of app. Contains code for app title text (custom UILabel), start button (custom UIButton), and background color properties (custom color gradient struct). HomeScreenController also contains code for a globe image (UIImage) located in the center of the view with some basic animations. Animation code is found in the *ViewAnimation* file in the *View Objects* folder. Code for custom text label and custom button is found in the *TitleLabel* and *TransitionButton* files in the *View Objects* folder, respectively. Start button is coded to present the *InputTextController* upon being pressed.

#### **Input Text Screen**

##### > InputTextController

Contains view controller (UIViewController) presenting four input text fields (custom UITextField), four category text labels (custom UILabel), a slider connected to a text field, and a picker view connected to another text field. 

Categories are:

+ Category
+ City,State
+ Max # of Results
+ SOrt by

Confroms to both the UIPickerViewDelegate and UIPickerViewDataSource protocols. Along with the aforementioned, this view controller contains code for background color properties and for splitting location input into separate city and state strings. Text field code is found in the *InputField* file in the *View Objects* folder. Code for custom text label and custom button is found in the *InputLabel* and *TransitionButton* files in the *View Objects* folder, respectively. Input button is coded to present the *BusinessTableViewController* upon being pressed after all text fields are filled. 

##### > ITCPickerConfig

Extension of InputTextController that contains picker configuration functions. These functions determine number of components, number of rows, title for rows, and action upon selecting a row.

##### > ITCActions

Extension of InputTextController that contains action functions for updating text field upon slider movement, for determing screen transition button status based on user input, and for presenting the BusinessTableVIewController upon pressing the transition button. 

#### **Business Screen**

##### BusinessTableViewController

Contains view controller (UITableViewController) presenting a table of business cells listing name and address information. URL data from *InputTextController* was trasnferred to this view controller after transition button was pressed. *APICallFunction* is called from the viewDidLoad() method with the collected URL data. Use of delegate pattern (custom APICALL protocol) allows decoded JSON response to be set in variable defined in the *BusinessTableViewController*. Table data is reloaded and the table cells are populated with preliminary business data. Contains code for back button (custom UIButton) placed with a footer view, background color properties (custom color gradient struct), and configuration functions for customizing the text and color winth each cell. Back button is coded to present the *InputTextController* upon being pressed. Users transition to the *BusinessDetailsViewController* upon pressing any table cell. Specific Business object is transferred upon press of button.

##### BTVCTableConfig

Extension of BusinessTableViewController that contains configuration functions for setting number of table rows and height of table rows.

#### **DetailViewScreen**

##### BusinessDetailsViewController

Information transferred from the *BusinessTableViewController* is presented here. View shows a table of the selected business with a variety of information in cells including the:

+ name
+ address
+ phone 
+ website
+ description
+ tips

Code includes text cell configuration methods and a method for parsing the Tips array (property of Business) into a string. Addiitonally, a button transitioning to the *MapViewController* can be found in the footer of the table and a button presenting the *BusinessTableViewController* can be found in the table header. 

##### BDVCTableConfig

Extension of BusinessDetailsViewController that contains configuration functions for setting number of table sections, table cell height, number of rows per section, and header text properties.


#### **Map Screen**

##### MapViewController

Presents a map (MKMapView) placed via storyboard with the user location and an annotated pin of the selected business location (via Business object transferred from *BusinessDetailsViewController*). Methods for creating direction request connecting the two locations and presenting the routes on the map are contained here. Class also contains code for custom business annotation pin and alert with additional details. Lastly, there is code for a back button that dismisses the map view upon being pressed.

##### MapViewLocationExtension

Extension to MapViewController that provides methods for setting up CLLocation() object. Additionally, there are methods for determining and plotting user location on the map view. Extension has methods for checking location authorization as well.

#### **View Objects**

##### Transition Button

Custom UIButton class with defined label, color, and shadow properties primarily used for transtioning to new view controller or dismissing current controller upon being pressed.

##### Title Label

Custom UILabel class with text and shadow properties used for app title on *Home Screen*.

##### InputField

Custom UITextField class with defined placeholder text and border properties used for input gathering in *InputTextController*. 

##### InputLabel

Custom UILabel class with defined text and font properties used as category headings for *InputFields*.

##### ViewAnimation

Function defined in extension of UIView that provides custom shaking animation for globe image in primary screen.

#### **Assets**

Borrows collection of colors and assets from Apple's UKit tutorials. These colors are used in some list cell backgrounds and symbols. Additionally, stock image of globe is borrowed for initial screen.


**Additional comments can be found in each file mentioned.**


## Architectural Design Pattern

### MVC Architecture

MVC design pattern assigns objects in an application a role as a model, view or controller. Roles, however, can be merged allowing an object to fulfill two roles such as a view controller or a model controller. This pattern defines the purpose of an object in the application and the ways it communicates with other parts of the applciation. Software that adheres to this pattern generally is scalable, maintainable, well-defined and testable. 

Model objects encapsulate the data specific to an application and define the logic and computation that manipulate and process that data. Ideally, a model object should have no explicit connection to the view objects that present its data. It should not be concerned with user-interface and presentation issues. 

A view object is an object in an application that users can see. A view object knows how to draw itself and can respond to user actions. A major purpose of view objects is to display data from the application’s model objects and to enable the editing of that data. 

A controller object acts as an intermediary between one or more of an application’s view objects and one or more of its model objects. Controller objects are thus a conduit through which view objects learn about changes in model objects and vice versa.

One can merge the MVC roles played by an object, making an object fulfill both the controller and view roles. This is called a view controller. A view controller's 'primary responsibilities are to manage the interface and communicate with the model. 

This application adheres to the MVC design pattern. Model objects located in the *Models* folder house data for the application and the computations for manipulating the data. For example, the *API_Constants* file houses data and logic on the URL that will used in the API call. The *Business* file contains select properties for any business searched by the user. Additionally, this file also contains code for the JSON decoding process. Views are held in a separate location with no direct influence on the models. *Transition Button* contains a custom UIButton with predefined properties and *ViewAnimation* provides custom animations on UIView objects. The view controllers are hybrid classes that contain some info on view objects and also functionality to bridge communication between view and model objects. For example, *InputTextController* contains data on view objects such as *InputLabel* but also functions for communicating with model data such as *API_Constants*.


## Overall User Flow and Specific Design Decisions

Application was designed using UIKit programmatically. Upon running application, users are presented with the Home Screen which is managed by the *HomeScreenController*. Relative to appearance, the home screen has a custom blue color gradient background, application title text, an animated globe image, and a button that transitions to the *InputTextController* upon a press. *InputTextController* is designed with custom text labels & text fields, a slider, and a picker view. These are used for simplicity and to encourage user interactions. Location data must be entered using a comma, state abbreviations, and without spaces. Product category must be defined in Four Squares directory. The button to transition to the following screen and transfer the data collected is hidden until all fields contains text. Users can enter relevant data and press the InputIt! button to shift to the *BusinessTableViewController*. If acceptable data was input, users are presented with a multi-color table of businesses depending on the input parameters. Each cell contains a business name and address. At the bottom of the table view is a back button for users to transition back to the *InputTextController* for a new search if desired. Pressing any business table cell tarnsitions users to the *BusinessDetailsViewController*. In this view, users are presented with a multitude of relevant data including description, website, and phone information. A back button is present in the header section for users interested in trying a different location. At the bottom of the table is a button to transition to the final screen, the map view. Map was included just to offer users an extra dimension in their search for comprehensive business data. The *MapViewController* marks two points, the user location and the selected business location. Simulator location is always San Francisco, CA. A route connecting the two points appears for users to peruse. Additionally, clicking on the business pin will present the user with an alert detailing the exact address of the business. Users can find a back button at the bottom of the map view if interested in mapping a different location from the variety of options. 

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
+ UIAlertController
+ MKMapView

## Screenshots of Simulator

See *Screenshots* folder.

## Further Development Concerns

### Debugging

SearchIt! application has undergone minimal debugging and testing. While there is some error handling, not enough has been developed yet to handle any situation. For example, erroneous user input on the *Input Screen* can cause errors during the API call. Additionally, only one word cities are allowed for application to run smoothly. *MapViewLocationExtension* contains a method that was deprecated in iOs 14.0 that may cause unknown errors.  

### Additional Features

SearchIt! is designed to provide users with business options based on search criteria. Users, however, would want more data at their fingertips to make the most informed decision. With more development time, additional features can expand the application's reach in a competitive landscape. Some notable UI considerations to improve are better animations, more thoughtful backgrounds, and enhanced button designs. Another feature that would expand SearchIt!'s capabilities include utilization of a map API to provide a list of directions to the chosen business. Lastly, extra data such as recent reviews and images from a variety of sources would be greatly helpful to the user. 


