import 'package:flutter/material.dart';
import 'package:projeto1/resultado.dart';
import './questionario.dart';

main() => runApp(new Projeto1App());

class _PerguntaAppState extends State<Projeto1App> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'respostas': [
        {'texto': 'preto', 'pontuacao': 10},
        {'texto': 'vermelho', 'pontuacao': 5},
        {'texto': 'verde', 'pontuacao': 3},
        {'texto': 'branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito ?',
      'respostas': [
        {'texto': 'coelho', 'pontuacao': 10},
        {'texto': 'cobra', 'pontuacao': 5},
        {'texto': 'elefante', 'pontuacao': 3},
        {'texto': 'leâo', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito ?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      if (temPerguntaSelecionada) {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      }
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class Projeto1App extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
