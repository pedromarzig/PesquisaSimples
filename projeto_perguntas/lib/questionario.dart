import 'package:flutter/material.dart';
import 'questao.dart';
import 'respostas.dart';
import 'main.dart';

class Questionairo extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  void Function(int) quantoResponder;

  Questionairo(
      {@required this.perguntas,
      @required this.perguntaSelecionada,
      @required this.quantoResponder});
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
    @override
    Widget build(BuildContext context) {
      List<String> resp = (temPerguntaSelecionada
          ? perguntas[perguntaSelecionada]["resposta"]
          : null);
      return Column(
        children: <Widget>[
          Questao(perguntas[perguntaSelecionada]['texto']),
          ...resp.map((rep) {
            return Respostas(
              rep['texto'],
              () => quantoResponder(rep['pontuacao']),
            );
          }).toList(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
