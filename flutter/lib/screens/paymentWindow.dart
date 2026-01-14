import 'package:flutter/material.dart';
import "package:flutter_stripe/flutter_stripe.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentWindow extends StatelessWidget {
  const PaymentWindow({super.key});

  dynamic createPaymentIntent(String amount, String currency) async {
    try {
      final body = {
      'amount': amount,
      'currency': currency,
      };

      final response = await http.post(
        Uri.parse('http://192.168.254.111:3000/api/payment'),
        body: body,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'});
      return jsonDecode(response.body);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pay ₱1000'),
          onPressed: () {
            makePayment(context);
          },
        ),
      ),
    );
  }

  Future<void> makePayment(BuildContext context) async {
    try {
      final paymentIntentData = await createPaymentIntent('100000', 'PHP') ?? {};

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          style: ThemeMode.light,
          customFlow: false,
          merchantDisplayName: 'Artspire',
        ),
      ).then((value) {
        displayPaymentSheet(context);
      });
    } catch (e) {
      print(e);
    }
  }

  void displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Paid succesfully!")));
      }).onError((err, stack) {
        throw Exception(err);
      });
    } on StripeException catch (e) {
      print("err: $e");
    }
  }

}
