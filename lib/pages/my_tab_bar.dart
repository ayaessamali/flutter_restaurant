import 'package:flutter/material.dart';
import 'package:flutter_restaurant/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    
    return FoodCategory.values.map((category) {
      String name = category.toString().split('.').last;
      name = name[0].toUpperCase() + name.substring(1); // Capitalize first letter
      return Tab(text: name);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: _buildCategoryTabs(),
      isScrollable: true, 
      labelColor: Theme.of(context).colorScheme.primary,
      unselectedLabelColor: Theme.of(context).colorScheme.onSurfaceVariant,
      indicatorColor: Theme.of(context).colorScheme.primary,
      indicatorWeight: 3,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
    );
  }
}