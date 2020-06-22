import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/pages/poke_detail/about_tab.dart';
import 'package:pokedex/pages/poke_detail/evolution_tab.dart';
import 'package:pokedex/pages/poke_detail/status_tab.dart';
import 'package:pokedex/stores/pokeapiv2_store.dart';
import 'package:pokedex/stores/pokedexapi_store.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  PokedexApiStore _pokedexApiStore;
  PokeApiV2Store _pokeApiV2Store;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _pokedexApiStore = GetIt.instance<PokedexApiStore>();
    _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Observer(
            builder: (context) {
              String _auxName = _pokedexApiStore.pokemonAtual.name;
              if (_pokedexApiStore.pokemonAtual.id == '#029') {
                _auxName = 'nidoran-f';
              } else if (_pokedexApiStore.pokemonAtual.id == '#032') {
                _auxName = 'nidoran-m';
              }

              _pokeApiV2Store.getInfoPokemon(
                  name: _auxName.replaceAll('\'', ''));

              return _pokeApiV2Store.pokeApiV2 != null
                  ? TabBar(
                      onTap: (index) {
                        _tabController.animateTo(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      controller: _tabController,
                      labelStyle: TextStyle(
                          fontFamily: 'Google', fontWeight: FontWeight.w700),
                      indicatorSize:
                          TabBarIndicatorSize.label, //makes it better
                      labelColor: _pokedexApiStore
                          .corPokemonAtual, //Google's sweet blue
                      unselectedLabelColor: Color(0xff5f6368), //niceish grey
                      isScrollable: false, //up to your taste
                      indicator: MD2Indicator(
                          //it begins here
                          indicatorHeight: 3,
                          indicatorColor: _pokedexApiStore.corPokemonAtual,
                          indicatorSize: MD2IndicatorSize
                              .normal //3 different modes tiny-normal-full
                          ),
                      tabs: <Widget>[
                        Tab(
                          text: "About",
                        ),
                        Tab(
                          text: "Evolution",
                        ),
                        Tab(
                          text: "Stats",
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
      body: Observer(
          name: 'obs_body',
          builder: (context) {
            return _pokeApiV2Store.pokeApiV2 != null
                ? PageView(
                    onPageChanged: (index) {
                      _tabController.animateTo(index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    controller: _pageController,
                    children: <Widget>[
                      AboutTab(),
                      EvolutionTab(),
                      StatusTab(),
                    ],
                  )
                : Center(
                    child: Container(
                      width: 100,
                      height: 100,
                    ),
                  );
          }),
    );
  }
}
