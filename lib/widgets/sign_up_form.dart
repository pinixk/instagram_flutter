import 'dart:html';

import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/auth_input_decor.dart';
import 'package:instagram_flutter/constants/common_size.dart';
import 'package:instagram_flutter/constants/screen_size.dart';
import 'package:instagram_flutter/home_page.dart';
import 'package:instagram_flutter/widgets/or_divider.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  Size signSize;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: common_l_gap),
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  bottom: 60,
                  left: 50,
                  right: 50,
                ),
                child: Image.asset('assets/images/insta_logo.png'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: textInputDecor('Email'),
                cursorColor: Colors.black54,
                validator: (text) {
                  if (text.isNotEmpty && text.contains('@')) {
                    return null;
                  } else {
                    return '정확한 이메일 주소를 입력해주세요';
                  }
                },
              ),
              SizedBox(height: common_xs_gap),
              TextFormField(
                controller: _pwController,
                decoration: textInputDecor('Password'),
                cursorColor: Colors.black54,
                obscureText: true,
                validator: (text) {
                  if (text.isNotEmpty && text.length > 5) {
                    return null;
                  } else {
                    return '제대로 된 비밀번호를 입력해주세요';
                  }
                },
              ),
              SizedBox(height: common_xs_gap),
              TextFormField(
                controller: _cpwController,
                decoration: textInputDecor('Confirm Password'),
                cursorColor: Colors.black54,
                obscureText: true,
                validator: (text) {
                  if (text.isNotEmpty &&
                      _pwController.text == _cpwController.text) {
                    return null;
                  } else {
                    return '입력한 값이 비밀번호와 일치하지 않습니다';
                  }
                },
              ),
              SizedBox(height: common_s_gap),
              _submitBtn(context),
              SizedBox(height: common_gap),
              orDivider(),
              SizedBox(height: common_gap),
              FlatButton.icon(
                onPressed: () {},
                textColor: Colors.blue,
                icon: ImageIcon(AssetImage('assets/images/facebook_icon.png')),
                label: Text('Login with Facebook'),
              )
            ],
          ),
        ),
      ),
    );
  }

  FlatButton _submitBtn(BuildContext context) {
    return FlatButton(
              color: Colors.blue,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print('validation success!!');
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              child: Text(
                'Join',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            );
  }
}


