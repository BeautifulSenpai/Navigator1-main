class VoiceResponses {
  static String getResponseForCommand(String command) {
    final List<MapEntry<RegExp, String>> responses = [
      MapEntry(RegExp(r"где я могу поесть", caseSensitive: false),
          "Показываю места на карте"),
      MapEntry(RegExp(r"спасибо", caseSensitive: false), "Всегда рад помочь"),
      MapEntry(RegExp(r"пока|до свидания|прощай", caseSensitive: false),
          "До свидания!"),
      MapEntry(
          RegExp(r"как дела", caseSensitive: false), "Всё отлично, спасибо!"),
      MapEntry(RegExp(r"ты кто", caseSensitive: false),
          "Я голосовой ассистент Игорь, готов помочь вам!"),
      MapEntry(RegExp(r"сколько времени|который час", caseSensitive: false),
          "Сейчас ${getCurrentTime()}"),
      MapEntry(RegExp(r"(Игорь|игорь)", caseSensitive: false),
          "Да, Чем могу помочь?"),
      MapEntry(RegExp(r"как тебя зовут|как тебя зовут\?", caseSensitive: false),
          "Меня зовут Игорь!"),
      MapEntry(
          RegExp(r"прощай|до свидания", caseSensitive: false), "До свидания!"),
      MapEntry(
          RegExp(r"(привет(?:ствую)?|здравствуй(?:те)?)", caseSensitive: false),
          "Чем могу помочь?"),
      MapEntry(
        RegExp(r"построй маршрут", caseSensitive: false),
        "Хорошо, строю маршрут...",
      ),
    ];

    String bestMatchedResponse = "Я не понимаю команду.";
    int bestMatchedCount = 0;

    for (MapEntry<RegExp, String> entry in responses) {
      int matchedCount = entry.key.allMatches(command.toLowerCase()).length;
      if (matchedCount > bestMatchedCount) {
        bestMatchedCount = matchedCount;
        bestMatchedResponse = entry.value;
      }
    }
    print("Best matched response: $bestMatchedResponse");

    return bestMatchedResponse;
  }

  static String getCurrentTime() {
    final now = DateTime.now();
    final time = "${now.hour}:${now.minute}";
    return time;
  }
}
