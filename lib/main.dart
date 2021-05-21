//porta de entrada
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import da questão

import './resultado.dart';
import './questionario.dart';

main() {
  runApp(new PerguntaApp()); // rodar o componente
}

//Classe para gerencias o state Pergunta App(Constructor)
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': '1 - Em que país nasceu o matemático Pitágoras?',
      'respostas': [
        {'texto': 'A) Brasil', 'pontuacao': 0},
        {'texto': 'B) Argentina', 'pontuacao': 0},
        {'texto': 'C) Itália', 'pontuacao': 0},
        {'texto': 'D) Grécia', 'pontuacao': 2},
        {'texto': 'E) Rússa', 'pontuacao': 0},
      ],
    },
    {
      'texto': '2 - Em uma divisão, chamamos de "dividendo" o número...',
      'respostas': [
        {'texto': 'A) Que é o resultado da operação', 'pontuacao': 0},
        {'texto': 'B) Pelo qual iremos dividiro', 'pontuacao': 0},
        {'texto': 'C) Que será multiplicado', 'pontuacao': 0},
        {'texto': 'D) Que será dividido', 'pontuacao': 2},
        {'texto': 'E) Nenhuma das auternativas', 'pontuacao': 0},
      ],
    },
    {
      'texto': '3 - O que é um número decimal?',
      'respostas': [
        {'texto': 'A) Qualquer número que termina em zero', 'pontuacao': 0},
        {
          'texto': 'B) Um número que passou por 10 multiplicações',
          'pontuacao': 0
        },
        {'texto': 'C) Um decimo numero que é mal', 'pontuacao': 0},
        {'texto': 'D) São todos os múltiplos de 10', 'pontuacao': 0},
        {
          'texto':
              'E) aquele no qual a parte inteira é separada da parte decimal por uma vírgula',
          'pontuacao': 2
        },
      ],
    },
    {
      'texto': '4 - Em Matemática, a palavra "avos" é usada para:',
      'respostas': [
        {'texto': 'A) nomear os números mais antigos', 'pontuacao': 0},
        {'texto': 'B) nomear os números maiores que os primos', 'pontuacao': 0},
        {
          'texto':
              'C) nomear frações de denominadores maiores que 10, mas diferentes de 100, 1000, etc.',
          'pontuacao': 2
        },
        {'texto': 'D) nomear os números romanos', 'pontuacao': 0},
        {'texto': 'E) Nenhuma das auternativas', 'pontuacao': 0},
      ],
    },
    {
      'texto': '5 - Chamamos de perímetro...',
      'respostas': [
        {'texto': 'A) Uma medida maior que quatro metros', 'pontuacao': 0},
        {
          'texto': 'B) A medida do contorno de uma figura geométrica plana',
          'pontuacao': 2
        },
        {'texto': 'C) Um instrumento musical', 'pontuacao': 0},
        {'texto': 'D) Uma dado recebido de uma planilha', 'pontuacao': 0},
        {'texto': 'E) Nenhuma das auternativas', 'pontuacao': 0},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });

    print(_perguntaSelecionada);
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  //sobre escrevendo o metodo build
  @override
  //metodo
  Widget build(BuildContext context) {
    List<Widget> widgets;

    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    // TODO: implement build
    return new MaterialApp(
      //Scaffold se trata de uma estrutura
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questionário'),
        ),
        //Ctrl + . para vincular a coluna
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),

        floatingActionButton: FloatingActionButton(
          onPressed: _reiniciarQuestionario,
          child: const Icon(Icons.home_outlined),
        ),
      ),
    );
  }
}

//componente
//ctrl + .
class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
