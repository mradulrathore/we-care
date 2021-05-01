import 'package:flutter/material.dart';
import 'package:shehacks_team_055/data/data.dart';
import 'dart:io';

class SlideScreen extends StatefulWidget {
  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  // Page Indicator
  Widget pageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SliderTile(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        pageController.animateToPage(slides.length - 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text("SKIP")),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndicator(true)
                            : pageIndicator(false)
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        pageController.animateToPage(currentIndex + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text("NEXT")),
                ],
              ),
            )
          : Container(
              height: Platform.isIOS ? 70 : 60,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(
                "GET STARTED NOW",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String imageAssetPath, title, desc;

  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imageAssetPath,
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 12,
            ),
            Text(desc,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
          ],
        ));
  }
}
