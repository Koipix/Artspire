import 'package:flutter/material.dart';
import "package:artspire/router.dart";
import "package:flutter_stripe/flutter_stripe.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = '';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
