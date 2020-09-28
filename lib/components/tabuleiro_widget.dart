import 'package:campo_minado/components/campo_widget.dart';
import 'package:flutter/material.dart';
import '../models/tabuleiro.dart';
import '../models/campo.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir, onAlternarMarcacao;

  TabuleiroWidget({this.tabuleiro, this.onAbrir, this.onAlternarMarcacao});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos
            .map((e) => CampoWidget(
                  campo: e,
                  onAbrir: onAbrir,
                  onAlternarMarcacao: onAlternarMarcacao,
                ))
            .toList(),
      ),
    );
  }
}
