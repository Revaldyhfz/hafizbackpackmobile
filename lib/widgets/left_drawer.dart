import 'package:flutter/material.dart';
import 'package:hafizbackpackmobile/screens/list_product.dart';
import 'package:hafizbackpackmobile/screens/menu.dart';

import 'package:hafizbackpackmobile/screens/shoplist_form.dart';
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              children: [
                Text(
                  'Hafiz Backpack',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Savor the forbidden allure of Devil Fruits at our shop, Now in the palm of your hands!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    )
        
                    
                    ),


              ],
            ),
          ),
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
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Product List'),
            onTap: () {
            // Route menu to product page
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductPage()),
            );
        },
    ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Product'),
            // redirect to ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
              
            },
          ),
        ],
      ),
    );
  }
}