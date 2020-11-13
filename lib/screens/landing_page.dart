import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musa_app/constants/constants.dart';
import 'package:musa_app/ui_view/slider_layout_view.dart';
import 'package:musa_app/widgets/custom_font.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff304a6),
      body: onBordingBody(),
    );
  }

  Widget onBordingBody() => Container(
        child: SliderLayoutView(),
      );
}
