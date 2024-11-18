import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/profile_screens.dart';
import 'package:instagram_flutter/widgets/fade_stack.dart';
import 'package:instagram_flutter/widgets/sign_in_form.dart';
import 'package:instagram_flutter/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> forms = [SignUpForm(), SignInForm()];
  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 화면 전환!
            FadeStack(
              selectedForm: selectedForm,
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    selectedForm == 0 ? selectedForm = 1 : selectedForm = 0;
                  });
                },
                child: Text('go to Sign up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
