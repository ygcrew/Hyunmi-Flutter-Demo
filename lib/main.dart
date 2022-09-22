import 'package:flutter/material.dart';
import 'package:flutter_instagram_feed_ui_redesign/login.dart';
import 'package:flutter_instagram_feed_ui_redesign/screens/feed_screen.dart';
import 'package:flutter_instagram_feed_ui_redesign/signup.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:timeago/timeago.dart' as timeago;

class Store1 extends ChangeNotifier {
  var screenIndex = 0;
  var users = new UserStorage();
  void changeScreenIndex(int index){
    screenIndex = index;
    notifyListeners();
  }

}

class UserStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/Users.txt');
  }

  Future<dynamic> readUsers() async {

      final file = await _localFile;

      // 파일 읽기
      String contents = await file.readAsString();
      return contents;

  }

  Future<File> writeUsers(String user, String pw, String email) async {
    final file = await _localFile;


    var tmp = {user : {'password' : pw, 'email' : email}};

    // 파일 쓰기
    return file.writeAsString(jsonEncode(tmp));
  }

}

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (c) => Store1(),
        child: MyApp()

      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var screenIndex = context.watch<Store1>().screenIndex;
    return MaterialApp(
        title: 'Hyunmi Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: [
          Card(child: loginWidget()),
          FeedScreen(),
          Card(child: SignUpWidget())]
        [screenIndex]);
  }
}
