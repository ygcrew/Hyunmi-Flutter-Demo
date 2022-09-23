import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

const users = const {
  'at@naver.com' : '123',
  'yg@yg' : '123',
};

class LoginScreen extends StatelessWidget {

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data){
    debugPrint('name : ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if(!users.containsKey(data.name)){
        return 'User not exists';
      }
      if(users[data.name] != data.password){
        return 'Password does not match';
      }
        return null;
      }
    );
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Instagram',
      logo: Text(
        'Instagram',
        style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 30),
      ),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        //대충 화면 메인으로 바꾸는 함수
      },
      onRecoverPassword: _recoverPassword,

    );
  }
}