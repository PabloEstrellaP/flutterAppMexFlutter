import 'dart:convert';


import 'package:autenticar_google/global/environment.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class UserService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future signInWithGoogle( ) async {
    try{
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;
      
      final signInWithGoogleEndpoint = getPath( '/' );
      final userData = account;
      final session = await http.post( signInWithGoogleEndpoint, 
        body: {
          'token' : googleKey.idToken,
          'email' : userData.email
        }
      );
      final body = jsonDecode(session.body);
      return body;
      
    }
    catch( error ){
      print('Error en google');
      print( error );
      return null;
    }
  }
 

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
 

  static getPath( pathService ){
    return Uri(
        scheme: Environment.scheme,
        // host: ' http://192.168.1.73:8080/',
        host: Environment.host,
        port: 3001,
        path: '/user' + pathService,
      );
  }
}