import 'package:flutter/material.dart';

import '../../index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "asds",
        ),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            height: 100,
            width: 100,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
