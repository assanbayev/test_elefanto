import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/palette.dart';

import '../../consts.dart';

class CustomDropDownList extends StatefulWidget {
  final Function(String) onItemSelected;
  const CustomDropDownList({Key? key, required this.onItemSelected})
      : super(key: key);

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  String selectedMega = dropdown_sites_list_text.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: selectedMega,
        items: dropdown_sites_list_text
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
                  const TextStyle(fontSize: 17, color: Palette.default_black),
            ),
          );
        }).toList(),
        onChanged: (value) {
          selectedMega = value ?? selectedMega;
          setState(() {});
          widget.onItemSelected(selectedMega);
        },
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        underline: const SizedBox(),
      ),
    );
  }
}
