import 'package:flutter/material.dart';

class ConstsApp {
  static const whitePokeball = 'assets/images/pokeball.png';
  static const darkPokeball = 'assets/images/pokeball_dark.png';

  static Widget setTipos(List<String> types, int origem) {
    //vai somar de acordo com o tamanho da lista e se for 0 ele não da o padding na esquerda
    int _indexLista = 0;

    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(Padding(
        padding:
            EdgeInsets.only(left: (origem == 2 && _indexLista > 0 ? 8 : 0)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(80, 255, 255, 255),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Google',
                      fontSize: origem == 1 ? 14 : 20),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ));
      _indexLista++;
    });
    return origem == 1
        ? Column(children: lista, crossAxisAlignment: CrossAxisAlignment.start)
        : Row(
            children: lista,
            mainAxisSize: MainAxisSize.max,
          );
  }

  static Color getColorType({String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
        break;
      case 'Fire':
        return Colors.red;
        break;
      case 'Water':
        return Colors.blue;
        break;
      case 'Grass':
        return Colors.green;
        break;
      case 'Electric':
        return Colors.amber;
        break;
      case 'Ice':
        return Colors.cyanAccent[400];
        break;
      case 'Fighting':
        return Colors.orange;
        break;
      case 'Poison':
        return Colors.purple;
        break;
      case 'Ground':
        return Colors.orange[300];
        break;
      case 'Flying':
        return Colors.indigo[200];
        break;
      case 'Psychic':
        return Colors.pink;
        break;
      case 'Bug':
        return Colors.lightGreen[500];
        break;
      case 'Rock':
        return Colors.grey;
        break;
      case 'Ghost':
        return Colors.indigo[400];
        break;
      case 'Dark':
        return Colors.brown;
        break;
      case 'Dragon':
        return Colors.indigo[800];
        break;
      case 'Steel':
        return Colors.blueGrey;
        break;
      case 'Fairy':
        return Colors.pinkAccent[100];
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
