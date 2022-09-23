import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'signup.dart';

class loginWidget extends StatefulWidget {
  const loginWidget({Key? key}) : super(key: key);

  @override
  State<loginWidget> createState() => _loginWidgetState();
}

class _loginWidgetState extends State<loginWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Instagram',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child:
                TextButton(
                  onPressed: () {
                    context.read<Store1>().changeScreenIndex(2);
                  },
                  child: const Text('Sign in'),
                )
            ) ,
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                    dynamic tuserdb = context.read<Store1>().users.readUsers();
                    FutureBuilder(
                      future : tuserdb,
                      builder : (context, snapshot){

                        print(tuserdb);
                        if( snapshot.hasData){

                          Map<String,dynamic> userdb = jsonDecode(tuserdb);
                          if(userdb[nameController.text] ?? false) {
                            print(userdb[nameController.text]['password']);
                            print(passwordController.text);
                            if (userdb[nameController.text]['password'] ==
                                passwordController.text)
                              context.read<Store1>().changeScreenIndex(1);
                          }
                          else print("유저 정보가 올바르지 않습니다");
                        }
                        return CircularProgressIndicator();
                      },

                    );


                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
