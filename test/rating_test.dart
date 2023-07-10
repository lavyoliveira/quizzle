import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizzle/components/rating.dart';

void main() {
  testWidgets('Teste de Widget de Minhas Pontuações',
      (WidgetTester tester) async {
    final List<dynamic> score = [
      {'score': 100, 'theme': 'História'},
      {'score': 90, 'theme': 'Matemática'},
      {'score': 80, 'theme': 'Curiosidades'},
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: RatingResult(score: score),
      ),
    );

    // Certificar que "Minhas pontuações" está aparecendo
    expect(find.text('Minhas pontuações'), findsOneWidget);

    // Certificar que os 3 cards estão aparecendo com as informações corretas
    expect(find.text('1º | 100 pontos | tema: History'), findsOneWidget);
    expect(find.text('2º | 90 pontos | tema: Science'), findsOneWidget);
    expect(find.text('3º | 80 pontos | tema: Math'), findsOneWidget);
  });
}
