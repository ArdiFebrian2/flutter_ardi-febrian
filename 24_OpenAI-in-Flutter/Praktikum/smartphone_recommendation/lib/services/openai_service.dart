import 'dart:convert';
import 'package:smartphone_recommendation/env/constants/open_ai.dart';
import 'package:smartphone_recommendation/models/open_ai.dart';
import 'package:smartphone_recommendation/models/usage.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GptData> getRecommendations({
    required String budget,
    required String camera,
    required String storage,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(completionTokens: 0, promptTokens: 0, totalTokens: 0),
    );

    try {
      var url = Uri.parse('https://api.openai.com/v1/chat/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey',
      };

      final data = jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content": "Anda adalah seorang ahli rekomendasi smartphone."
          },
          {
            "role": "user",
            "content":
                "Saya memiliki anggaran sebesar $budget rupiah, saya membutuhkan kamera dengan minimal $camera MP, dan saya ingin kapasitas penyimpanan sebesar $storage GB. Tolong rekomendasikan beberapa smartphone yang sesuai dengan kriteria ini."
          },
        ],
        "max_tokens": 200,
      });

      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengirim permintaan.');
    }

    return gptData;
  }
}
