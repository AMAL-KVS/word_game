import 'package:flutter/material.dart';
import 'package:word_game/view/core/constants/constants.dart';
import 'package:word_game/view/core/fonts/fonts.dart';
import 'package:word_game/view/home/widgets/input_cart_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: Column(
        children: [
          khight10,
          SizedBox(
            width: 300,
            child: Text(
              'Enter the Number of Rows, Columns and The Alphabets',
              style: GoogleFont.homeHeadStyle,
              textAlign: TextAlign.center,
            ),
          ),
          khight10,
          InputCardWidget(),
        ],
      ),
    );
  }
}
