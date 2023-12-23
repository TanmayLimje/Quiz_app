import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAns = itemData['user-answer'] == itemData['correct-answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAns,
            questionIndex: itemData['question-index'] as int,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['user-answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 217, 255, 0),
                ),
              ),
              Text(
                itemData['correct-answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 21, 255, 0),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
