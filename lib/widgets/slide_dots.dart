import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.3),
      height: isActive ? 10 : 6,
      width: isActive ? 10 : 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        border: isActive
            ? Border.all(
                color: Color(0xff927DFF),
                width: 2.0,
              )
            : Border.all(
                color: Colors.transparent,
                width: 1,
              ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: RawMaterialButton(
        onPressed: () {},
        child: Text("Get Started"),
        textStyle: TextStyle(
            fontSize: 20.0,
            color: Color(0xfff304a6),
            fontWeight: FontWeight.normal),
        fillColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        constraints: BoxConstraints.tightFor(height: 50.0, width: 90.0),
      ),
    );
  }
}
