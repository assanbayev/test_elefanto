import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/size_config.dart';
import 'package:test_elefanto/screens/main_content/title_widget.dart';

class Quests extends StatelessWidget {
  final String title;
  final List<String> images;
  const Quests({Key? key, required this.title, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double containerWidth = SizeConfig.screenWidth * (164 / 360);
    double containerHeight = containerWidth * (92 / 164);

    return Container(
      child: Column(children: [
        TitleWidget(
          title,
          isSeeAll: true,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.default_horizontal_margin_main_content),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: containerHeight,
                width: containerWidth,
                child: Image.asset(
                  images[0],
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                height: containerHeight,
                width: containerWidth,
                child: Image.asset(
                  images[1],
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
