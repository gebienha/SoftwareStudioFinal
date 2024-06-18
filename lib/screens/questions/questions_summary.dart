/*import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  
                  children: [
                    Container(
                      width: 30.0, // Specify the width of the container
                      height: 30.0, // Specify the height of the container
                      decoration: BoxDecoration(
                        color:(data['user_answer']==data['correct_answer'])? Color.fromARGB(255, 150, 198, 241) // Color for correct answer
                        : Color.fromARGB(255, 249, 133, 241), // Background color
                        shape: BoxShape.circle, // Makes the container circular
                        // You can use a gradient instead of a solid color if you like
                        // gradient: RadialGradient(
                        //   colors: [Colors.blue, Colors.lightBlueAccent],
                        // ),
                      ),
                      alignment: Alignment.center, // Center the text inside the circular container
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 20, // Size of the text
                          fontWeight: FontWeight.bold, // Thickness of the text
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['question'] as String, style: TextStyle (fontSize:28)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(data['user_answer'] as String,style: TextStyle(color:Color.fromARGB(255, 202, 171, 252))),
                          Text(data['correct_answer'] as String, style: TextStyle(color:Color.fromARGB(255, 181, 254, 246))),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}*/
