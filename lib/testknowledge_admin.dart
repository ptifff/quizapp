
import 'package:flutter/material.dart';

import 'create_quiz.dart';
import 'helper.dart';

class TestKnowledgeAdmin extends StatefulWidget {
  @override
  State<TestKnowledgeAdmin> createState() => _TestKnowledgeAdminState();
}

class _TestKnowledgeAdminState extends State<TestKnowledgeAdmin> {
  Stream? quizStream;
  createquiz viewquiz = createquiz();


  Widget quizlist(){
    return Container(
      child:StreamBuilder(
        stream: quizStream,
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator while data is being fetched.
          }
          if (snapshots.hasData) {
            // Data is available, proceed with rendering the list.
            // Add a print statement to debug and see the data.
            print(snapshots.data.documents);
            return ListView.builder(
              itemCount: snapshots.data.documents.length,
              itemBuilder: (context, index) {
                return QuizTitle(quizImageUrl: snapshots.data.documents[index].data["quizImageUrl"],
                quizTitle: snapshots.data.documents[index].data["quizTitle"],
                quizDesc: snapshots.data.documents[index].data["quizDesc"]);

              },
            );
          } else if (snapshots.hasError) {
            return Text("Error: ${snapshots.error}");
          } else {
            return Text("No data available");
          }
        },
      )

    );
  }
 @override
 void initState() {
   super.initState();
   quizStream = viewquiz.getQuizData(); // Use the updated method with Stream

   // Optionally, you can add a listener to handle errors and updates in the stream
   quizStream?.listen((event) {
     // Handle updates or errors here
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz View For Admin'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute
            (builder: (context) => CreateQuiz()));
      },

      ),
    );
  }
}

class QuizTitle extends StatelessWidget {

final String quizImageUrl;
final String quizTitle;
final String quizDesc;
QuizTitle({required this.quizImageUrl,required this.quizTitle,required this.quizDesc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(quizImageUrl),
          Container(
            child: Column(children: [
              Text(quizTitle),
              Text(quizDesc)
            ],),
          )
        ],
      ),
    );
  }
}

