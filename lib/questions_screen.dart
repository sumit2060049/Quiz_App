import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    //currentQuestionIndex = currentQuestionIndex + 1;
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[
        currentQuestionIndex]; //it accesses the element with an index of zero in that list of questions.

    return //const Text('QusetionScreen');
        SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              //'The question....',
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              // style: TextStyle(
              //   color: Colors.white,
              // ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  }, //function pointer for answerQuestion() ,we wanna point at that function and pass the function as a value to onTap.
                );
              },
            ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[0],
            //   onTap: () => {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[1],
            //   onTap: () => {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[2],
            //   onTap: () => {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestion.answers[3],
            //   onTap: () => {},
            // ),
          ],
        ),
      ),
    );
  }
}
