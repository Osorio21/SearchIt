# SearchIt!
Onramp/Realtor.com: Pre-Interview Project

## Purpose

The purpose of this application, SearchIt!, is to provide users the opportunity to retrieve perintent business information in an easily viewable and navigable format. Users will enter the product category, relevant geographical location, desired number of results, and sorting parameters. Through an API call to the Foursquare Places API, the application will decode the JSON data and return a number of locations in a table matching the user specifications. User can click any item in the table for additional information. Additional information presented includes images, name, address, phone number, and tips if applicable. 

## Architectural Overview of SearchIt!

### Files

#### **Model**

##### > API_Constants

##### > Business

##### > Businesses

##### > BackgroundColor

##### > InputValues

#### **Home Screen**

##### > View Controller

#### **Input Screen**

##### > InputListViewController

##### > ILVC+Section

##### > ILVC+CellConfiguration

##### > ILVC+DataSource

#### **Content Views**

##### > TextFieldContentView

##### > PinnedSubview

##### > UIContentConfiguration

#### **Assets**

Borrows collection of colors and assets from Apple's UKit tutorials. These colors are used in some list cell backgrounds. 


## Architectural Design Pattern

### MVC Architecture

MVC design pattern assigns objects in an application a role as a model, view or controller. Roles, however, can be merged allowing an object to fulfill two roles such as a view controller or a model controller. This pattern defines the purpose of an object in the application and the ways it communicates with other parts of the applciation. Software that adheres to this pattern generally is scalable, maintainable, well-defined and testable. 

Model objects encapsulate the data specific to an application and define the logic and computation that manipulate and process that data. Ideally, a model object should have no explicit connection to the view objects that present its data. It should not be concerned with user-interface and presentation issues. 

A view object is an object in an application that users can see. A view object knows how to draw itself and can respond to user actions. A major purpose of view objects is to display data from the application’s model objects and to enable the editing of that data. 

A controller object acts as an intermediary between one or more of an application’s view objects and one or more of its model objects. Controller objects are thus a conduit through which view objects learn about changes in model objects and vice versa.

One can merge the MVC roles played by an object, making an object fulfill both the controller and view roles. This is called a view controller. A view controller is a controller that concerns itself mostly with the view layer. Its primary responsibilities are to manage the interface and communicate with the model. Action methods concerned with data displayed in a view are typically implemented in a view controller.

This application adheres to the MVC design pattern. Model objects located in the *Model* folder house data for the application and the computation for manipulating the data. For example, the *API_Constants* file houses data and logic on the URL that will used in the API call. 


## Overall User Flow and Specific Design Decisions

Application was designed using UIKit programmatically.

## UI Components Utilized

+ UIColor
+ UICollectionView
+ UITableView
+ UILabel
+ UIFont
+ UIButton
+ UIPickerView
+ UISlider
+ UIImage

## Screenshots of Simulator

See *Screenshots* folder.

## Further Development Concerns

### Debugging

SearchIt! application has undergone minimal debugging and testing. While there is some error handling, not enough has been developed yet to handle any situation. For example, erroneous user input on the *Input Screen* can cause errors. Additionally, some API calls with nil return values may disrupt presentation of business info in the views.

### Additional Features

SearchIt! is designed to provide users with business options based on search criteria. Users, however, would want more data at their fingertips to make the most informed decision. With more development time, additional features can expand the application's reach in a competitive landscape. Some notable UI considerations to improve are better animations, more thoughtful backgrounds, and enhanced button designs. Another feature that would expand SearchIt!'s capabilities include utilization of a map API to provide a view of the locations relative to the user.


