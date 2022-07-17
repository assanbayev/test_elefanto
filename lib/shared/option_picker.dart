import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/palette.dart';

class OptionPicker extends StatefulWidget {
  Map<String, bool> options;
  OptionPicker({Key? key, required this.options}) : super(key: key);

  @override
  State<OptionPicker> createState() => _OptionPickerState();
}

class _OptionPickerState extends State<OptionPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      for (int i = 0; i < widget.options.length; i++)
        option(
            widget.options.keys.toList()[i], widget.options.values.toList()[i]),
    ]));
  }

  Widget option(String text, bool isChosen) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide.none),
            backgroundColor:
                isChosen ? Palette.genderChoose : Palette.inputBackground),
        child: Text(
          text,
          style: TextStyle(color: isChosen ? Colors.black : Palette.inputText),
        ),
        onPressed: () {
          //unchoose every element
          for (int i = 0; i < widget.options.length; i++) {
            widget.options[widget.options.keys.toList()[i]] = false;
          }
          //choose the correct one
          widget.options[text] = true;
          setState(() {});
        },
      ),
    );
  }
}
