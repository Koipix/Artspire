import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: const Color(0xFF21212e),
      child: Center(
        child: Column( //plain ol page, replace this property with your own design :3
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add Art",
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),     
      ),
    );
  }
}

