import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokeapiv2.dart';
import 'package:pokedex/pages/home_page/widgets/status_bar.dart';
import 'package:pokedex/stores/pokeapiv2_store.dart';

class StatusTab extends StatelessWidget {
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();

  List<int> getStatus(PokeApiV2 pokeApiV2) {
    List<int> _list = [0, 1, 2, 3, 4, 5, 6];
    int _total = 0;
    pokeApiV2.stats.forEach((e) {
      _total += e.baseStat;
      switch (e.stat.name) {
        case 'hp':
          _list[0] = e.baseStat;
          break;
        case 'attack':
          _list[1] = e.baseStat;
          break;
        case 'defense':
          _list[2] = e.baseStat;
          break;
        case 'special-attack':
          _list[3] = e.baseStat;
          break;
        case 'special-defense':
          _list[4] = e.baseStat;
          break;
        case 'speed':
          _list[5] = e.baseStat;
          break;
      }
    });
    _list[6] = _total;
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Observer(
              name: 'obs_stats',
              builder: (context) {
                PokeApiV2 _pokeApiV2 = _pokeApiV2Store.pokeApiV2;
                List<int> _lista = getStatus(_pokeApiV2);

                return _pokeApiV2 != null
                    ? SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Hp',
                                  style: TextStyle(
                                      fontFamily: 'Google', fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Attack',
                                  style: TextStyle(
                                      fontFamily: 'Google', fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Defense',
                                  style: TextStyle(
                                      fontFamily: 'Google', fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Sp. Atk',
                                  style: TextStyle(
                                      fontFamily: 'Google', fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Sp. Def',
                                  style: TextStyle(
                                      fontFamily: 'Google', fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Speed',
                                  style: TextStyle(
                                      fontFamily: 'Google', fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontFamily: 'Google', fontSize: 16),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _lista[0].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _lista[1].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _lista[2].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _lista[3].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _lista[4].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _lista[5].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _lista[6].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Google',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                StatusBar(
                                  widthFactor: _lista[0] / 755,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                StatusBar(
                                  widthFactor: _lista[1] / 160,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                StatusBar(
                                  widthFactor: _lista[2] / 160,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                StatusBar(
                                  widthFactor: _lista[3] / 160,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                StatusBar(
                                  widthFactor: _lista[4] / 160,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                StatusBar(
                                  widthFactor: _lista[5] / 160,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                StatusBar(
                                  widthFactor: _lista[6] / 800,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        ),
      ),
    );
  }
}
