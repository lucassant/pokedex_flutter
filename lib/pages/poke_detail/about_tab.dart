import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokeapiv2.dart';
import 'package:pokedex/stores/pokeapiv2_store.dart';
import 'package:pokedex/stores/pokedexapi_store.dart';

class AboutTab extends StatelessWidget {
  final PokedexApiStore _pokeApiStore = GetIt.instance<PokedexApiStore>();
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
          name: 'obs',
          builder: (context) {
            PokeApiV2 _pokeApiV2 = _pokeApiV2Store.pokeApiV2;
            return _pokeApiV2 != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _pokeApiStore.pokemonAtual != null
                            ? Text(
                                _pokeApiStore.pokemonAtual.xdescription,
                                style: TextStyle(fontFamily: 'Google'),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    _pokeApiStore.corPokemonAtual),
                              )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Biology',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Google',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Height',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Google',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  (_pokeApiV2.height / 10).toString() + ' m',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Google',
                                      color: Colors.black),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Google',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  (_pokeApiV2.weight / 10).toString() + ' kg',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Google',
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ))
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
