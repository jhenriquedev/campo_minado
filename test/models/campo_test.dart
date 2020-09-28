import 'package:flutter_test/flutter_test.dart';

import 'package:campo_minado/models/campo.dart';

main() {
  group('campo', () {
    test('Abrir campo com explosao', () {
      Campo c = Campo(linha: 0, coluna: 0);
      c.minar();

      expect(
          //espera-se que gere uma excessão
          c.abrirBomba,
          throwsException);
    });

    test('Abrir campo sem explosao', () {
      Campo c = Campo(linha: 0, coluna: 0);
      c.abrirBomba();

      expect(
          //espera-se que esteja aberto
          c.aberto,
          isTrue);
    });

    test('Adicionar não vizinho', () {
      Campo c1 = Campo(linha: 0, coluna: 0);
      Campo c2 = Campo(linha: 1, coluna: 3);

      c1.adicionarVizinho(c2);

      expect(
          //espera-se que esteja vazio
          c1.vizinhos.isEmpty,
          isTrue);
    });

    test('Adicionar vizinho', () {
      Campo c1 = Campo(linha: 3, coluna: 3);
      Campo c2 = Campo(linha: 3, coluna: 4);
      Campo c3 = Campo(linha: 2, coluna: 2);
      Campo c4 = Campo(linha: 4, coluna: 4);

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);

      expect(
          //espera-se que o tamanho do vetor vizinhos seja 3
          c1.vizinhos.length,
          3);
    });

    test('Minas na vizinhança', () {
      Campo c1 = Campo(linha: 3, coluna: 3);
      Campo c2 = Campo(linha: 3, coluna: 4);
      c2.minar();
      Campo c3 = Campo(linha: 2, coluna: 2);
      Campo c4 = Campo(linha: 4, coluna: 4);
      c4.minar();

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);

      expect(
          //espera-se que o tamanho do vetor vizinhos seja 3
          c1.qtdeMinasNaVizinhanca,
          2);
    });
  });
}
