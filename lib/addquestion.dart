import 'package:flutter/material.dart';
import 'helper.dart';
import 'widget.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;

  AddQuestion(this.quizId);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  createquiz addquestion = createquiz();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String question = "", option1 = "", option2 = "", option3 = "", option4 = "", answer = "";

  uploadQuizData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, dynamic> questionData = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
        "answer": answer,
      };

      await addquestion.addQuestionData(questionData, widget.quizId).then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black54,
        ),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Enter Question" : null,
                  decoration: InputDecoration(
                    hintText: "Question",
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onChanged: (val) {
                    question = val;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Option1 " : null,
                  decoration: InputDecoration(
                    hintText: "Option1 (Correct Answer)",
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onChanged: (val) {
                    option1 = val;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Option2 " : null,
                  decoration: InputDecoration(
                    hintText: "Option2",
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onChanged: (val) {
                    option2 = val;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Option3 " : null,
                  decoration: InputDecoration(
                    hintText: "Option3",
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onChanged: (val) {
                    option3 = val;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Option4 " : null,
                  decoration: InputDecoration(
                    hintText: "Option4",
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onChanged: (val) {
                    option4 = val;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? "Answer " : null,
                  decoration: InputDecoration(
                    hintText: "Answer",
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onChanged: (val) {
                    answer = val;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        uploadQuizData();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 2 - 40,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Add Question",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
