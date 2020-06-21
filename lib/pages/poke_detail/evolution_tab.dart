import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:pokedex/stores/pokeapiv2_store.dart';

class EvolutionTab extends StatelessWidget {
  final PokeApiV2Store _pokeApiV2Store = PokeApiV2Store();
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  List<Widget> getPrevEvolution(Pokemon pokemon) {
    List<Widget> _list = [];
    if (pokemon.prevEvolution != null) {
      pokemon.prevEvolution.forEach((f) {
        _list.add(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: Container(
                child: _pokeApiStore.getImage(numero: f.num),
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                f.name,
                style: TextStyle(fontSize: 16, fontFamily: 'Google'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ));
      });
    }

    return _list;
  }

  List<Widget> getNextEvolution(Pokemon pokemon) {
    List<Widget> _list = [];
    if (pokemon.nextEvolution != null) {
      pokemon.nextEvolution.forEach((f) {
        _list.add(Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                child: _pokeApiStore.getImage(numero: f.num),
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                f.name,
                style: TextStyle(fontSize: 16, fontFamily: 'Google'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ));
      });
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Previous',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.bold,
                        color: _pokeApiStore.corPokemonAtual),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                      mainAxisSize: MainAxisSize.max,
                      children: getPrevEvolution(_pokeApiStore.pokemonAtual)),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Google',
                        fontWeight: FontWeight.bold,
                        color: _pokeApiStore.corPokemonAtual),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                      children: getNextEvolution(_pokeApiStore.pokemonAtual)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
