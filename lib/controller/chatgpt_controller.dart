import 'dart:convert';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatgptController {
  final String apiKey = dotenv.env['CHAT_GPT_API_KEY']!;
  late OpenAI openAI;

  ChatgptController() {
    openAI = OpenAI.instance.build(
      token: apiKey,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 30),
      ),
      enableLog: true,
    );
  }

  Future<Map<String, dynamic>> getChatResponse(String message) async {
    final request = ChatCompleteText(
      responseFormat: ResponseFormat(
        type: "json_object",
      ),
      messages: [
        {'role': 'user', 'content': message}
      ],
      maxToken: 4000,
      model: GptTurboChatModel(), // or 'gpt-4' if available
    );

    final response = await openAI.onChatCompletion(request: request);

    if (response != null && response.choices.isNotEmpty) {
      dynamic data = response.choices[0].message!.content;
      Map<String, dynamic> mapData = jsonDecode(data);
      // log("Chatgpt Res - $mapData");
      return mapData;
    } else {
      return {"Error": "No Response"};
    }
  }
}
