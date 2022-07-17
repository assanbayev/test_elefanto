import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_elefanto/consts.dart';
import 'package:test_elefanto/font_consts/app_strings.dart';
import 'package:test_elefanto/font_consts/palette.dart';
import 'package:test_elefanto/font_consts/size_config.dart';
import 'package:test_elefanto/screens/main_content/active_story.dart';
import 'package:test_elefanto/screens/main_content/ankets.dart';
import 'package:test_elefanto/screens/main_content/bottom_navbar.dart';
import 'package:test_elefanto/screens/main_content/camera_button.dart';
import 'package:test_elefanto/screens/main_content/categories.dart';
import 'package:test_elefanto/screens/main_content/news_sales.dart';
import 'package:test_elefanto/screens/main_content/online_booking.dart';
import 'package:test_elefanto/screens/main_content/stories.dart';

import 'dropdown_list.dart';
import 'quests.dart';

class MainContent extends StatefulWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  int selectedIndex = 0;
  late double default_horizontal_margin;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double backgroundImageWidth = SizeConfig.screenWidth * (694 / 375);
    double backgroundImageHeight = backgroundImageWidth * (1527 / 694);
    return Stack(
      children: [
        Scaffold(
          body: Container(
            child: SafeArea(
                child:
                    //stack to put a background image
                    Stack(
              children: [
                //background image
                Positioned(
                  left: SizeConfig.screenWidth * 0.594 * (-1),
                  top: SizeConfig.screenHeight * 0.3,
                  child: Container(
                    height: backgroundImageHeight,
                    width: backgroundImageWidth,
                    child: Image.asset(
                      main_background_url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomDropDownList(
                        onItemSelected: onDropdownSelected,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        alignment: Alignment.center,
                        child: const Text(
                          today_not_working_text,
                          style: TextStyle(color: Palette.myRed, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Stories(
                        imgUrls: stories_images_url,
                        onStoryTapped: onStoryTapped,
                      ),
                      const SizedBox(height: 15),
                      const Categories(),
                      const SizedBox(height: 15),
                      const NewsSalesWidget(
                        title: news_text,
                        newsList: news_list,
                      ),
                      const NewsSalesWidget(
                        title: sales_text,
                        newsList: sales_list,
                      ),
                      const OnlineBooking(
                          imgUrls: online_booking_imgs_list,
                          title: online_booking_text),
                      const SizedBox(height: 15),
                      Ankets(
                          anketNames: ankets_list,
                          wasPassed: was_ankets_passed_list),
                      const SizedBox(height: 15),
                      const Quests(
                        title: quests_text,
                        images: quest_imgs_list,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.2,
                      ),

                      // const OnlineBooking(imgUrls: , title:online_booking_text)
                    ],
                  ),
                ),
                isStoriesActive
                    ? ActiveStory(
                        imgUrls: stories_images_url,
                        currentImg: currentStoryIndex,
                        closeStory: closeStories)
                    : const SizedBox(),
                Positioned(
                  bottom: 0,
                  child: BottomNavBar(
                    selectedIndex: selectedIndex,
                    items: bottom_nav_bar_items,
                    onItemSelected: onItemSelected,
                    bottomNavBarHeigth: 70,
                  ),
                ),
                CameraButton(
                  bottomNavBarHeight: 70,
                  onTapped: () {},
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }

  onDropdownSelected(String selected) {}
  onItemSelected(int item) {
    if (selectedIndex == item) return;
    selectedIndex = item;
    setState(() {});
  }

  onCameraButtonTapped() {}
  bool isStoriesActive = false;
  int currentStoryIndex = 0;
  onStoryTapped(int index) {
    currentStoryIndex = index;
    isStoriesActive = true;
    setState(() {});
  }

  closeStories() {
    print('close story');
    isStoriesActive = false;
    setState(() {});
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
