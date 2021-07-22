import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_quiz_app/questionanswerclass.dart';
import 'questionbank.dart';
void main() {
  runApp(QuizApp());
}

QuestionBank quesBankObject = QuestionBank();

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          title: Text(
            'True or False',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.grey[800],
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Quiz(),
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  int questionNumber = 0;
  //int correct = 0;
  int questionLength = quesBankObject.getQuestionlength();
  late bool currentanswer;
  List<Icon> currentScore = [
  ];
  void currentAnswer(bool userAnswer){
    currentanswer = quesBankObject.getAnswer();
    questionNumber++;
    setState(() {
      if(userAnswer == currentanswer&&questionNumber<=quesBankObject.getQuestionlength()){
        //correct++;
        currentScore.add(
          Icon(
            Icons.check,
            color: Colors.green,
            size: 18,
          ),
        );
        quesBankObject.nextQuestion();
      }
      else if(userAnswer!=currentanswer&&questionNumber<=quesBankObject.getQuestionlength()) {
        currentScore.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
        quesBankObject.nextQuestion();

      }
      if(questionNumber == quesBankObject.getQuestionlength() + 1){
        currentScore = [];
        questionNumber = 0;
      }
      // quesBankObject.nextQuestion();
      // if(questionNumber == quesBankObject.getQuestionlength()){
      //   questionNumber = questionNumber;
      // }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quesBankObject.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              )
            ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color:Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: (){
                      currentAnswer(true);
                    },
                  ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color:Colors.red,
                    child: Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: (){
                      currentAnswer(false);

                    },
                  )
              ),
            ),
          ],
        ),
        Row(
          children: currentScore,
        ),
      ],
    );
  }
}


