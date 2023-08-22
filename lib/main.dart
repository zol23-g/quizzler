import 'package:flutter/material.dart';
//import 'question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const Quizzler());
}
// stateless widget
class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnsware(bool userPickedAnsware) {
    bool correctAnsware = quizBrain.getQuestionAnsware();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Quiz Finished !',
          desc: 'You have reached the end of the Quiz',
          // type: AlertType.warning,
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnsware == correctAnsware) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
      }
    });
  }

  //Question q1 = Question(q: 'qwertyuio', a: false);

  //int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                //quizBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: TextButton(
              onPressed: () {
                checkAnsware(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.green,
                    fontSize: 50.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnsware(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.red,
                    fontSize: 50.0),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
