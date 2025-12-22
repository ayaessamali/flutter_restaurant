import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// generate a receipt
String displayCartReceipt() {
  final receipt = StringBuffer();
  receipt.writeln("Here's your receipt.");
  receipt.writeln();

  String formattedDate = DateFormat(
    'yyyy-MM-dd HH:mm:ss',
  ).format(DateTime.now());
  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln("-------------");

  for (final cartItem in _cart) {
    receipt.writeln(
      "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}",
    );
    if (cartItem.selectedAddons.isNotEmpty) {
      receipt.writeln("  Add-ones: ${_formatAddons(cartItem.selectedAddons)}");
    }
    receipt.writeln();
  }
  receipt.writeln("-------------");
  receipt.writeln();
  receipt.writeln("Total Items: ${getTotalItemCount()}");
  receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
  return receipt.toString();
}

// format double value into money
String _formatPrice(double price) {
  return "\$${price.toStringAsFixed(2)}";
}

// format list of addons into a string summary
String _formatAddons(List<Addon> addons) {
  return addons
      .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
      .join(", ");
}
