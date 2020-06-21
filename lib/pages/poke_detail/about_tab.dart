import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/specie.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:pokedex/stores/pokeapiv2_store.dart';

class AboutTab extends StatelessWidget {
  final PokeApiV2Store _pokeApiV2Store = PokeApiV2Store();
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    _pokeApiV2Store.getInfoSpecie(index: _pokeApiStore.pokemonAtual.id);

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Descrição',
              style:
                  TextStyle(fontFamily: 'Google', fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              Specie _specie = _pokeApiV2Store.specie;
              return _specie != null
                  ? Text(
                      _specie.flavorTextEntries
                          .where((descricao) => descricao.language.name == 'en')
                          .last
                          .flavorText,
                      style: TextStyle(fontFamily: 'Google'),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          _pokeApiStore.corPokemonAtual),
                    ));
            }),
            SizedBox(
              height: 10,
            ),
            Text(
              'Biologia',
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
                      'Altura',
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
                      _pokeApiStore.pokemonAtual.height,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Google',
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Peso',
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
                      _pokeApiStore.pokemonAtual.weight,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Google',
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
