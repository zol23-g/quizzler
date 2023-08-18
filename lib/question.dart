class Question {
  //class properties
  late String questionText;
  late bool questionAnsware;
  // no Method here

  // Constructor //Question(this.questionText,this.questionAnsware);
  Question({required String q, required bool a}) {
    questionText = q;
    questionAnsware = a;
  }
}
