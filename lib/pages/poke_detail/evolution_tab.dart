import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokemonapi.dart';
import 'package:pokedex/pages/poke_detail/widgets/evo_card.dart';
import 'package:pokedex/stores/pokedexapi_store.dart';

class EvolutionTab extends StatelessWidget {
  final PokedexApiStore _pokeApiStore = GetIt.instance<PokedexApiStore>();

  List<Widget> getEvos() {
    List<Widget> _lista = [];
    _pokeApiStore.pokemonAtual.evolutions.forEach((ev) {
      Pokemon pokemon = _pokeApiStore.getPokemonById(id: ev);

      _lista.add(EvolutionCard(
        corPokemon: _pokeApiStore.corPokemonAtual,
        id: pokemon.id,
        imageUrl: pokemon.imageurl,
        types: pokemon.typeofpokemon,
        nomePokemon: pokemon.name,
      ));
    });

    return _lista;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(
            name: 'obs_evo',
            builder: (context) {
              return _pokeApiStore.pokemonAtual != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: getEvos(),
                    )
                  : Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}
