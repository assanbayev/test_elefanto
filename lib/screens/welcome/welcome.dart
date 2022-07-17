import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/palette.dart';
import 'package:test_elefanto/screens/sign_in/sign_in_register.dart';
import 'package:test_elefanto/shared/blue_text_button.dart';
import 'package:test_elefanto/shared/long_button.dart';
import '../../consts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController();

  int currentImage = 0;
  int imagesCount = welcome_images_expl.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
              flex: 11,
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
            child: Text(text,
                style: TextStyle(fontSize: 22), textAlign: TextAlign.center),
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
              Opacity(
                opacity: i == currentDot ? 1.0 : 0.2,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Palette.myRed,
                    borderRadius: BorderRadius.circular(3.5),
                  ),
                  margin: const EdgeInsets.all(4),
                ),
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
    return LongButton(
      text: 'Поехали',
      backgroundColor: color,
      voidCallback: onGoToNextPagePressed,
    );
  }

  onGoToNextPagePressed() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const SignInAndRegister()));
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
