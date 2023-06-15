import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/view/core/constants/constants.dart';

import '../../controller/grid_controller.dart';
import '../core/color/colors.dart';
import '../core/fonts/fonts.dart';

class Screengrid extends StatelessWidget {
  Screengrid({
    super.key,
    required this.alphabets,
    required this.columns,
    required this.rows,
  });
  final String alphabets;
  final int rows;
  final int columns;
  final TextEditingController _textEditingController = TextEditingController();
  final GridController gridController = Get.put(GridController());

  @override
  Widget build(BuildContext context) {
    List<String> alphaLists = alphabets.split('');
    gridController.createVertices(alphaLists, rows, columns);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Play Ground',
        ),
      ),
      body: Column(
        children: [
          khight10,
          Card(
            child: inpiutWidget(
                label: 'Play text',
                controller: _textEditingController,
                onChange: (text) {
                  gridController.stringList = text.toUpperCase();
                  gridController.getIds();
                  gridController.update();
                  log(gridController.vertexIdsFnl.length.toString());
                }),
          ),
          toggleWidget(),
          khight10,
          Expanded(
            flex: 1,
            child: GetBuilder(
                init: GridController(),
                builder: (gController) {
                  return GridView.builder(
                    itemCount: rows * columns,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rows),
                    itemBuilder: (context, index) => gridWidget(
                      gController,
                      index,
                      alphaLists,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  toggleWidget() {
    return GetBuilder(
        init: GridController(),
        builder: (gController) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.window,
                  size: 16,
                ),
              ),
              Text(
                'All Directions',
                style: GoogleFont.toggleTextStyle,
              ),
              Switch(
                  inactiveThumbColor: kRed,
                  activeColor: kButtonColor,
                  value: gridController.isAllDirection,
                  onChanged: (_) {
                    if (gridController.isAllDirection) {
                      gridController.isAllDirection = false;
                    } else {
                      gridController.isAllDirection = true;
                    }
                    gridController.getIds();
                    gridController.update();
                  }),
            ],
          );
        });
  }

  AnimatedContainer gridWidget(
      GridController gController, int index, List<String> alphaLists) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: gController.vertexIdsFnl.contains(index)
            ? kGreen
            : gController.stringList.contains(alphaLists[index])
                ? kRed
                : kBlue,
        borderRadius: gController.vertexIdsFnl.contains(index)
            ? BorderRadius.circular(50)
            : BorderRadius.circular(5),
      ),
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Text(
          alphaLists[index].toUpperCase(),
          style: GoogleFont.homeHeadStyle,
        ),
      ),
    );
  }

  SizedBox inpiutWidget({
    required String label,
    required TextEditingController controller,
    required Function(String)? onChange,
  }) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        onChanged: onChange,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kBlack),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kBlack),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kBlack),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(
              label,
              style: GoogleFont.textFieldStyle,
            )),
      ),
    );
  }
}
