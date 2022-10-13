import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/rouded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
  static String id = 'welcome_screen';
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      //upperBound: 100,
      vsync: this,
    );
    animationController.forward();
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.blue)
        .animate(animationController);
    // the Following code is used to make the size of animation bounce in and back
    // animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     animationController.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     animationController.forward();
    //   }
    // });
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animationController.value * 100,
                  ),
                ),
                Text(
                  //'${animationController.value.toInt()}%',
                  'Flash Chat',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.lightBlueAccent,
              text: 'Login',
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Colors.blueAccent,
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
