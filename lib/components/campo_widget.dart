import 'package:flutter/material.dart';
import '../models/campo.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir, onAlternarMarcacao;

  Image _assets(String asset) => Image.asset('assets/images/$asset.jpeg');

  CampoWidget({this.campo, this.onAbrir, this.onAlternarMarcacao});

  Widget _getImage() {
    int qtdDeMinas = campo.qtdeMinasNaVizinhanca;


    if (campo.aberto && campo.minado && campo.explodido) {
      return _assets('bomba_0');
    } else if (campo.aberto && campo.minado) {
      return _assets('bomba_1');
    } else if (campo.aberto) {
      return _assets('aberto_$qtdDeMinas');
    } else if(campo.marcado) {
      return _assets('bandeira');
    } else {
      return _assets('fechado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
