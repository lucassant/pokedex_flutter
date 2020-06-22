// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedexapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokedexApiStore on _PokedexApiStoreBase, Store {
  Computed<PokemonApi> _$pokemonApiComputed;

  @override
  PokemonApi get pokemonApi =>
      (_$pokemonApiComputed ??= Computed<PokemonApi>(() => super.pokemonApi,
              name: '_PokedexApiStoreBase.pokemonApi'))
          .value;
  Computed<Pokemon> _$pokemonAtualComputed;

  @override
  Pokemon get pokemonAtual =>
      (_$pokemonAtualComputed ??= Computed<Pokemon>(() => super.pokemonAtual,
              name: '_PokedexApiStoreBase.pokemonAtual'))
          .value;
  Computed<Color> _$corPokemonAtualComputed;

  @override
  Color get corPokemonAtual => (_$corPokemonAtualComputed ??= Computed<Color>(
          () => super.corPokemonAtual,
          name: '_PokedexApiStoreBase.corPokemonAtual'))
      .value;
  Computed<String> _$pesquisaPokemonComputed;

  @override
  String get pesquisaPokemon => (_$pesquisaPokemonComputed ??= Computed<String>(
          () => super.pesquisaPokemon,
          name: '_PokedexApiStoreBase.pesquisaPokemon'))
      .value;
  Computed<int> _$posicaoAtualComputed;

  @override
  int get posicaoAtual =>
      (_$posicaoAtualComputed ??= Computed<int>(() => super.posicaoAtual,
              name: '_PokedexApiStoreBase.posicaoAtual'))
          .value;

  final _$_pokemonApiAtom = Atom(name: '_PokedexApiStoreBase._pokemonApi');

  @override
  PokemonApi get _pokemonApi {
    _$_pokemonApiAtom.reportRead();
    return super._pokemonApi;
  }

  @override
  set _pokemonApi(PokemonApi value) {
    _$_pokemonApiAtom.reportWrite(value, super._pokemonApi, () {
      super._pokemonApi = value;
    });
  }

  final _$_pokemonAtualAtom = Atom(name: '_PokedexApiStoreBase._pokemonAtual');

  @override
  Pokemon get _pokemonAtual {
    _$_pokemonAtualAtom.reportRead();
    return super._pokemonAtual;
  }

  @override
  set _pokemonAtual(Pokemon value) {
    _$_pokemonAtualAtom.reportWrite(value, super._pokemonAtual, () {
      super._pokemonAtual = value;
    });
  }

  final _$_corPokemonAtualAtom =
      Atom(name: '_PokedexApiStoreBase._corPokemonAtual');

  @override
  Color get _corPokemonAtual {
    _$_corPokemonAtualAtom.reportRead();
    return super._corPokemonAtual;
  }

  @override
  set _corPokemonAtual(Color value) {
    _$_corPokemonAtualAtom.reportWrite(value, super._corPokemonAtual, () {
      super._corPokemonAtual = value;
    });
  }

  final _$_pesquisaPokemonAtom =
      Atom(name: '_PokedexApiStoreBase._pesquisaPokemon');

  @override
  String get _pesquisaPokemon {
    _$_pesquisaPokemonAtom.reportRead();
    return super._pesquisaPokemon;
  }

  @override
  set _pesquisaPokemon(String value) {
    _$_pesquisaPokemonAtom.reportWrite(value, super._pesquisaPokemon, () {
      super._pesquisaPokemon = value;
    });
  }

  final _$_posicaoAtualAtom = Atom(name: '_PokedexApiStoreBase._posicaoAtual');

  @override
  int get _posicaoAtual {
    _$_posicaoAtualAtom.reportRead();
    return super._posicaoAtual;
  }

  @override
  set _posicaoAtual(int value) {
    _$_posicaoAtualAtom.reportWrite(value, super._posicaoAtual, () {
      super._posicaoAtual = value;
    });
  }

  final _$_PokedexApiStoreBaseActionController =
      ActionController(name: '_PokedexApiStoreBase');

  @override
  void setPokemonAtual({int index}) {
    final _$actionInfo = _$_PokedexApiStoreBaseActionController.startAction(
        name: '_PokedexApiStoreBase.setPokemonAtual');
    try {
      return super.setPokemonAtual(index: index);
    } finally {
      _$_PokedexApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPesquisaPokemon({String pesquisa}) {
    final _$actionInfo = _$_PokedexApiStoreBaseActionController.startAction(
        name: '_PokedexApiStoreBase.setPesquisaPokemon');
    try {
      return super.setPesquisaPokemon(pesquisa: pesquisa);
    } finally {
      _$_PokedexApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Pokemon getPokemon({int index}) {
    final _$actionInfo = _$_PokedexApiStoreBaseActionController.startAction(
        name: '_PokedexApiStoreBase.getPokemon');
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_PokedexApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filtraLista() {
    final _$actionInfo = _$_PokedexApiStoreBaseActionController.startAction(
        name: '_PokedexApiStoreBase.filtraLista');
    try {
      return super.filtraLista();
    } finally {
      _$_PokedexApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchList() {
    final _$actionInfo = _$_PokedexApiStoreBaseActionController.startAction(
        name: '_PokedexApiStoreBase.fetchList');
    try {
      return super.fetchList();
    } finally {
      _$_PokedexApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonApi: ${pokemonApi},
pokemonAtual: ${pokemonAtual},
corPokemonAtual: ${corPokemonAtual},
pesquisaPokemon: ${pesquisaPokemon},
posicaoAtual: ${posicaoAtual}
    ''';
  }
}
