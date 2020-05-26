import 'package:flutter/material.dart';
import 'package:myapp/page_model.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> images = [
    "assets/images/bg.jpg",
    "assets/images/bg2.jpg",
    "assets/images/bg3.jpg",
    "assets/images/bg4.jpg"
  ];
  List<PageModel> pages = List<PageModel>();

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
}
