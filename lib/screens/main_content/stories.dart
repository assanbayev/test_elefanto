import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/size_config.dart';

class Stories extends StatelessWidget {
  final List<String> imgUrls;
  final Function(int) onStoryTapped;
  const Stories({Key? key, required this.imgUrls, required this.onStoryTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double storyWidth = SizeConfig.screenWidth * 0.2666;
    double storyHeight = storyWidth * 1.4;
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: storyHeight,
      child: ListView.builder(
        itemCount: imgUrls.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () => onStoryTapped(index),
            child: Container(
              width: storyWidth,
              height: storyHeight,
              margin: EdgeInsets.only(
                left: SizeConfig.default_horizontal_margin_main_content,
                right: (index == imgUrls.length - 1)
                    ? SizeConfig.default_horizontal_margin_main_content
                    : 0,
              ),
              child: AspectRatio(
                aspectRatio: 1.4,
                child: Image.asset(
                  imgUrls[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

//to make PageView scrollable on web
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
