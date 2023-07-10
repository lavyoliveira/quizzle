import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizzle/components/alert.dart';

void main() {
  testWidgets('Teste Widget Alerta', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  Alert.showAlert(context, 'Teste Alerta Widget',
                      'Este é um teste', 'error');
                },
                child: const Text('Mostrar alerta'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Mostrar alerta'));
    await tester.pumpAndSettle();

    // Certificar que o alerta está aparecendo
    expect(find.byType(AlertDialog), findsOneWidget);

    // Certificar de que o alerta e a mensagem estão aparecendo corretamente
    expect(find.text('Teste de Alerta'), findsOneWidget);
    expect(find.text('Este é um teste'), findsOneWidget);

    // Certificar de que o botão Ok está aparecendo
    expect(find.text('Ok'), findsOneWidget);

    // Clicar no botão Ok
    await tester.tap(find.text('Ok'));
    await tester.pumpAndSettle();

    // Certificar de que o alerta não está mais aparecendo
    expect(find.byType(AlertDialog), findsNothing);
  });
}
