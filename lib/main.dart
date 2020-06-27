import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String appTitle = "Fail or Pass";
  int grade = 60;
  String result = "";
  var students = [
    "Andrew Suarez",
    "Luis Hernandez",
    "Sergio Morales",
    "Ander Luis Terrena"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(students[index]);
                }),
          ),
          Center(
            child: RaisedButton(
              child: Text("Show Result"),
              onPressed: () {
                if (grade >= 50) {
                  result =
                      "Congratulations, you have successfully passed the course!\n\nYour grade: " +
                          grade.toString();
                } else if (grade < 50 && grade >= 45) {
                  result =
                      "Your grade is not enough to pass, you have to take the make-up exam!\n\nYour grade: " +
                          grade.toString();
                } else {
                  result =
                      "Sorry, you didn't pass this course!\n\nYour grade: " +
                          grade.toString();
                }
                var alert = AlertDialog(
                  title: Text("End of Term Course Result"),
                  content: Text(result),
                );
                showDialog(
                    context: context, builder: (BuildContext context) => alert);
              },
            ),
          ),
        ],
      ),
    );
  }
}
