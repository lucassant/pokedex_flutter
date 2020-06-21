import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokedex/pages/home_page/widgets/poke_item.dart';
import 'package:pokedex/pages/poke_detail/poke_detail_page.dart';
import 'package:pokedex/stores/pokeapi_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore _pokemonStore;

  @override
  void initState() {
    _pokemonStore = GetIt.instance<PokeApiStore>();
    //Só carrega a lista se for null antes
    if (_pokemonStore.pokeApi == null) {
      _pokemonStore.fetchPokemonList();
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
                        PokeApi _pokeApi = _pokemonStore.pokeApi;
                        return (_pokeApi != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: _pokeApi.pokemon.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      Pokemon _pokemon =
                                          _pokemonStore.getPokemon(index);

                                      return AnimationConfiguration
                                          .staggeredGrid(
                                              position: index,
                                              columnCount: 2,
                                              child: ScaleAnimation(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _pokemonStore
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
                                                    numero: _pokemon.num,
                                                    types: _pokemon.type,
                                                    index: index,
                                                    id: _pokemon.id,
                                                  ),
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
