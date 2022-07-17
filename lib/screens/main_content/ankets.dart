import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/app_strings.dart';
import 'package:test_elefanto/font_consts/palette.dart';
import 'package:test_elefanto/font_consts/size_config.dart';
import 'package:test_elefanto/screens/main_content/title_widget.dart';

class Ankets extends StatefulWidget {
  final List<String> anketNames;
  List<bool> wasPassed;
  Ankets({Key? key, required this.anketNames, required this.wasPassed})
      : super(key: key);

  @override
  State<Ankets> createState() => _AnketsState();
}

class _AnketsState extends State<Ankets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(
          ankets_text,
          isSeeAll: true,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.default_horizontal_margin_main_content),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            for (int i = 0; i < widget.anketNames.length; i++) anketa(i)
          ]),
        ),
      ],
    );
  }

  Widget anketa(int index) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.02,
          vertical: SizeConfig.screenWidth * 0.03),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.anketNames[index],
                style:
                    const TextStyle(fontSize: 17, color: Palette.default_black),
              ),
              anketaButton(index),
            ],
          ),
          index != (widget.anketNames.length - 1)
              ? const Divider(
                  color: Palette.inputText,
                  height: 1,
                )
              : Container()
        ],
      ),
    );
  }

  Widget anketaButton(int index) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.25,
      child: TextButton(
        onPressed: () {
          widget.wasPassed[index] = !widget.wasPassed[index];
          setState(() {});
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: widget.wasPassed[index]
              ? Palette.checkbox_green_color
              : Colors.white,
          shape: RoundedRectangleBorder(
              side: widget.wasPassed[index]
                  ? BorderSide.none
                  : const BorderSide(
                      color: Palette.myBlue,
                      width: 1,
                    ),
              borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          widget.wasPassed[index] ? done_text : start_text,
          style: TextStyle(
            color: widget.wasPassed[index] ? Colors.white : Palette.myBlue,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
