import 'package:flutter/material.dart';
import 'package:test_elefanto/consts.dart';
import 'package:test_elefanto/font_consts/app_strings.dart';
import 'package:test_elefanto/font_consts/palette.dart';
import 'package:test_elefanto/font_consts/size_config.dart';
import 'package:test_elefanto/screens/main_content/title_widget.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          const TitleWidget(categories_text),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.default_horizontal_margin_main_content,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                category(shops_text, categories_images_url[0]),
                category(meal_text, categories_images_url[1]),
                category(entertainments_text, categories_images_url[2]),
                category(services_text, categories_images_url[3]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget category(String name, String imgUrl) {
    Color boxShadowColor = Color.fromRGBO(236, 236, 236, 0.69);
    return Container(
      width: SizeConfig.screenWidth * 0.2,
      height: SizeConfig.screenWidth * 0.2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: boxShadowColor,
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.screenWidth * 0.075,
            width: SizeConfig.screenWidth * 0.075,
            margin: const EdgeInsets.only(bottom: 7),
            child: Image.asset(imgUrl, fit: BoxFit.contain),
          ),
          Text(
            name,
            style: const TextStyle(color: Palette.text_black, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
