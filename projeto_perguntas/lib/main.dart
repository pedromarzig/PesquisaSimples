import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:projeto_perguntas/questionario.dart';

import 'resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal;
  final _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 1}
      ],
    },
    {
      'texto': 'Qual seu professor preferido?',
      'respostas': [
        {'texto': 'Pedro', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Ana', 'pontuacao': 3},
        {'texto': 'Lucas', 'pontuacao': 1}
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 3},
        {'texto': 'Tigre', 'pontuacao': 1}
      ],
    },
  ];

  @override
  void _respota(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  Widget build(BuildContext context) {
    List<String> resp = (temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]["resposta"]
        : null) as List<String>;

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionairo(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quantoResponder: _respota,
            )
          : Resultado(_pontuacaoTotal),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
