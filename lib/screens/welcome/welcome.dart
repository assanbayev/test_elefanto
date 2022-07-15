import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_elefanto/shared/blue_text_button.dart';
import 'package:test_elefanto/shared/register_button.dart';
import '../../consts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController();
  Color dot_color = Color(0x33F24841);
  Color dot_color_chosen = Color(0xFFF24841);
  int currentImage = 0;
  int imagesCount = welcome_images_expl.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
              flex: 8,
              child: PageView(
                scrollBehavior: AppScrollBehavior(),
                controller: pageController,
                allowImplicitScrolling: true,
                children: [
                  for (int i = 0; i < welcome_images_url.length; i++)
                    imageWithText(welcome_images_url[i], welcome_images_expl[i])
                ],
                onPageChanged: (i) {
                  currentImage = i;
                  setState(() {});
                },
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  bottomDots(currentImage),
                  currentImage == (imagesCount - 1)
                      ? goToNextPage()
                      : scipImages(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWithText(String imageUrl, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            child: Text(text, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget bottomDots(int currentDot) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < imagesCount; i++)
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: i == currentDot ? dot_color_chosen : dot_color,
                  borderRadius: BorderRadius.circular(2.5),
                ),
                margin: const EdgeInsets.all(2),
              )
          ],
        ),
      ),
    );
  }

  Widget scipImages() {
    return BlueTextButton(
      text: 'Пропустить',
      asyncCallback: onScipImagesPressed,
    );
  }

  Future onScipImagesPressed() async {
    await pageController.animateToPage(imagesCount - 1,
        duration:
            Duration(milliseconds: 200 * (imagesCount - 1 - currentImage)),
        curve: Curves.easeInOut);
    currentImage = imagesCount - 1;
    setState(() {});
  }

  Widget goToNextPage() {
    Color color = Color(0xFF00B7F4);
    return RegisterButton(
      text: 'Поехали',
      backgroundColor: color,
      voidCallback: onGoToNextPagePressed,
    );
  }

  onGoToNextPagePressed() {}
}

//to make PageView scrollable on web
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
