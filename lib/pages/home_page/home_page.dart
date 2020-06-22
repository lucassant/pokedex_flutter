import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokemonapi.dart';

import 'package:pokedex/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokedex/pages/home_page/widgets/poke_item.dart';
import 'package:pokedex/pages/poke_detail/poke_detail_page.dart';

import 'package:pokedex/stores/pokedexapi_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokedexApiStore _pokedexApiStore;

  @override
  void initState() {
    _pokedexApiStore = GetIt.instance<PokedexApiStore>();
    //Só carrega a lista se for null antes
    if (_pokedexApiStore.pokemonApi == null) {
      _pokedexApiStore.fetchList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: statusWidth - (240 / 2.9),
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              child: Image.asset(
                ConstsApp.darkPokeball,
                width: 240,
                height: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      name: 'ListaHomePage',
                      builder: (BuildContext context) {
                        if (_pokedexApiStore.pokemonApi != null) {
                          print(
                              '${_pokedexApiStore.pokemonApi.pokemon.length}');
                        }
                        return (_pokedexApiStore.pokemonApi != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: _pokedexApiStore
                                        .pokemonApi.pokemon.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      Pokemon _pokemon = _pokedexApiStore
                                          .pokemonApi.pokemon[index];

                                      return AnimationConfiguration
                                          .staggeredGrid(
                                              position: index,
                                              columnCount: 2,
                                              child: ScaleAnimation(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _pokedexApiStore
                                                        .setPokemonAtual(
                                                            index: index);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                PokeDetailPage(
                                                                  index: index,
                                                                ),
                                                            fullscreenDialog:
                                                                false));
                                                  },
                                                  child: PokeItem(
                                                      name: _pokemon.name,
                                                      numero: _pokemon.id,
                                                      types: _pokemon
                                                          .typeofpokemon,
                                                      imageUrl:
                                                          _pokemon.imageurl,
                                                      index: index),
                                                ),
                                              ));
                                    }))
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
