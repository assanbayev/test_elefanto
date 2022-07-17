import 'package:flutter/material.dart';
import 'package:test_elefanto/screens/main_content/title_widget.dart';

import '../../font_consts/app_strings.dart';
import '../../font_consts/size_config.dart';
import '../../shared/blue_text_button.dart';

class OnlineBooking extends StatelessWidget {
  final List<String> imgUrls;
  final String title;
  const OnlineBooking({Key? key, required this.imgUrls, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double containerWidth = SizeConfig.screenWidth * 0.445;
    double containerHeight = containerWidth * (195 / 167);
    return Container(
      child: Column(
        children: [
          TitleWidget(
            title,
            isSeeAll: true,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.default_horizontal_margin_main_content),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    imgUrls[0],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    imgUrls[1],
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
