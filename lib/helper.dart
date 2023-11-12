import 'package:app_quiz/topic_selection_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admin_topic_selection.dart';
import 'login.dart';


class AuthService {
  final auth = FirebaseAuth.instance;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController adminEmail = TextEditingController();
  TextEditingController adminPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  final firestore = FirebaseFirestore.instance;

  void LoginUser(context) async {
    try {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.signInWithEmailAndPassword(
          email: email!.text, password: password!.text).then((value) {
        print("User Is Logged In");
        Navigator.pop(context);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>
              TopicSelection()), // Replace with your login screen widget
        );
      });
    } catch (e) {
      Navigator.pop(context);
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Error Message"),
          content: Text(e.toString()),
        );
      });
    }
  }

  void adminLogin(context) async {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
    await FirebaseFirestore.instance.collection("admin").doc("adminLogin")
        .snapshots().forEach((element) {
      if (element.data()?['adminEmail'] == adminEmail.text &&
          element.data()?['adminPassword'] == adminPassword.text) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => AdminPanel()), (
                route) => false);
      }
    }).catchError((e) {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Error Message"),
          content: Text(e.toString()),
        );
      });
    });
  }


  void RegisterUser(context) async {
    try {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.createUserWithEmailAndPassword(
          email: email!.text, password: password!.text).then((value) {
        print("User Is Registered");
        firestore.collection("user").add({
          "name": name.text,
          "email": email.text,
          "password": password.text,
          "uid": auth.currentUser!.uid
        });

        Navigator.pop(context);

        Navigator.push(context, MaterialPageRoute(builder: (c) => Login()));
      });
    } catch (e) {
      Navigator.pop(context);
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text("Error Message"),
          content: Text(e.toString()),
        );
      });
    }
  }

  void logOutUser(BuildContext context) async {
    await auth.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) =>
          Login()), // Replace with your login screen widget
    );
  }
}
class createquiz {

  Future<void> addQuizData(Map<String, dynamic> quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }
  Future<void> addQuestionData(Map<String, dynamic> questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e);
    });


  }
  Stream<QuerySnapshot> getQuizData() {
    return FirebaseFirestore.instance.collection("Quiz").snapshots();
  }
}







// }
// class createquiz{
//   final firestore = FirebaseFirestore.instance;
//   TextEditingController quizImageUrl= TextEditingController();
//   TextEditingController quizDescription= TextEditingController();
//   TextEditingController quizTitle= TextEditingController();
//
//   void AddQuiz(context) async {
//     try{
//       showDialog(context: context, builder: (context) {
//         return AlertDialog(
//           title: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       });
//       await firestore.collection("Quiz").add({
//         "quizImageUrl": quizImageUrl.text,
//         "quizDescription": quizDescription.text,
//         "quizTitle": quizTitle.text,
//     });}
//     catch (e) {
//         Navigator.pop(context);
//         showDialog(context: context, builder: (context) {
//           return AlertDialog(
//             title: Text("Error Message"),
//             content: Text(e.toString()),
//           );
//         });
//       }
//   }
//
// }
