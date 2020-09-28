
//import 'package:flutter/foundation.dart';

import 'explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    this.linha,
    this.coluna,
  });

  //detecta os vizinhos
  void adicionarVizinho(Campo vizinho) {
    //abs sempre pega valor absoluto
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      //o proprio campo
      return;
    }
    if (deltaLinha <= 1 && deltaColuna <= 1) {
      //um vizinho
      vizinhos.add(vizinho);
    }
  }

  //abrir uma bomba
  void abrirBomba() {
    if (_aberto) {
      return;
    }

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException(); //chama a excessao da classe criada
    }

    if (vizinhancaSegura) {
      //chama recursividade
      vizinhos.forEach((vizinho) => vizinho.abrirBomba());
    }
  }

  void revelarBomba() {
    if (_minado) {
      _aberto = true;
    }
  }

  //marca o campo como minado
  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get minado {
    return _minado;
  }

//quando todos os campos forem resolvidos
//o jogador ganhou o jogo!
  bool get resolvido {
    //pode usar as variaveis privadas ou gets
    bool minadoEMarcado = minado && marcado; //usa os gets
    bool seguroEAberto = !_minado && _aberto; //privadas

    return minadoEMarcado || seguroEAberto;
  }

  bool get vizinhancaSegura {
    return vizinhos.every((vizinho) => !vizinho.minado);
  }

  //quantidade de minas vizinhas do campo
  int get qtdeMinasNaVizinhanca {
    //filtro com where => vizinhos minados verdadeiro
    return vizinhos.where((vizinho) => vizinho.minado).length;
  }
}
