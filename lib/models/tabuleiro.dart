import 'dart:math';

//import 'package:flutter/foundation.dart';

import 'campo.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtdBombas;

  final List<Campo> _campos = [];

  Tabuleiro({
    this.linhas,
    this.colunas,
    this.qtdBombas,
  }) {
    _criarCampos();
    _relacionarVizinhos();
    _sortearMinas();
  }

  List<Campo> get campos {
    return _campos;
  }

  bool get resolvido { //todos os campos resolvidos
    return _campos.every((c) => c.resolvido);
  }

  void revelarBombas() {
    _campos.forEach((campo) => campo.revelarBomba());
  }

  void reiniciar() {
    //zera todas as bombas
    _campos.forEach((campo) => campo.reiniciar());
    _sortearMinas();
  }

  void _criarCampos() {
    for (int linha = 0; linha < linhas; linha++) {
      for (int coluna = 0; coluna < colunas; coluna++) {
        _campos.add(Campo(
          linha: linha,
          coluna: coluna,
        ));
      }
    }
  }

  void _relacionarVizinhos() {
    for (var campo in _campos) {
      for (var vizinho in _campos) {
        campo.adicionarVizinho(vizinho);
      }
    }
  }

  void _sortearMinas() {
    int sorteadas = 0;

    if (qtdBombas > linhas * colunas) {
      return; //valor invalido
    }

    while (sorteadas < qtdBombas) {
      int i = Random().nextInt(_campos.length);

      if (!_campos[i].minado) {
        sorteadas++;
        _campos[i].minar();
      }
    }
  }
}
