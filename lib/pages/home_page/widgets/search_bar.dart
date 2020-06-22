import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/stores/pokedexapi_store.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    this.margin = const EdgeInsets.symmetric(horizontal: 28),
  }) : super(key: key);

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    PokedexApiStore _pokedexApiStore = GetIt.instance<PokedexApiStore>();
    TextEditingController _search = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      margin: margin,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search),
          SizedBox(width: 13),
          Expanded(
            child: TextFormField(
              controller: _search,
              decoration: InputDecoration(
                hintText: "Search Pokemon",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
              onChanged: (v) {
                _pokedexApiStore.setPesquisaPokemon(pesquisa: v);
              },
              onFieldSubmitted: (v) {
                if (v.isEmpty) {
                  _pokedexApiStore.fetchList();
                } else {
                  _pokedexApiStore.filtraLista();
                }

                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
