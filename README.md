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

# Assignment 7

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