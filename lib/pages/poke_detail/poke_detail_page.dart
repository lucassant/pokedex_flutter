import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/pages/poke_detail/about_page.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final int index;

  PokeDetailPage({Key key, @required this.index}) : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  PageController _pageController;
  Pokemon _pokemon;
  PokeApiStore _pokemonStore;
  double _progress;
  double _multiple;
  double _opacity;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: widget.index, viewportFraction: 1.2);
    _pokemonStore = GetIt.instance<PokeApiStore>();
    _pokemon = _pokemonStore.pokemonAtual;

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
    return Observer(
      name: 'scaffold',
      builder: (context) {
        _pokemon = _pokemonStore.pokemonAtual;
        return Scaffold(
          backgroundColor: _pokemonStore.corPokemonAtual,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              _pokemon.name,
              style: TextStyle(
                fontFamily: 'Google',
                fontSize: 30,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
          body: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ConstsApp.setTipos(_pokemon.type, 2),
                    Text(
                      '#' + _pokemon.num,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Google',
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
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
                    snappings: [0.7, 1.0],
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
                        top: _progress == 1 ? 1000 : 90 - _progress * 90),
                    child: SizedBox(
                      height: 200,
                      child: PageView.builder(
                          controller: _pageController,
                          itemCount: _pokemonStore.pokeApi.pokemon.length,
                          onPageChanged: (i) {
                            _pokemonStore.setPokemonAtual(index: i);
                          },
                          itemBuilder: (BuildContext context, int count) {
                            return Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Opacity(
                                  opacity: 0.2,
                                  child: Image.asset(
                                    ConstsApp.whitePokeball,
                                    height: 260,
                                    width: 260,
                                  ),
                                ),
                                AnimatedPadding(
                                  curve: Curves.bounceInOut,
                                  duration: Duration(milliseconds: 400),
                                  padding: EdgeInsets.all(
                                      count == _pokemonStore.posicaoAtual
                                          ? 0
                                          : 60),
                                  child: Hero(
                                    tag: count == _pokemonStore.posicaoAtual
                                        ? _pokemon.name
                                        : 'none' + count.toString(),
                                    child: CachedNetworkImage(
                                        width: 150,
                                        height: 150,
                                        placeholder: (context, url) =>
                                            Container(
                                              color: Colors.transparent,
                                            ),
                                        imageUrl:
                                            'https://pokeres.bastionbot.org/images/pokemon/${_pokemon.id}.png'),
                                  ),
                                ),
                              ],
                            );
                          }),
                    )),
              ),
              Positioned(
                top: 120,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          _pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        icon: Icon(
                          FlutterIcons.chevron_left_ent,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        icon: Icon(
                          FlutterIcons.chevron_right_ent,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
