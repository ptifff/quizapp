import 'package:app_quiz/gatherknowledge_user.dart';
import 'package:app_quiz/testknowledge_admin.dart';
import 'package:app_quiz/testknowledge_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'create_quiz.dart';
import 'firebase_options.dart';
import 'gatherknowledge_admin.dart';
import 'splash_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        hintColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue,
        ),
      ),
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => SplashScreen(),
        '/gatherknowledge_admin': (context) => GatherKnowledgeAdmin(),
        '/testknowledge_admin': (context) => TestKnowledgeAdmin(),
        '/create_quiz': (context) => CreateQuiz(),
        '/gatherknowledge_user': (context) => GatherKnowledgeUser(),
        '/testknowledge_user': (context) => TestKnowledgeUser(),
      },

    );
  }
}

