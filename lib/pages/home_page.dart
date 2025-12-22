import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/component/my_current_location.dart';
import 'package:flutter_restaurant/component/my_description_box.dart';
import 'package:flutter_restaurant/component/my_drawer.dart';
import 'package:flutter_restaurant/component/my_food_tile.dart';
import 'package:flutter_restaurant/component/my_sliver_app_bar.dart';
import 'package:flutter_restaurant/models/food.dart';
import 'package:flutter_restaurant/models/restaurant.dart';
import 'package:flutter_restaurant/pages/my_tab_bar.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab_bar controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(food: food, onTap: () {}); // ListTile
        },
      ); // ListView.builder
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(b
      //   title: Text("Home"),
      //   backgroundColor: Theme.of(context).colorScheme.background,
      // ),
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                //my current location
                const MyCurrentLocation(),

                //description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, Restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(Restaurant.menu),
          ),
        ),
      ),
    );
  }
}
