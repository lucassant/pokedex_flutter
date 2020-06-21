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
  PokeApiV2 pokeApiV2;

  @observable
  Specie specie;

  @action
  Future<void> getInfoPokemon({int index}) async {
    try {
      final response =
          await http.get(ConstsApi.pokeApiV2URL + index.toString());
      var decodeJson = jsonDecode(response.body);
      pokeApiV2 = PokeApiV2.fromJson(decodeJson);
    } catch (error, stacktrace) {
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
