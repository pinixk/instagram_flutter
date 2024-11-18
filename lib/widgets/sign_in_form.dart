import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/auth_input_decor.dart';
import 'package:instagram_flutter/constants/common_size.dart';

import '../home_page.dart';
import 'or_divider.dart';

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
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
              FlatButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgotten Password?',
                        style: TextStyle(color: Colors.blue)),
                  )),
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
        'Sign in',
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
  }
}
