class Question{
  String questionText = "";
  bool correctAnswer = true;
  Question({required String ques, required bool ans}){
    questionText = ques;
    correctAnswer = ans;
  }
}