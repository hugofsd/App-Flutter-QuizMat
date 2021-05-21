import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  @override
  final int pontuacao;

  final void Function() quandoReiniciar;

  Resultado(this.pontuacao, this.quandoReiniciar);

  String get fraseResultado {
    if (pontuacao < 5) {
      return 'Reprovado!';
    } else {
      return 'Aprovado!';
    }
  }

  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseResultado,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
