import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/pages/poke_detail/about_tab.dart';
import 'package:pokedex/pages/poke_detail/evolution_tab.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:pokedex/stores/pokeapiv2_store.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  PokeApiStore _pokeStore;
  PokeApiV2Store _pokeApiV2Store;
  int _index;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _pokeStore = GetIt.instance<PokeApiStore>();
    _pokeApiV2Store = PokeApiV2Store();
    _pageController = PageController(initialPage: 0);
    _index = 0;
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
              _pokeApiV2Store.getInfoPokemon(index: _pokeStore.pokemonAtual.id);
              _pokeApiV2Store.getInfoSpecie(index: _pokeStore.pokemonAtual.id);
              return TabBar(
                onTap: (index) {
                  setState(() {
                    _index = index;
                    _tabController.animateTo(index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  });
                },
                controller: _tabController,
                labelStyle: TextStyle(
                    fontFamily: 'Google', fontWeight: FontWeight.w700),
                indicatorSize: TabBarIndicatorSize.label, //makes it better
                labelColor: _pokeStore.corPokemonAtual, //Google's sweet blue
                unselectedLabelColor: Color(0xff5f6368), //niceish grey
                isScrollable: true, //up to your taste
                indicator: MD2Indicator(
                    //it begins here
                    indicatorHeight: 3,
                    indicatorColor: _pokeStore.corPokemonAtual,
                    indicatorSize: MD2IndicatorSize
                        .normal //3 different modes tiny-normal-full
                    ),
                tabs: <Widget>[
                  Tab(
                    text: "Sobre",
                  ),
                  Tab(
                    text: "Evolução",
                  ),
                  Tab(
                    text: "Status",
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _index = index;
            _tabController.animateTo(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          });
        },
        controller: _pageController,
        children: <Widget>[
          AboutTab(),
          EvolutionTab(),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
