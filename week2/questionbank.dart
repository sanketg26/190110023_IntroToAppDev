import 'package:simple_quiz_app/questionanswerclass.dart';

class QuestionBank {
  int _questionNumber = 0;
  List<Question> _questionList = [
    Question(ques: 'Some cats are actually allergic to humans',ans: true),
    Question(ques: 'You can lead a cow down stairs but not upstairs',ans: false),
    Question(ques: 'Approximately one quarter of humans bones are in the feet',ans: true),
    Question(ques: "A Slug's blood is greeen",ans: true),

    Question(ques: '''Buzz Aldrin's mother's maiden name was "Moon"''',ans: true),
    Question(ques: 'It is illegal to pee in the Ocean in Portugal',ans: false),
    Question(ques: 'No piece of square dry paper can be folded in half more than 7 times',ans: true),
    Question(ques: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place',ans: false),

    Question(ques: 'The loudest sound produced by any animal is 188 decibals.That animal is the African Elephant',ans: false),
    Question(ques: 'The total surface area of two human lungs is approximately 70 square metres',ans: true),
    Question(ques: 'Google was originally called "Backrub".',ans: true),
    Question(ques: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog",ans: true),
  ];
  void nextQuestion(){
    if(_questionNumber < _questionList.length-1){
      _questionNumber++;
    }
    else{
      _questionNumber = 0;
    }
  }
  String getQuestion (){
    return _questionList[_questionNumber].questionText;
  }
  bool getAnswer (){
    return _questionList[_questionNumber].correctAnswer;
  }
  int getQuestionNumber(){
    return _questionNumber;
  }
  int getQuestionlength(){
    return _questionList.length;
  }
}