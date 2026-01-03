import 'package:flutter/material.dart';
import 'package:artspire/models/navbar.dart';

class ShellPage extends StatelessWidget {
  const ShellPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21212e),
      body: SafeArea(child: child), 
      bottomNavigationBar: const NavBar(), 
    );
  }
}

