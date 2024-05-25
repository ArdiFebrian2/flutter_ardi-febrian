import 'package:flutter/material.dart';

import 'package:smartphone_recommendation/models/open_ai.dart';

class ResultScreen extends StatelessWidget {
  final GptData gptResponseData;

  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recommendation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFBC0C24),
        actions: const [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18),
            child: Text(
              gptResponseData.choices[0]!.message!.content!,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
