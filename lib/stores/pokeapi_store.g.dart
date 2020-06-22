// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeApi> _$pokeApiComputed;

  @override
  PokeApi get pokeApi =>
      (_$pokeApiComputed ??= Computed<PokeApi>(() => super.pokeApi,
              name: '_PokeApiStoreBase.pokeApi'))
          .value;
  Computed<Pokemin> _$pokemonAtualComputed;

  @override
  Pokemin get pokemonAtual =>
      (_$pokemonAtualComputed ??= Computed<Pokemin>(() => super.pokemonAtual,
              name: '_PokeApiStoreBase.pokemonAtual'))
          .value;
  Computed<Color> _$corPokemonAtualComputed;

  @override
  Color get corPokemonAtual => (_$corPokemonAtualComputed ??= Computed<Color>(
          () => super.corPokemonAtual,
          name: '_PokeApiStoreBase.corPokemonAtual'))
      .value;

  final _$_pokeApiAtom = Atom(name: '_PokeApiStoreBase._pokeApi');

  @override
  PokeApi get _pokeApi {
    _$_pokeApiAtom.reportRead();
    return super._pokeApi;
  }

  @override
  set _pokeApi(PokeApi value) {
    _$_pokeApiAtom.reportWrite(value, super._pokeApi, () {
      super._pokeApi = value;
    });
  }

  final _$_pokemonAtualAtom = Atom(name: '_PokeApiStoreBase._pokemonAtual');

  @override
  Pokemin get _pokemonAtual {
    _$_pokemonAtualAtom.reportRead();
    return super._pokemonAtual;
  }

  @override
  set _pokemonAtual(Pokemin value) {
    _$_pokemonAtualAtom.reportWrite(value, super._pokemonAtual, () {
      super._pokemonAtual = value;
    });
  }

  final _$_corPokemonAtualAtom =
      Atom(name: '_PokeApiStoreBase._corPokemonAtual');

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

  final _$posicaoAtualAtom = Atom(name: '_PokeApiStoreBase.posicaoAtual');

  @override
  int get posicaoAtual {
    _$posicaoAtualAtom.reportRead();
    return super.posicaoAtual;
  }

  @override
  set posicaoAtual(int value) {
    _$posicaoAtualAtom.reportWrite(value, super.posicaoAtual, () {
      super.posicaoAtual = value;
    });
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemon(int index) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getPokemon');
    try {
      return super.getPokemon(index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getPokemonId({String num}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getPokemonId');
    try {
      return super.getPokemonId(num: num);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokemonAtual({int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.setPokemonAtual');
    try {
      return super.setPokemonAtual(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String numero}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getImage');
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posicaoAtual: ${posicaoAtual},
pokeApi: ${pokeApi},
pokemonAtual: ${pokemonAtual},
corPokemonAtual: ${corPokemonAtual}
    ''';
  }
}
