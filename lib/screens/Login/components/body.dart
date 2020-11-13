import 'package:flutter/material.dart';
import 'package:musa_app/Screens/Login/components/background.dart';
import 'package:musa_app/Screens/Signup/signup_screen.dart';
import 'package:musa_app/components/already_have_an_account_acheck.dart';
import 'package:musa_app/components/rounded_button.dart';
import 'package:musa_app/components/rounded_input_field.dart';
import 'package:musa_app/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Logo Comes ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  backgroundColor: Color(0xfff304a6),
                  fontSize: 20),
            ),
            Text(
              "here",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  backgroundColor: Color(0xfff304a6),
                  fontSize: 20),
            ),
            // SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/login.svg",
            //   height: size.height * 0.35,
            // ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
