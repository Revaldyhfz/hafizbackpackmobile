// shop_card.dart

import 'package:flutter/material.dart';
import 'package:hafizbackpackmobile/screens/list_product.dart';
import 'package:hafizbackpackmobile/screens/login.dart';
import 'package:hafizbackpackmobile/screens/shoplist_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ShopItem {
  final String title;
  final IconData icon;
  final Color color;

  ShopItem(this.title, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color, // Use the specified color for each button
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.title} button!")));
          if (item.title == "Add item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()),
            );
          }
          else if (item.title == "View Products") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductPage()));
      }
      else if (item.title == "Logout") {
        final response = await request.logout(
            
            "http://localhost:8000//auth/logout/");
        String message = response["message"];
        if (response['status']) {
          String uname = response["username"];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message Good bye, $uname."),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message"),
          ));
        }
      }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
