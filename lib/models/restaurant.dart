import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant/models/CartItem.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "A juicy patty with melted cheddar, tomato, and hint of onion and pickle.",
      imagePath: "lib/images/burgers/cheese_burger.jpg",
      price: .99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: .99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "smoky BBQ sauce,crispy bacon, and onion rings make this bees burger a savory delight.",
      imagePath: "lib/images/burgers/bbq_bacon.jpg",
      price: 10.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Grilled Onions", price: .99),
        Addon(name: "Jalapenos", price: 1.49),
        Addon(name: "Extra BBQ Sauce", price: 1.99),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A hearty veggie patty topped with fresh avocado,lettuce, and tomato, served on whole.",
      imagePath: "lib/images/burgers/vege_burger.jpg",
      price: .99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: .99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Aloha Burger",
      description:
          "A char-grilled patty topped with fresh avocado,lettuce, and tomato, served on whole.",
      imagePath: "lib/images/burgers/aloha_burger.jpg",
      price: 5.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 1.99),
        Addon(name: "Bacon", price: .99),
        Addon(name: "Extra pineapple", price: 3.99),
      ],
    ),
    Food(
      name: "Blue Moon Burger",
      description:
          "A burger with a blue cheese lover's dream,lettuce, and tomato, served on whole.",
      imagePath: "lib/images/burgers/blue_moon.jpg",
      price: 10.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 2.99),
        Addon(name: "spicy mayo", price: .99),
        Addon(name: "fried egg", price: 1.99),
      ],
    ),
    //salads
    Food(
      name: "Caeser Salad",
      description:
          "classic green salad made with crisp Romaine lettuce and crunchy croutons. It is tossed in a rich, creamy dressing traditionally.",
      imagePath: "lib/images/salads/caeser_salad.jpg",
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.99),
        Addon(name: "Grilled Shrimp", price: .99),
        Addon(name: "Crispy Beef Bacon", price: 3.99),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "A mix of tomatoes, cucumbers, red onions, Kalamata olives, and a large block of feta cheese, seasoned with dried oregano and olive oil.",
      imagePath: "lib/images/salads/greek_salad.jpg",
      price: 6.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Pita Bread", price: 1.99),
        Addon(name: "Green Bell Peppers", price: .99),
        Addon(name: "Crispy Beef Bacon", price: 3.99),
      ],
    ),
    Food(
      name: "Cobb Salad",
      description:
          "A mix of tomatoes, cucumbers, red onions, Kalamata olives, and a large block of feta cheese, seasoned with dried oregano and olive oil.",
      imagePath: "lib/images/salads/cobb_salad.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Sweet Corn", price: 1.99),
        Addon(name: "Red Radishes", price: .99),
        Addon(name: "Chickpeas", price: 3.99),
      ],
    ),
    Food(
      name: "Quinoa Tabbouleh",
      description:
          "A super-fresh salad made primarily of finely chopped parsley, mint, and tomatoes. Instead of the traditional bulgur wheat.",
      imagePath: "lib/images/salads/quinoa_salad.jpg",
      price: 5.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Pomegranate Seeds", price: 1.99),
        Addon(name: "Roasted Pumpkin", price: .99),
        Addon(name: "Feta Cheese", price: 3.99),
      ],
    ),
    Food(
      name: "Caprese Salad",
      description:
          "A simple but elegant salad consisting of thick slices of fresh Mozzarella, ripe tomatoes, and fresh basil leaves.",
      imagePath: "lib/images/salads/caprese_salad.jpg",
      price: 9.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Prosciutto", price: 1.99),
        Addon(name: "Pine Nuts", price: .99),
        Addon(name: "Arugula", price: 3.99),
      ],
    ),
    //desserts
    Food(
      name: "Cheesecake",
      description:
          "A thick layer of soft cheese (usually cream cheese) mixed with eggs and sugar, sitting on a crushed cookie or graham cracker crust.",
      imagePath: "lib/images/desserts/cheesecake.jpg",
      price: 10.99,
      category: FoodCategory.dessers,
      availableAddons: [
        Addon(name: "Berry Compote", price: 1.99),
        Addon(name: "Salted Caramel Drizzle", price: .99),
        Addon(name: "Crushed Lotus Biscuits", price: 3.99),
      ],
    ),
    Food(
      name: "Molten Chocolate Cake",
      description:
          "A small chocolate cake with a slightly underbaked center that flows out like warm liquid chocolate when opened.",
      imagePath: "lib/images/desserts/moltencake.jpg",
      price: 8.99,
      category: FoodCategory.dessers,
      availableAddons: [
        Addon(name: "Vanilla Bean Gelato", price: 1.99),
        Addon(name: "Fresh Mint Leaves", price: .99),
        Addon(name: "Sea Salt Flakes", price: 3.99),
      ],
    ),
    Food(
      name: "Tiramisu",
      description:
          "Layers of espresso-soaked ladyfingers (savoiardi) smothered in a whipped mixture of mascarpone cheese, sugar, and vanilla, topped with a dusting of cocoa powder.",
      imagePath: "lib/images/desserts/Tiramisucake.jpg",
      price: 7.99,
      category: FoodCategory.dessers,
      availableAddons: [
        Addon(name: "Dark Chocolate Shavings", price: 1.99),
        Addon(name: "Roasted Hazelnuts", price: .99),
        Addon(name: "A splash of Caramel Syrup", price: 3.99),
      ],
    ),
    Food(
      name: "Churros",
      description:
          "Deep-fried dough pastry, usually shaped into long ridges, rolled in a mixture of cinnamon and sugar while still hot.",
      imagePath: "lib/images/desserts/churroscake.jpg",
      price: 11.99,
      category: FoodCategory.dessers,
      availableAddons: [
        Addon(name: "Warm Nutella Dip", price: 1.99),
        Addon(name: "Dulce de Leche", price: .99),
        Addon(name: "Crushed Pistachios", price: 3.99),
      ],
    ),
    Food(
      name: "Pavlova",
      description:
          "A meringue cake with a crisp, delicate crust and a soft, marshmallow-like center, usually topped with heaps of whipped cream and fresh fruit.",
      imagePath: "lib/images/desserts/pavlovacake.jpg",
      price: 13.99,
      category: FoodCategory.dessers,
      availableAddons: [
        Addon(name: "Passion Fruit Pulp", price: 1.99),
        Addon(name: "Toasted Coconut Flakes", price: .99),
        Addon(name: "Kiwi & Mango Slices", price: 3.99),
      ],
    ),

    //drinks
    Food(
      name: "Spanish Latte",
      description:
          "An espresso-based drink made with steamed milk and a generous amount of condensed milk, giving it a velvety, smooth, and sweet profile.",
      imagePath: "lib/images/drinks/spanish_latte.jpg",
      price: 20.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Cinnamon Powder", price: 1.99),
        Addon(name: "Salted Caramel", price: .99),
        Addon(name: "Extra Shot of Espresso", price: 3.99),
      ],
    ),
    Food(
      name: "Virgin Mojito",
      description:
          "A fizzy, non-alcoholic drink made by muddling(crushing) fresh mint leaves and lime wedges with sugar, then topped with sparkling water or soda.",
      imagePath: "lib/images/drinks/Virgin_Mojito.jpg",
      price: 20.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Passion Fruit Pulp", price: 1.99),
        Addon(name: "Fresh Strawberries", price: .99),
        Addon(name: "Splash of Sprite", price: 3.99),
      ],
    ),
    Food(
      name: "Matcha Latte",
      description:
          "Made from finely ground green tea powder whisked with hot water and combined with frothed milk. It has a unique, grassy sweetness.",
      imagePath: "lib/images/drinks/Matcha_Latte.jpg",
      price: 21.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Vanilla Syrup", price: 1.99),
        Addon(name: "Oat Milk", price: .99),
        Addon(name: "Honey", price: 3.99),
      ],
    ),
    Food(
      name: "Milkshake",
      description:
          "A blended mixture of ice cream, milk, and various flavorings (like chocolate, vanilla, or fruit) topped with whipped cream.",
      imagePath: "lib/images/drinks/Milkshake.jpg",
      price: 22.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Crushed Oreos", price: 1.99),
        Addon(name: "Peanut Butter", price: .99),
        Addon(name: "Toasted Marshmallows", price: 3.99),
      ],
    ),
    Food(
      name: "Iced Peach Tea",
      description:
          "Chilled black or green tea infused with peach syrup or fresh peach juice, served over plenty of ice.",
      imagePath: "lib/images/drinks/Iced_Peach_Tea.jpg",
      price: 23.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Fresh Basil or Thyme", price: 1.99),
        Addon(name: "Lemon Slices", price: .99),
        Addon(name: "Boba", price: 3.99),
      ],
    ),
    //sides
    Food(
      name: "Garlic Parmesan Fries",
      description:
          "Crispy, golden-brown potato fries tossed in a mixture of melted butter, minced garlic, and finely grated Parmesan cheese, finished with fresh parsley.",
      imagePath: "lib/images/sides/Garlic_Parmesan_Fries.jpg",
      price: 10.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Truffle Oil", price: 1.99),
        Addon(name: "Chili Flakes", price: .99),
        Addon(name: "Ranch Dipping Sauce", price: 3.99),
      ],
    ),
    Food(
      name: "Macaroni and Cheese",
      description:
          "Elbow pasta smothered in a rich, creamy cheese sauce (usually a blend of Cheddar, Monterey Jack, or Gruyère) and often baked until bubbly.",
      imagePath: "lib/images/sides/Macaroni_and_Cheese.jpg",
      price: 15.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Panko Breadcrumbs", price: 1.99),
        Addon(name: "Jalapeño Slices", price: .99),
        Addon(name: "Beef Bacon Bits", price: 3.99),
      ],
    ),
    Food(
      name: "Roasted Seasonal Vegetables",
      description:
          "A mix of vegetables (like carrots, broccoli, zucchini, and bell peppers) tossed in olive oil and herbs, then roasted at high heat until caramelized.",
      imagePath: "lib/images/sides/Roasted_Seasonal_Vegetables.jpg",
      price: 20.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Balsamic Glaze", price: 1.99),
        Addon(name: "Feta Cheese Crumbles", price: .99),
        Addon(name: "Toasted Almond Slivers", price: 3.99),
      ],
    ),
    Food(
      name: "Mashed Potatoes",
      description:
          "Boiled potatoes mashed until smooth and mixed with generous amounts of butter, heavy cream, or milk, seasoned with salt and white pepper.",
      imagePath: "lib/images/sides/Mashed_Potatoes.jpg",
      price: 27.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Roasted Garlic", price: 1.99),
        Addon(name: "Chives or Green Onions", price: .99),
        Addon(name: "Sour Cream", price: 3.99),
      ],
    ),
    Food(
      name: "Coleslaw",
      description:
          "Finely shredded raw cabbage and carrots mixed with a dressing that is either creamy (mayonnaise-based) or zesty (vinegar-based).",
      imagePath: "lib/images/sides/Coleslaw.jpg",
      price: 23.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Apple Slices", price: 1.99),
        Addon(name: "Cranberries", price: .99),
        Addon(name: "Poppy Seeds", price: 3.99),
      ],
    ),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address which user can change/update
  String _deliveryAddress = '6901 Holywood Blv';


  //getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  
  
  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see it there is a cart item with same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check food items are same
      bool isSameFood = item.food.name == food.name;
      //check selected addons are same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });
    //if item already exists, increment quantity
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      //else add new cart item to cart
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      //if quantity is zero, remove item from cart
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total cart price
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

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
        receipt.writeln(
          "  Add-ones: ${_formatAddons(cartItem.selectedAddons)}",
        );
      }
      receipt.writeln();
    }
    receipt.writeln("-------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("delivery to: $_deliveryAddress");
    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into string summary
  String _formatAddons(List<Addon> addons) {
    if (addons.isEmpty) return "No addons";
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }

}
