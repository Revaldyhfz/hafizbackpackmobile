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

