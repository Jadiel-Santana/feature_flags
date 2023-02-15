import 'dart:io';
import 'package:flutter/material.dart';

class DialogUpdate extends StatelessWidget {
  const DialogUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: const Text(
        'Nova Versão',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Identificamos que há uma nova versão do seu aplicativo disponível na loja. Recomendamos que faça a atualização para uma melhor experiência.',
        textAlign: TextAlign.justify,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Atualizar Depois'),
        ),
        TextButton(
          onPressed: () {
            if (Platform.isAndroid) {
              // REDIRECT TO PLAY STORE
            } else if (Platform.isIOS) {
              // REDIRECT TO APP STORE
            }
            Navigator.of(context).pop();
          },
          child: const Text('Atualizar Agora'),
        ),
      ],
    );
  }
}
