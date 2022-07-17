import 'package:flutter/material.dart';
import 'package:test_elefanto/font_consts/app_strings.dart';
import 'package:test_elefanto/font_consts/palette.dart';
import 'package:test_elefanto/font_consts/size_config.dart';
import 'package:test_elefanto/model/news_sales_card.dart';
import 'package:test_elefanto/screens/main_content/title_widget.dart';
import 'package:test_elefanto/shared/blue_text_button.dart';

class NewsSalesWidget extends StatelessWidget {
  final List<NewsSalesCard> newsList;
  final String title;
  const NewsSalesWidget({Key? key, required this.title, required this.newsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double containerWidth = SizeConfig.screenWidth -
        SizeConfig.default_horizontal_margin_main_content * 2;
    double containerHeight = containerWidth / 2;
    return Container(
      child: Column(
        children: [
          TitleWidget(
            title,
            isSeeAll: true,
          ),
          Container(
            height: containerHeight + 15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: newsList.length,
              itemBuilder: ((context, index) {
                return newsSaleWidget(newsList[index], index);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget newsSaleWidget(NewsSalesCard news, int index) {
    double newContainerWidth = SizeConfig.screenWidth -
        SizeConfig.default_horizontal_margin_main_content * 2;
    double newContainerHeight = newContainerWidth / 2;
    return Container(
      //alignment: Alignment.topLeft,
      padding: EdgeInsets.only(bottom: 15),
      child: Container(
        width: newContainerWidth,
        height: newContainerHeight,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(
          left: index == 0
              ? SizeConfig.default_horizontal_margin_main_content
              : 0,
          right: SizeConfig.default_horizontal_margin_main_content * 0.5,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5,
                  offset: Offset(0, 5),
                  spreadRadius: 0,
                  color: Color.fromRGBO(138, 149, 158, 0.5))
            ]),
        child: Stack(
          children: [
            Row(
              children: [
                //первая половина
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    news.imgUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),

                //вторая половина
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.02,
                        vertical: SizeConfig.screenWidth * 0.03),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //содержимое второй половины
                        Text(
                          news.hashtag,
                          style: const TextStyle(color: Palette.myRed),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          news.title,
                          style: const TextStyle(
                              color: Palette.default_black, fontSize: 17),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              news.subtitle,
                              softWrap: true,
                              style: const TextStyle(
                                  color: Palette.default_black, fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              // textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            news.isNew
                ? Positioned(
                    top: newContainerWidth * 0.04,
                    left: newContainerWidth * 0.05,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                          color: Palette.myRed,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          "New",
                          style: TextStyle(
                              color: Palette.default_black, fontSize: 12),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
