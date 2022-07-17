import 'package:flutter/material.dart';
import 'package:test_elefanto/consts.dart';
import 'package:test_elefanto/font_consts/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_elefanto/font_consts/size_config.dart';

import 'camera_button.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final List<BottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;
  final double bottomNavBarHeigth;
  const BottomNavBar(
      {Key? key,
      this.selectedIndex = 0,
      required this.items,
      required this.onItemSelected,
      required this.bottomNavBarHeigth})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late double bottomNavBarHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomNavBarHeight = widget.bottomNavBarHeigth;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      color: Colors.transparent,
      height: bottomNavBarHeight,
      width: SizeConfig.screenWidth,
      child: Stack(
        children: [
          //custom drawed bottom nav bar
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomPaint(
              painter: NavBarDrawer(),
              child: Container(
                color: Colors.transparent,
                height: bottomNavBarHeight,
                width: SizeConfig.screenWidth,
                child: Container(
                  color: Colors.transparent,
                  // color: Colors.orange,
                  child:
                      //items row
                      Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            bottomNavBarIcon(
                              bottom_nav_bar_items[0],
                              0,
                            ),
                            bottomNavBarIcon(
                              bottom_nav_bar_items[1],
                              1,
                            ),
                          ],
                        ),
                      ),
                      Flexible(flex: 2, child: Container()),
                      Flexible(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            bottomNavBarIcon(
                              bottom_nav_bar_items[2],
                              2,
                            ),
                            bottomNavBarIcon(
                              bottom_nav_bar_items[3],
                              3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavBarIcon(BottomNavBarItem item, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomNavBarHeight * 0.15),
      width: SizeConfig.screenWidth * 0.15,
      child: GestureDetector(
        onTap: () => widget.onItemSelected(index),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              item.iconPath,
              height: bottomNavBarHeight * 0.35,
              width: bottomNavBarHeight * 0.35,
              color: widget.selectedIndex == index
                  ? item.activeColor
                  : item.inactiveColor,
            ),
            Text(
              item.title,
              style: TextStyle(
                color: widget.selectedIndex == index
                    ? item.activeColor
                    : item.inactiveColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double convertRadiusToSigma(double radius) {
  return radius * 0.57735 + 0.5;
}

class NavBarDrawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    double w = size.width;
    Paint paint0 = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    //..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(3));

    Path path0 = Path();
    //from top left 10% points down
    path0.moveTo(
      0,
      h * 0.1,
    );
    //make line till bottom left
    path0.lineTo(
      0,
      h,
    );
    //make line till bottom right
    path0.lineTo(
      size.width,
      h,
    );
    //make line till almost top right
    path0.lineTo(
      size.width,
      h * 0.1,
    );
    //draw a curve on top right
    path0.quadraticBezierTo(
      size.width,
      0,
      size.width * 0.9750000,
      0,
    );

    path0.cubicTo(
      size.width * 0.9,
      0,
      size.width * 0.75,
      0,
      size.width * 0.70,
      0,
    );
    path0.cubicTo(
      size.width * 0.65,
      0,
      size.width * 0.6,
      h * 0.5,
      size.width * 0.5,
      h * 0.5,
    );
    path0.cubicTo(
      size.width * 0.4,
      h * 0.5,
      size.width * 0.35,
      0,
      size.width * 0.3,
      0,
    );
    path0.cubicTo(
      size.width * 0.25,
      0,
      size.width * 0.1,
      0,
      size.width * 0.025,
      0,
    );
    path0.quadraticBezierTo(
      0,
      0,
      0,
      h * 0.1,
    );
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomNavBarItem {
  BottomNavBarItem({
    required this.iconPath,
    required this.title,
    this.activeColor = Palette.myRed,
    this.textAlign,
    this.inactiveColor = Palette.inputText,
  });

  final String iconPath;
  final String title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
}
