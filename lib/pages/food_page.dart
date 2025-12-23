import 'package:flutter/material.dart';
import 'package:flutter_restaurant/component/my_button.dart';
import 'package:flutter_restaurant/models/food.dart';
import 'package:flutter_restaurant/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart() {
    List<Addon> selected = [];
    widget.selectedAddons.forEach((addon, isSelected) {
      if (isSelected) selected.add(addon);
    });

    context.read<Restaurant>().addToCart(widget.food, selected);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.food.imagePath),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.food.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('\$${widget.food.price}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(height: 10),
                  Text(widget.food.description),
                  const SizedBox(height: 10),
                  Divider(color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 10),
                  const Text("Add-ons", style: TextStyle(fontWeight: FontWeight.bold)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.food.availableAddons.length,
                    itemBuilder: (context, index) {
                      Addon addon = widget.food.availableAddons[index];
                      return CheckboxListTile(
                        title: Text(addon.name),
                        subtitle: Text('\$${addon.price}'),
                        value: widget.selectedAddons[addon],
                        onChanged: (bool? value) {
                          setState(() {
                            widget.selectedAddons[addon] = value!;
                          });
                        },
                      );
                    },
                  ),
                  MyButton(text: "Add to Cart", onTap: addToCart),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}