import 'package:flutter_test/flutter_test.dart';
import 'package:campo_minado/models/tabuleiro.dart';

main() {

  
  test('Ganhar Jogo', () {
    Tabuleiro tabuleiro = Tabuleiro(
      linhas: 2,
      colunas: 2,
      qtdBombas: 0,
    );

    tabuleiro.campos[0].minar();
    tabuleiro.campos[3].minar();

    //jogando
    tabuleiro.campos[0].alternarMarcacao();
    tabuleiro.campos[1].abrirBomba();
    tabuleiro.campos[2].abrirBomba();
    tabuleiro.campos[3].alternarMarcacao();

  //verifica se os campos foram resolvidos
    expect(tabuleiro.resolvido, isTrue);
  });
}
