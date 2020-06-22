// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapiv2_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiV2Store on _PokeApiV2StoreBase, Store {
  Computed<PokeApiV2> _$pokeApiV2Computed;

  @override
  PokeApiV2 get pokeApiV2 =>
      (_$pokeApiV2Computed ??= Computed<PokeApiV2>(() => super.pokeApiV2,
              name: '_PokeApiV2StoreBase.pokeApiV2'))
          .value;

  final _$_pokeApiV2Atom = Atom(name: '_PokeApiV2StoreBase._pokeApiV2');

  @override
  PokeApiV2 get _pokeApiV2 {
    _$_pokeApiV2Atom.reportRead();
    return super._pokeApiV2;
  }

  @override
  set _pokeApiV2(PokeApiV2 value) {
    _$_pokeApiV2Atom.reportWrite(value, super._pokeApiV2, () {
      super._pokeApiV2 = value;
    });
  }

  final _$specieAtom = Atom(name: '_PokeApiV2StoreBase.specie');

  @override
  Specie get specie {
    _$specieAtom.reportRead();
    return super.specie;
  }

  @override
  set specie(Specie value) {
    _$specieAtom.reportWrite(value, super.specie, () {
      super.specie = value;
    });
  }

  final _$getInfoPokemonAsyncAction =
      AsyncAction('_PokeApiV2StoreBase.getInfoPokemon');

  @override
  Future<void> getInfoPokemon({String name}) {
    return _$getInfoPokemonAsyncAction
        .run(() => super.getInfoPokemon(name: name));
  }

  final _$getInfoSpecieAsyncAction =
      AsyncAction('_PokeApiV2StoreBase.getInfoSpecie');

  @override
  Future<void> getInfoSpecie({int index}) {
    return _$getInfoSpecieAsyncAction
        .run(() => super.getInfoSpecie(index: index));
  }

  @override
  String toString() {
    return '''
specie: ${specie},
pokeApiV2: ${pokeApiV2}
    ''';
  }
}
