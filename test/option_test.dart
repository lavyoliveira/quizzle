import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:quizzle/components/option.dart';
import 'package:quizzle/controllers/question_controller.dart';

void main() {
  testWidgets('Widget de Alternativas', (WidgetTester tester) async {
    // Cria um mock para QuestionController
    final questionController = QuestionController();

    // Cria o widget de opções com o mock do question controller
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Option(
            text: 'Option 1',
            index: 0,
            press: () {},
          ),
        ),
        initialBinding: BindingsBuilder(() {
          Get.put<QuestionController>(questionController);
        }),
      ),
    );

    // Verifica o texto da opção
    expect(find.text('1. Option 1'), findsOneWidget);
  });
}
