import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/palette.dart';
import 'package:test_elefanto/font_consts/size_config.dart';

import '../../font_consts/app_strings.dart';
import '../../shared/blue_text_button.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool isSeeAll;
  const TitleWidget(
    this.title, {
    this.isSeeAll = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.default_horizontal_margin_main_content,
              right: SizeConfig.default_horizontal_margin_main_content,
              bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Palette.default_black, fontSize: 17),
                ),
              ),
              isSeeAll ? BlueTextButton(text: see_all_text) : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
