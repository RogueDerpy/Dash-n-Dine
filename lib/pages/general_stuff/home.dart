import 'package:dash_n_dine/helpers/appcolors.dart';
import 'package:dash_n_dine/helpers/models/categories.dart';
import 'package:dash_n_dine/helpers/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dash_n_dine/pages/settings/main_settings.dart';

//This page is a TEST PAGE for now, will rewrite everything to make it look nicer later

class HomePage extends StatelessWidget {
  List<Categories> categories = Utils.getCategories();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     drawer: NavigationDrawer(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        )
      ],
    ),
      appBar: AppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "(Placeholder text) List of Restaurants",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.BLACK_COLOR),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    height: 150,
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Image.asset('dash_n_dine_assets/images/${categories[index].imageName!}')
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//methods
//methods
Widget buildHeader(BuildContext context) => Container(
  padding: EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
  ),
);

Widget buildMenuItems(BuildContext context) => Column(
  children: [
    ListTile(
      //home page
      leading: const Icon(Icons.home_outlined),
      title: const Text('Home'), 
      onTap: () {},//Route back to home page
    ),
    //main settings page
    ListTile(
      leading: const Icon(Icons.settings),
      title: const Text('Main Settings'),
      onTap: () {}, //route to main settings page
    ),
    //cart
    ListTile(
      leading: const Icon(Icons.shopping_cart),
      title: const Text('Cart'),
      onTap: () {}, //route to cart
    ),
    //Notifications (Only do this if we have time)
    ListTile(
      leading: const Icon(Icons.notifications),
      title: const Text('Notifications'),
      onTap: () {}, //route to Notifications page (may have to cut this one if we dont have time)
    ),
    //order status
    ListTile(
      leading: const Icon(Icons.timer_outlined),
      title: const Text('Order Status'),
      onTap: () {}, //route to order status page
    ),
  ],
);

/*
A change I'm thinking of:
instead of having separate buttons for the cart and settings, we could put both in the drawer (hamburger menu), 
*/
