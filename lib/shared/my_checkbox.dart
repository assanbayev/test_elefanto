import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/palette.dart';

class MyCheckbox extends StatefulWidget {
  final String text;
  const MyCheckbox({Key? key, required this.text}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Checkbox(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide.none),
            activeColor: Palette.checkbox_green_color,
            value: checkboxValue,
            onChanged: (value) {
              checkboxValue = value ?? false;
              setState(() {});
            }),
        Flexible(
          child: GestureDetector(
            onTap: () {
              checkboxValue = !checkboxValue;
              setState(() {});
            },
            child: Text(
              widget.text,
              maxLines: 2,
              softWrap: true,
            ),
          ),
        )
      ]),
    );
  }
}
