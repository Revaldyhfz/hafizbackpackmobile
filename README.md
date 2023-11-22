# Assignment 7

## Answers

### What are the main differences between stateless and stateful widget in Flutter?

- the main difference between stateless and stateful widgets in Flutter is how they manage and represent their internal state. Stateless widgets are static and immutable, while stateful widgets are dynamic and mutable, making them suitable for interactive and changing UI elements.

### Explain all widgets that you used in this assignment.

#### main.dart

- `MyApp`: This is a stateless widget that represents the root of the application. It creates a MaterialApp widget, which is a fundamental widget for building Material Design applications. MyApp sets the theme for the application and specifies the home widget, which is an instance of MyHomePage.

- `MaterialApp`: It configures the fundamental aspects of the app, such as its title and theme. It also specifies the initial screen (home).

#### menu.dart

- `MyApp`: Similar to the MyApp in "main.dart," this is another stateless widget. It sets up the top-level structure of the app.

- `MyHomePage`: This is a stateless widget representing the main page of the app. It includes an app bar and a body, which contains a combination of widgets:

- `Scaffold`: A material design widget that provides a basic app structure, including an app bar.
AppBar: The top app bar with a title.
SingleChildScrollView: A scrollable container for its child widgets.
Padding: Adds padding around its child.
Column: A layout widget that arranges its children in a vertical column.
GridView.count: This widget creates a grid of items. It's used to display a grid of ShopCard widgets.

- `ShopItem`: A class that represents an item with a name, icon, and color.

- `ShopCard`: A stateless widget that displays a card with an icon and text. These cards are used within the GridView.count.

###  Explain how you implemented the checklist above step-by-step (not just following the tutorial).

1. Create a new Flutter application with the inventory theme and run it.

```
flutter create inventory
cd inventory
flutter run
```

2. Create 3 simple buttons with icon and text to:

- create a new file named `menu.dart` and import `import 'package:flutter/material.dart';`

- To create a button, i first define the `ShopItem` class to represent each button. Each ShopItem has a name, an icon, and a color.

```
class ShopItem {
  final String name;      // Button text
  final IconData icon;    // Button icon
  final Color color;      // Button background color

  ShopItem(this.name, this.icon, this.color);
}

```
- In the `MyHomePage` widget's build method, i create a list of ShopItem objects, each representing a button with its text, icon, and color. i created three items to represent the three buttons the task mentioned.

```
final List<ShopItem> items = [
  ShopItem("View Items", Icons.checklist, Colors.blue),
  ShopItem("Add Item", Icons.add_shopping_cart, Colors.green),
  ShopItem("Logout", Icons.logout, Colors.red),
];

```

- Next, in the same MyHomePage widget's build method, i create a `GridView.count`widget to arrange the buttons in a grid layout. The children property is populated with ShopCard widgets, one for each ShopItem.

```
GridView.count(
  primary: true,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 3, // Number of columns in the grid
  shrinkWrap: true,
  children: items.map((ShopItem item) {
    return ShopCard(item);
  }).toList(),
);

```

- The `ShopCard` widget is used to create each button. It takes a `ShopItem` as a parameter and creates a Material button with an icon, text, and a specific background color. When a button is tapped, it shows a Snackbar with a message indicating which button was clicked.
dart

# Assignment 8

## Answers

### Explain the difference between `Navigator.push()` and `'Navigator.pushReplacement()`, accompanied by examples of the correct usage of both methods!

- `Navigator.push()` and `Navigator.pushReplacement()` are methods in Flutter used for navigating between different screens (routes). They differ in how they handle the navigation stack.

#### `Navigator.push()`:

- Description: Adds a new route to the navigation stack.
- Usage: Typically used when you want to move forward to a new screen and allow users to navigate back to the previous screen.
```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);
```

In this example, the SecondScreen is added to the stack, and the user can go back to the original screen using the system back button or a custom back button.

#### `Navigator.pushReplacement()`:

- Description: Replaces the current route in the stack with a new route.
- Usage: Used when you want to navigate to a new screen and replace the current screen, preventing the user from going back to the original screen.
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NewScreen()),
);
```
In this example, the NewScreen replaces the current screen in the stack. If the user tries to go back, they will be taken to the screen before the original one.

### Explain each layout widget in Flutter and their respective usage contexts!

`Scaffold`:

- Usage Context: The Scaffold widget is a basic structural layout widget in Flutter that provides a visual structure for your app. It typically includes an app bar, a body, and optional floating action buttons, bottom navigation bars, and drawers. The drawer is often included within the Scaffold for global navigation.
```
Scaffold(
  appBar: AppBar(
    title: Text('My App'),
  ),
  body: // Your main content goes here,
  drawer: Drawer(
    // Drawer content goes here,
  ),
)
```

`Drawer`:

- Usage Context: The Drawer widget is specifically designed for creating a slide-in menu or sidebar. It is often used to house navigation options, settings, or other secondary content.
```
Drawer(
  child: // Drawer content goes here,
)
```

`ListView`:

- Usage Context: The ListView widget is commonly used to display a scrolling list of items. In the context of a drawer, it can be used to list various navigation options or categories.
```
Drawer(
  child: ListView(
    children: [
      // List items go here
    ],
  ),
)
```

`Column`:

- Usage Context: The Column widget is used to arrange its children in a vertical column. It's often employed to structure the content within the drawer.
```
Drawer(
  child: Column(
    children: [
      // Column children go here
    ],
  ),
)
```

`Expanded`:

- Usage Context: The Expanded widget is used within a Column or Row to give a child widget the maximum available space along the main axis. It's useful for ensuring that a certain widget, such as a container or list, takes up all available space within the drawer.
```
Drawer(
  child: Column(
    children: [
      // Other widgets
      Expanded(
        child: // Widget taking up remaining space
      ),
    ],
  ),
)
```

### List the form input elements you used in this assignment and explain why you used these input elements!

-  In my app, i use `TextFormField` as an input element for the name, amount, and description of the product

- Why?, They provide a structured way for users to input information while ensuring data integrity through validation.

### How is clean architecture implemented in a Flutter application?
- Clean Architecture acts as a roadmap for building a modular system, sticking to the separation of concerns design principle. It's all about breaking down the software into different layers, making it easier to both develop and take care of the system. With these well-separated layers, you can reuse specific parts and work on them independently, making the development and updating process more straightforward. 

- This structure separates concerns, making the codebase more modular and testable. It also allows for easier maintenance and adaptation to changes, as each layer is independent of the others.

- Reference : [An Introduction to Flutter Clean Architecture](https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0)


### Explain how you implemented the checklist above step-by-step! (not just following the tutorial)

1. Use at least three input elements: name, amount, description. Add input elements according to the model in your Django assignment.
  - i created a file named `shoplist_form.dart` where it manages the form page on adding items,
  
  - i added a `form` widget to encapsulate the form and manage its state
```
  body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      // ... form fields and buttons ...
    ),
  ),
),
```

  - Three `TextFormField` widgets are used for entering the product name, amount, and description.
```
  TextFormField(
  decoration: InputDecoration(
    hintText: "Product Name",
    labelText: "Product Name",
    // ... other decoration properties ...
  ),
  onChanged: (String? value) {
    // ... update _name ...
  },
  validator: (String? value) {
    // ... validation logic ...
  },
),
// Similar TextFormField widgets for amount and description

```

  - Validation logic is defined for each `TextFormField` to ensure that the entered data meets specific criteria.
```
validator: (String? value) {
  if (value == null || value.isEmpty) {
    return "Name cannot be empty!";
  }
  // ... additional validation rules ...
  return null;
},

```
  - The "Save" button is an `ElevatedButton` triggering form validation and displaying an `AlertDialog` upon successful validation.
```
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      // ... show AlertDialog and reset form ...
    }
  },
  // ... button styling and text ...
),

```

2. Direct users to the new item addition form page when clicking the Add Item button on the main page.
  - i added this routing to left_drawer.dart
```
ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // redirect to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
```

3. Create a drawer in the application
  - i added `left_drawer.dart` file
  - inside the file, i added some codes, here are some major parts inside the file
  1. `Drawer Widget`
    - The Drawer widget is the root container for the drawer. It contains a list of items that represent the navigation options.
```
return Drawer(
  child: ListView(
    children: [
      // ... drawer items ...
    ],
  ),
);

```
  2. `DrawerHeader`
    - The DrawerHeader widget represents the header section of the drawer. It typically contains a decoration, such as a background color, and child widgets like Text to display a title.
```
const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.indigo,
  ),
  child: Column(
    children: [
      // ... title and additional text ...
    ],
  ),
),
```

  3. `Title and Additional Text` :
    - The title and additional text displayed in the DrawerHeader provide a brief description or branding for your app.

```
Text(
  'Hafiz Backpack',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
),

// ... additional text ...
```

  4. `ListTile Widgets`:
    - ListTile widgets represent individual items in the drawer. Each ListTile has a leading icon, a title, and an onTap function to handle user interaction.
```
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Home Page'),
  onTap: () {
    // ... navigate to MyHomePage ...
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Add Product'),
  onTap: () {
    // ... navigate to ShopFormPage ...
  },
),
```

  5. `Navigation using Navigator`:
    - The onTap function of each ListTile uses the Navigator class to navigate to a different page when the corresponding item is selected.
```
onTap: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => MyHomePage(), // or ShopFormPage
    ),
  );
},
```
# Assignment 8

## Answers

### Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?

- Retrieving JSON data doesn't always need a model. JSON is a simple format for data exchange, easily handled by programming languages without machine learning. Using libraries or built-in functions, you can parse and work with JSON in your code. However, if we're dealing with more complex tasks, like natural language processing, a machine learning model might be useful. Creating a model requires expertise, resources, and data. Decide based on the task—simple data manipulation may not need a model, while complex tasks might benefit from one.

### Explain the function of CookieRequest and explain why a CookieRequest instance needs to be shared with all components in a Flutter application.

- ` CookieRequest ` likely handles HTTP cookies in Flutter. Sharing an instance across components ensures consistent cookie management, preventing issues that could arise from decentralized handling.

### Explain the mechanism of fetching data from JSON until it can be displayed on Flutter.
- To fetch and display data from JSON in Flutter:

  1. Use an HTTP client to request JSON data from an API.
  2. Parse the JSON data using the `dart:convert ` library.
  3. Create Dart model classes to represent the data structure.
  4. Convert the parsed JSON data into instances of the model classes.
  5. Use Flutter widgets to display the data in the user interface.
  6. Optionally, employ state management solutions for dynamic data updates.

### Explain the authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter.
1. User Input in Flutter:

  - Users enter credentials in the Flutter app.

2. Sending Credentials to Django:

  - Flutter sends a POST request to Django with user credentials.

3. Django Authentication:

  - Django authenticates and sends an authentication token.

4. Token Handling in Flutter:

  - Flutter securely stores the token for future requests.

5. Displaying Menus in Flutter:

  - Authenticated Flutter app fetches user-specific data, like menus, from Django.

6. Dynamic Menu Display:

  - Flutter dynamically displays menus based on the received data.

### List all the widgets you used in this assignment and explain their respective functions.

1. LoginApp and LoginPage (login.dart):

  - LoginApp sets up the initial login page.
  - LoginPage handles user authentication.
  - Uses the CookieRequest instance to send login requests to the Django backend.
  - Navigates to the main content page (ProductPage) upon successful login.

2. ProductPage (list_product.dart):

  - Displays a list of products fetched from the Django backend.
  - Utilizes the http package for making HTTP requests to get product data.
  - Uses FutureBuilder for asynchronous data fetching.
  - Renders the product data dynamically in a ListView.

3. shop_card.dart:

  - Represents a card in the main interface.
  - Handles navigation to different pages, including the product page.

4. LeftDrawer and LeftDrawerMenu (left_drawer.dart):

  - LeftDrawer is a stateless widget representing the left drawer of the app.
  - LeftDrawerMenu represents menu items, including navigation to the product page and logout functionality.

5. Logout Integration (left_drawer.dart):

  - Handles the logout functionality when the user taps on the "Logout" menu item.
  - Communicates with the Django backend through the CookieRequest instance for logging out.
  - Navigates to the login page after successful logout.

These newly added widgets allows users to log in, view a list of products, and log out of the application. The CookieRequest instance manages the communication between Flutter and Django for authentication and logout. The ProductPage displays the product data, and the navigation is facilitated by the left drawer and shop card components.

### Explain how you implement the checklist above step by step! (not just following the tutorial).

1. Create a login page in the Flutter project.
  - Installation:

    - Run the following commands in the Terminal to install Flutter packages provided by the teaching assistant team:
```
flutter pub add provider
flutter pub add pbp_django_auth
```

  - Implementation in the Root Widget (MyApp):

    - Modify the root widget (e.g., `MyApp`) to use the Provider package.
    - Add a new Provider object in the create method to share an instance of CookieRequest with all components in the application.

  - Create a Login Screen:

    - Create a new file named `login.dart` in the screens folder.
    - Populate `login.dart` with the provided code for a login screen, including text fields for username and password, a login button, and authentication logic.

  - Adjust the Main Application Entry Point:

    - In the `main.dart` file, replace home: `MyHomePage()` with home: `LoginPage()` in the MaterialApp widget.
  - These changes enable the use of the `pbp_django_auth` package for authentication in my Flutter application, with a focus on implementing a login screen.

2. Create a custom model according to your Django application project.

  1. JSON Data Retrieval:

    - Open the JSON endpoint created in a previous tutorial.

  2. Quicktype Model Creation:

    - Copy the JSON data.
    - Visit the Quicktype website.
    - Configure Quicktype settings:
      1. Setup name: `Product`
      2. Source type: `JSON`
      3. Language: `Dart`
    - Paste the JSON data into the provided textbox on Quicktype.
    - Click "Copy Code" on Quicktype.

  3. Model Implementation in Flutter:

    - Create a new file named product.dart in the lib/models folder of your Flutter project.
    - Paste the code copied from Quicktype into this file.

3. Create a page containing a list of all items available at the JSON endpoint in Django that you have deployed.

1. `list_product.dart`:
  - This Dart file defines a `ProductPage` widget that retrieves a list of products from a Django app's JSON endpoint. Key functionalities include:

    - Utilizes the `http` package to make an HTTP GET request to the specified URL.
    - Parses the JSON response and converts it into a list of `Product` objects.
    - Implements a `FutureBuilder` widget to handle asynchronous data loading.
    - Displays a loading indicator while data is being fetched.
    - If data is available, renders a ListView of products, each wrapped in an InkWell for tap navigation.
    - Navigates to a `DetailPage` when a product is tapped, passing the selected product as a parameter.

2. `details.dart`:
  - This Dart file defines a `DetailPage` widget that displays detailed information about a selected product. Key elements include:

    - Takes a `Product` object as a parameter to display its details.
    - Renders a scaffold with an app bar, left drawer, and body.
    - Displays product details such as name, amount, fruit type, and description.
    - Includes an "Back to Item List" button that navigates back to the product list page when pressed.

- Overall, these files work together to create a Flutter application that fetches and displays a list of products, allowing users to view detailed information about each product.
