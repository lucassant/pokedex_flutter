import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokemonapi.dart';
import 'package:pokedex/pages/poke_detail/about_page.dart';
import 'package:pokedex/stores/pokedexapi_store.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final int index;

  PokeDetailPage({Key key, @required this.index}) : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  PageController _pageController;
  PokedexApiStore _pokedexApiStore;

  double _progress;
  double _multiple;
  double _opacity;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: widget.index, viewportFraction: 0.5);
    _pokedexApiStore = GetIt.instance<PokedexApiStore>();

    _progress = 0;
    _multiple = 1;
    _opacity = 1;

    super.initState();
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Observer(
                name: 'obs_topo',
                builder: (context) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _pokedexApiStore.corPokemonAtual.withOpacity(.7),
                          _pokedexApiStore.corPokemonAtual,
                        ],
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        AppBar(
                          centerTitle: true,
                          elevation: 0,
                          backgroundColor: _pokedexApiStore.corPokemonAtual,
                          leading: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          actions: <Widget>[
                            IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {})
                          ],
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.07 -
                              _progress *
                                  (MediaQuery.of(context).size.height * 0.060),
                          left: 20 +
                              _progress *
                                  (MediaQuery.of(context).size.height * 0.060),
                          child: Text(
                            _pokedexApiStore.pokemonAtual.name,
                            style: TextStyle(
                                fontFamily: 'Google',
                                fontSize: 38 -
                                    _progress *
                                        (MediaQuery.of(context).size.height *
                                            0.011),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.12,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    ConstsApp.setTipos(
                                        _pokedexApiStore
                                            .pokemonAtual.typeofpokemon,
                                        2),
                                    Text(
                                      '${_pokedexApiStore.pokemonAtual.id}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Google',
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                }),
            SlidingSheet(
              listener: (state) {
                setState(() {
                  _progress = state.progress;
                  _multiple = 1 - interval(0.0, 0.9, _progress);
                  _opacity = _multiple;
                });
              },
              elevation: 0,
              cornerRadius: 30,
              snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [0.6, 0.9],
                  positioning: SnapPositioning.relativeToAvailableSpace),
              builder: (context, state) {
                return Container(
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).size.height * 0.11,
                  child: Center(
                    child: AboutPage(),
                  ),
                );
              },
            ),
            Opacity(
              opacity: _opacity,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: _progress == 1
                          ? 1000
                          : (MediaQuery.of(context).size.height * 0.23) -
                              _progress * 50),
                  child: SizedBox(
                    height: 200,
                    child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: _pageController,
                        itemCount: _pokedexApiStore.pokemonApi.pokemon.length,
                        onPageChanged: (i) {
                          _pokedexApiStore.setPokemonAtual(index: i);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          Pokemon _pokemon =
                              _pokedexApiStore.getPokemon(index: index);

                          return Observer(
                              name: 'teste',
                              builder: (context) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    AnimatedOpacity(
                                      opacity:
                                          index == _pokedexApiStore.posicaoAtual
                                              ? 0.2
                                              : 0,
                                      duration: Duration(milliseconds: 200),
                                      child: Image.asset(
                                        ConstsApp.whitePokeball,
                                        height: 270,
                                        width: 270,
                                      ),
                                    ),
                                    IgnorePointer(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          AnimatedPadding(
                                            child: Hero(
                                                tag: index ==
                                                        _pokedexApiStore
                                                            .posicaoAtual
                                                    ? _pokemon.name
                                                    : 'none$index',
                                                child: CachedNetworkImage(
                                                  height: 160,
                                                  width: 160,
                                                  placeholder: (context, url) {
                                                    return Container(
                                                        color:
                                                            Colors.transparent);
                                                  },
                                                  color: index ==
                                                          _pokedexApiStore
                                                              .posicaoAtual
                                                      ? null
                                                      : Colors.black
                                                          .withOpacity(0.7),
                                                  imageUrl: _pokemon.imageurl,
                                                )),
                                            duration:
                                                Duration(milliseconds: 400),
                                            curve: Curves.easeIn,
                                            padding: EdgeInsets.only(
                                                top: index ==
                                                        _pokedexApiStore
                                                            .posicaoAtual
                                                    ? 0
                                                    : 60,
                                                bottom: index ==
                                                        _pokedexApiStore
                                                            .posicaoAtual
                                                    ? 0
                                                    : 60),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
