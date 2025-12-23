import 'package:flutter/material.dart';
import 'package:flutter_restaurant/component/my_button.dart';
import 'package:flutter_restaurant/component/my_cart_tile.dart';
import 'package:flutter_restaurant/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, _) {
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Clear cart?"),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                        TextButton(
                          onPressed: () {
                            restaurant.clearCart();
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: userCart.isEmpty
                    ? const Center(child: Text("Cart is empty"))
                    : ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) => MyCartTile(cartItem: userCart[index]),
                      ),
              ),
              MyButton(
                text: "Go to Checkout",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentPage())),
              ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}