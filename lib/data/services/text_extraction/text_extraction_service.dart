//   import 'dart:io';
//   import 'package:google_ml_kit/google_ml_kit.dart';

// class TextExtractionService {

//   Future<Map<String, dynamic>> extractCricketScoreData(File imageFile) async {
//     final inputImage = InputImage.fromFile(imageFile);
//     final textRecognizer = GoogleMlKit.vision.textRecognizer();
//     final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

//     String fullText = recognizedText.text;

//     // Simple regex-based extraction (improve as needed)
//     final teamNameRegex = RegExp(r'([A-Z]{2,})\s+(\d{1,3})/(\d{1,2})');
//     final matches = teamNameRegex.allMatches(fullText);

//     List<Map<String, dynamic>> teams = [];

//     for (final match in matches) {
//       teams.add({
//         'team_name': match.group(1),
//         'runs': int.tryParse(match.group(2) ?? ''),
//         'wickets': int.tryParse(match.group(3) ?? ''),
//       });
//     }

//     await textRecognizer.close();

//     return {
//       'teams': teams,
//       'raw_text': fullText,
//     };
//   }
// }