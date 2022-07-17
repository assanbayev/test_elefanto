import 'package:flutter/material.dart';

import '../../font_consts/size_config.dart';

class ActiveStory extends StatefulWidget {
  final List<String> imgUrls;
  int currentImg;
  Function closeStory;
  ActiveStory(
      {Key? key,
      required this.imgUrls,
      required this.currentImg,
      required this.closeStory})
      : super(key: key);

  @override
  State<ActiveStory> createState() => _ActiveStoryState();
}

class _ActiveStoryState extends State<ActiveStory> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.default_horizontal_margin_main_content),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.96)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              for (int i = 0; i < widget.imgUrls.length; i++)
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      widget.currentImg = i;
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      height: 3,
                      decoration: BoxDecoration(
                          color: i == widget.currentImg
                              ? Colors.white
                              : Color(0xff8B8B8B)),
                    ),
                  ),
                )
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                widget.closeStory();
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: SizeConfig.screenHeight * 0.6,
            child: Image.asset(
              widget.imgUrls[widget.currentImg],
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
