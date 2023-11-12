import 'package:app_quiz/widget.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import 'addquestion.dart';
import 'helper.dart';

class CreateQuiz extends StatefulWidget {

  @override
  _CreateQuizState createState() => _CreateQuizState();

}

class _CreateQuizState extends State<CreateQuiz> {

  createquiz crequiz = createquiz();
  final _formKey = GlobalKey<FormState>();

  String quizImageUrl = '';
  String quizTitle = '';
  String quizDescription = '';
  bool isLoading = false;
  String quizId='';


  createQuiz() async{

    quizId = randomAlphaNumeric(16);
    if(_formKey.currentState!.validate()){

      setState(() {
        isLoading = true;
      });

      Map<String, dynamic> quizData = {
        "quizId":quizId,
        "quizImgUrl": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDesc": quizDescription,
      };
      await crequiz.addQuizData(quizData, quizId).then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>  AddQuestion(quizId)
        ));
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Quiz'),
      ),

      body: isLoading? Container(
        child: Center( child: CircularProgressIndicator(),),
      ) :Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                validator: (val) => val?.isEmpty ?? true ? "Enter Image Url" : null,
                decoration: InputDecoration(
                    hintText: "Quiz Image Url (Optional)",
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  ),
                ),

                onChanged: (val){
                  quizImageUrl = val;
                },),
              SizedBox(height: 5,),
              TextFormField(
                validator: (val) => val?.isEmpty ?? true ? "Enter Quiz Title" : null,
                decoration: InputDecoration(
                    hintText: "Quiz Title",
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onChanged: (val){
                  quizTitle = val;},),
              SizedBox(height: 5,),
              TextFormField(
                validator: (val) => val?.isEmpty ?? true ? "Enter Quiz Description" : null,
                decoration: InputDecoration(
                    hintText: "Quiz Description",
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onChanged: (val){
                  quizDescription = val;},), Spacer(),
              GestureDetector(onTap: () {
                createQuiz();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text("Create Quiz",
                    style: TextStyle(
                        fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],)
          ,),
      ),
    );
  }
}
