
import 'package:app_quiz/form_container_widget.dart';
import 'package:app_quiz/signup.dart';
import 'package:flutter/material.dart';

import 'login.dart';


void main()  {

  runApp(MaterialApp(
    home: Register(),
  ));
}


class Register extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SignUp Your Account",style: TextStyle(color: Colors.lightBlue,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 16.0,
              ),
              FormContainerWidget(
                hintText: "User Name",
                isPasswordField: false,

              ),
              SizedBox(
                height: 16.0,
              ),
              FormContainerWidget(
                hintText: "Email",
                isPasswordField: false,

              ),
              SizedBox(
                height: 16.0,
              ),
              FormContainerWidget(
                hintText: "Password",
                isPasswordField: true,
              ),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              SizedBox(width: 5,),
              GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (context) => Login()), (route) => false);
                  },
                  child: Text("Login", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),))


            ],
          ),
  ],
      ),
          ),
      ),
    );
  }
}
