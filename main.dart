import 'dart:ui';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:team_zero_app/OwnerView.dart';
import 'User_View.dart';
import 'OwnerView.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
void main() {
  runApp(MaterialApp(home:MyApp(),theme: ThemeData(primaryColor: Colors.blue,)));
}
enum userSelect { Customer, Owner }
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Future<User> signInWithGoogle() async {
    Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);
        print("Google Sign-In Successful");
        return userCredential.user;
      } on FirebaseAuthException catch (e) {
        //_showMyDialog(e.code,);
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          print("account-exists-with-different-credential");
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
          print("invalid-credential");
        }
      } catch (e) {
        // handle the error here
        print(e);
      }
    }
  }

class _MyAppState extends State<MyApp> {
  userSelect _site= userSelect.Customer;
  bool showInputField = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Center(child:Text("Distancer",style: TextStyle(color: Colors.black,),),),),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background/image.jpg'),
          fit: BoxFit.cover)
        ),
        child:
         Column(
          children: [
          Container(child:
          Text('Welcome to Distancer',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.white,fontWeight: FontWeight.bold),),
          margin: EdgeInsets.only(top:50,bottom:100),),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           Radio(  
              value: userSelect.Customer,  
              groupValue: _site,  
              onChanged: (userSelect value) {  
                setState(() {  
                  _site = value;
                  showInputField=true;  
                });  
              },  
            ),
            Text('Customer',style: TextStyle(color: Colors.white),),
            Radio(  
              value: userSelect.Owner,  
              groupValue: _site,  
              onChanged: (userSelect value) {  
                setState(() {  
                  _site = value;
                  showInputField=false;  
                });  
              },  
            ),
            Text('Shop Owner',style: TextStyle(color: Colors.white)),
        ],
        ),
          showInputField ? userPinCode() : ownerLogin(),
          ]
          ),
      ),
    );
  }
  Widget userPinCode()
  {
    return Container(child: 
    Column(children:
      [
        Center(child:Text('Enter Pincode',style: TextStyle(fontSize: 20,color: Colors.white),)),
        OTPTextField(
          length: 6,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 30,
          style: TextStyle(
            fontSize: 17
          ),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            print("Completed: " + pin);
            Navigator.push(context,MaterialPageRoute(builder: (context) => UserView()),);
          },
        ),
      ],
      ),
      margin: EdgeInsets.only(top:40),
      );
  }
  Widget ownerLogin()
  {
    return Container(child: 
    Column(children:[
    Text('Owner SignIn',style: TextStyle(fontSize: 20,color: Colors.white),),
    Text('',style: TextStyle(fontSize: 20)),
    SignInButton(
      Buttons.Google,
      text: "Sign up with Google",
      onPressed: () async {
        await signInWithGoogle();
        Navigator.push(context,MaterialPageRoute(builder: (context) => OwnerView()),);
      },
    )
    ]
    ),
    margin: EdgeInsets.only(top:60),
    );
  }
}
