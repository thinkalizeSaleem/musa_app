import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:musa_app/screens/Login/login_screen.dart';
import 'package:musa_app/screens/landing_page.dart';
//
// import 'constants/constants.dart';
//
// void main() {
//   FlutterError.onError = (FlutterErrorDetails details) {
//     FlutterError.dumpErrorToConsole(details);
//     if (kReleaseMode) exit(1);
//   };
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//       statusBarBrightness:
//           Platform.isAndroid ? Brightness.dark : Brightness.light,
//       systemNavigationBarColor: Colors.white,
//       systemNavigationBarDividerColor: Colors.grey,
//       systemNavigationBarIconBrightness: Brightness.dark,
//     ));
//     return MaterialApp(
//       title: '',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         platform: TargetPlatform.iOS,
//       ),
//       // initialRoute: '/',
//       // routes: {
//       //   // When navigating to the "/" route, build the FirstScreen widget.
//       //   '/': (context) => LandingPage(),
//       //   // When navigating to the "/second" route, build the SecondScreen widget.
//       //   '/second': (context) => Login(),
//       // },
//       home: LandingPage(),
//     );
//   }
// }
//
// class Login extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Auth',
//       theme: ThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musa_app/constants/constants.dart';
import 'package:musa_app/screens/Login/login_screen.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

// const COLOR_PRIMARY_ARK = Color(0xFF6900be);

final _currentPageNotifier = ValueNotifier<int>(0);
final List<String> _titlesList = [
  'Manage Images',
  'Sponsor/Promote yourself',
  'Like/Follow and Many More!'
];
final List<String> _subtitlesList = [
  'Upload images with their descriptive and svae theril audio in an album.',
  'Advertise using sponsored banners or popups as well as sponsor yourself.',
  'You can get and give likes as well as follow others users and have a chat with them.'
];
final List<IconData> _imageList = [
  Icons.developer_mode,
  Icons.layers,
  Icons.account_circle
];
final List<Widget> _pages = [];

List<Widget> populatePages() {
  _pages.clear();
  _titlesList.asMap().forEach((index, value) => _pages.add(getPage(
      _imageList.elementAt(index), value, _subtitlesList.elementAt(index))));
  _pages.add(getLastPage());
  return _pages;
}

Widget _buildCircleIndicator() {
  return CirclePageIndicator(
    selectedDotColor: Colors.black,
    dotColor: Colors.black45,
    itemCount: _pages.length,
    selectedSize: 8,
    size: 6.5,
    currentPageNotifier: _currentPageNotifier,
  );
}

Widget getPage(IconData icon, String title, String subTitle) {
  return Center(
    child: Container(
      color: (kPrimaryColor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: new Icon(
                  icon,
                  color: Colors.black,
                  size: 120,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  subTitle,
                  style: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget getLastPage() {
  return Center(
    child: Builder(
      builder: (contex) => Center(
        child: Container(
          color: (kPrimaryColor),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: new Icon(
                      Icons.code,
                      color: Colors.black,
                      size: 120,
                    ),
                  ),
                  Text(
                    'Jump straight into the action.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.push(
                            contex,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        borderSide: BorderSide(color: Colors.black),
                        shape: StadiumBorder(),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: (kPrimaryColor)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(
        children: <Widget>[
          PageView(
            children: populatePages(),
            onPageChanged: (int index) {
              _currentPageNotifier.value = index;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildCircleIndicator(),
            ),
          )
        ],
      )),
    );
  }
}

void main() => runApp(MyApp());
