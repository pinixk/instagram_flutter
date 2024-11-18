import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/profile_screens.dart';
import 'package:instagram_flutter/widgets/sign_in_form.dart';
import 'package:instagram_flutter/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  Widget currentWidget = SignUpForm();

  Widget signUpForm = SignUpForm();
  Widget signInForm = SignInForm();

  @override
  void initState() {
    if (currentWidget == null) {
      currentWidget = signUpForm;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AuthScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 키보드가 올라왔을 때 스크롤을 하고 싶을 때
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: duration,
              child: currentWidget,
            ),
            Positioned(
              height: 40,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: FlatButton(
                  shape: Border(top: BorderSide(color: Colors.grey)),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      if (currentWidget is SignUpForm) {
                        currentWidget = signInForm;
                      } else {
                        currentWidget = signUpForm;
                      }
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                        text: (currentWidget is SignUpForm)
                            ? 'Already have an account?'
                            : "Don't have an account?",
                        style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
