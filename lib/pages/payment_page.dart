import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_restaurant/component/my_button.dart';
import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void payNow() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DeliveryProgressPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout"), backgroundColor: Colors.transparent, foregroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Column(
        children: [
          CreditCardWidget(cardNumber: cardNumber, expiryDate: expiryDate, cardHolderName: cardHolderName, cvvCode: cvvCode, showBackView: isCvvFocused, onCreditCardWidgetChange: (_) {}),
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            formKey: formKey,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
          ),
          const Spacer(),
          MyButton(text: "Pay now", onTap: payNow),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}