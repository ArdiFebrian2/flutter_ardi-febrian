import 'package:flutter/material.dart';
import 'package:smartphone_recommendation/screens/result.dart';
import 'package:smartphone_recommendation/services/openai_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController budgetController = TextEditingController();
  TextEditingController cameraController = TextEditingController();
  TextEditingController storageController = TextEditingController();
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendations(
        budget: budgetController.text,
        camera: cameraController.text,
        storage: storageController.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      const snackBar = SnackBar(
        content: Text('Failed to send a request. Please try again.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Smartphone Recommendation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFBC0C24),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: budgetController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  labelText: "Budget",
                  hintText: "Enter your budget",
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: cameraController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  labelText: "Camera (MP)",
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: storageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  labelText: "Storage",
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _getRecommendations,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFFBC0C24),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Get Recommendations",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
