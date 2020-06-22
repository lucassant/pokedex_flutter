import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:http/http.dart' as http;
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi _pokeApi;

  @observable
  Pokemin _pokemonAtual;
  @observable
  Color _corPokemonAtual;
  @observable
  int posicaoAtual;

  @computed
  PokeApi get pokeApi => _pokeApi;

  @computed
  Pokemin get pokemonAtual => _pokemonAtual;

  @computed
  Color get corPokemonAtual => _corPokemonAtual;

  @action
  fetchPokemonList() {
    _pokeApi = null;
    loadPokeAPI().then((pokeList) {
      _pokeApi = pokeList;
    });
  }

  @action
  getPokemon(int index) {
    return _pokeApi.pokemon[index];
  }

  @action
  int getPokemonId({String num}) {
    return _pokeApi.pokemon.where((poke) => poke.num == num).first.id;
  }

  @action
  setPokemonAtual({int index}) {
    _pokemonAtual = _pokeApi.pokemon[index];
    _corPokemonAtual =
        ConstsApp.getColorType(type: _pokeApi.pokemon[index].type[0]);
    posicaoAtual = index;
  }

  @action
  Widget getImage({String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) {
        return Container(
          color: Colors.transparent,
          child: CircularProgressIndicator(),
        );
      },
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$numero.png',
    );
  }

  Future<PokeApi> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsApi.pokeapiURL);
      var decodeJson = jsonDecode(response.body);
      return PokeApi.fromJson(decodeJson);
    } catch (error) {
      print('erro ao carregar lista $error');
      return null;
    }
  }
}
