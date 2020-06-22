import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapiv2.dart';
import 'package:pokedex/models/specie.dart';
import 'package:http/http.dart' as http;
part 'pokeapiv2_store.g.dart';

class PokeApiV2Store = _PokeApiV2StoreBase with _$PokeApiV2Store;

abstract class _PokeApiV2StoreBase with Store {
  @observable
  PokeApiV2 _pokeApiV2;

  @observable
  Specie specie;

  @computed
  PokeApiV2 get pokeApiV2 => _pokeApiV2;

  @action
  Future<void> getInfoPokemon({String name}) async {
    try {
      final response =
          await http.get(ConstsApi.pokeApiV2URL + name.toLowerCase());

      var decodeJson = jsonDecode(response.body);
      _pokeApiV2 = PokeApiV2.fromJson(decodeJson);
    } catch (error, stacktrace) {
      _pokeApiV2 = null;
      print('erro ao carregar infolist $error ' + stacktrace.toString());
      return null;
    }
  }

  @action
  Future<void> getInfoSpecie({int index}) async {
    try {
      final response =
          await http.get(ConstsApi.pokeApiSpeciesURL + index.toString());
      var decodeJson = jsonDecode(response.body);
      specie = Specie.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print('erro ao carregar specie $error ' + stacktrace.toString());
      return null;
    }
  }
}
