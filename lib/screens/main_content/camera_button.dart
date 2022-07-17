import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../consts.dart';
import '../../font_consts/palette.dart';
import '../../font_consts/size_config.dart';

class CameraButton extends StatelessWidget {
  double bottomNavBarHeight;
  Function onTapped;
  CameraButton(
      {Key? key, required this.bottomNavBarHeight, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cameraCircleWidth = bottomNavBarHeight * 0.9;
    double cameraIconWidth = cameraCircleWidth * 0.4;
    return Positioned(
      bottom: bottomNavBarHeight * .65,
      left: SizeConfig.screenWidth * 0.5 - cameraCircleWidth * 0.5,
      child: Container(
        decoration: BoxDecoration(
          color: Palette.myRed,
          borderRadius: BorderRadius.circular(cameraCircleWidth * 0.5),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(222, 222, 222, 0.4),
                offset: Offset(0, 8),
                blurRadius: 24,
                spreadRadius: 3),
          ],
        ),
        height: cameraCircleWidth,
        width: cameraCircleWidth,
        child: Center(
          child: SvgPicture.asset(
            bottom_nav_bar_camera,
            height: cameraCircleWidth * 0.4,
            width: cameraCircleWidth * 0.4,
          ),
        ),
      ),
    );
  }
}
