import 'package:flutter/material.dart';

import 'package:autenticar_google/services/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register page'),
        actions: [
          IconButton(
            onPressed: () async{
              await UserService.signOut();
              showWebColoredToast( 'Ha cerrado sesión');
            }, 
            icon: Icon(FontAwesomeIcons.doorOpen)
          )
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: MaterialButton(
            splashColor: Colors.transparent,
            minWidth: double.infinity,
            height: 40,
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            onPressed: () async{
              final response = await UserService.signInWithGoogle();
              print(response);
              if( response['ok'] ){
                print( response );
                showWebColoredToast( 'Ha inciado sesión');

              }else{
                await UserService.signOut();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon( FontAwesomeIcons.google, color: Colors.white,),
                Text( ' Registrar con google', style: TextStyle( color: Colors.white, fontSize: 17 ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void showWebColoredToast( msg ) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      webBgColor: "#e74c3c",
      textColor: Colors.white,
      timeInSecForIosWeb: 5,
    );
  } 
}