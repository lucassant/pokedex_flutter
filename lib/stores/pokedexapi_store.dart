import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokemonapi.dart';
part 'pokedexapi_store.g.dart';

class PokedexApiStore = _PokedexApiStoreBase with _$PokedexApiStore;

abstract class _PokedexApiStoreBase with Store {
  @observable
  PokemonApi _pokemonApi;
  @observable
  Pokemon _pokemonAtual;
  @observable
  Color _corPokemonAtual;
  @observable
  String _pesquisaPokemon;
  @observable
  int _posicaoAtual;

  @computed
  PokemonApi get pokemonApi => _pokemonApi;

  @computed
  Pokemon get pokemonAtual => _pokemonAtual;

  @computed
  Color get corPokemonAtual => _corPokemonAtual;

  @computed
  String get pesquisaPokemon => _pesquisaPokemon;

  @computed
  int get posicaoAtual => _posicaoAtual;

  @action
  void setPokemonAtual({int index}) {
    _pokemonAtual = _pokemonApi.pokemon[index];
    _corPokemonAtual =
        ConstsApp.getColorType(type: _pokemonAtual.typeofpokemon[0]);
    _posicaoAtual = index;
  }

  @action
  void setPesquisaPokemon({String pesquisa}) {
    _pesquisaPokemon = pesquisa;
  }

  @action
  Pokemon getPokemon({int index}) {
    return _pokemonApi.pokemon[index];
  }

  @action
  void filtraLista() {
    _pokemonApi.pokemon = _pokemonApi.pokemon
        .where((v) =>
            v.name.toLowerCase().contains(_pesquisaPokemon.toLowerCase()))
        .toList();
  }

  @action
  void fetchList() {
    _pokemonApi = null;
    loadPokedexApi().then((poke) {
      _pokemonApi = poke;
    });
  }

  Future<PokemonApi> loadPokedexApi() async {
    try {
      final response = await http.get(ConstsApi.pokedexApiURL);
      var jsonData = jsonDecode(response.body);
      return PokemonApi.fromJson(jsonData);
    } catch (error) {
      print('erro ao obter lista: $error');
      return null;
    }
  }
}
