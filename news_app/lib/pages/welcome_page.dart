import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

import '../page_model.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<PageModel> pages = List<PageModel>();

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPage() {
    pages.add(
      PageModel("Welcome", "Welcome to our News App Swap to see App Pages.",
          Icons.ac_unit, "assets/images/bg.jpg"),
    );
    pages.add(
      PageModel("Alarm", "2- Welcome to our News App Swap to see App Pages.",
          Icons.alarm, "assets/images/bg2.jpg"),
    );
    pages.add(
      PageModel("Print", "3- Welcome to our News App Swap to see App Pages.",
          Icons.print, "assets/images/bg3.jpg"),
    );
    pages.add(
      PageModel("Map", "4- Welcome to our News App Swap to see App Pages.",
          Icons.map, "assets/images/bg4.jpg"),
    );
  }

  @override
  Widget build(BuildContext context) {
    _addPage();
    return Stack(
      children: [
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(pages[index].image),
                        repeat: ImageRepeat.noRepeat,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -100),
                        child: Icon(
                          pages[index].icon,
                          color: Colors.white,
                          size: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 15,
                        ),
                        child: Text(
                          pages[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: Text(
                          pages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade100,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 175),
          child: Align(
            alignment: Alignment.center,
            child: _displayPageIndicators(pages.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 9.0,
        color: Colors.grey.shade100,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 9.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
