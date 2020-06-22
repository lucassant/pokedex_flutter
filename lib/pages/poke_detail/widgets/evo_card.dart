import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_app.dart';

class EvolutionCard extends StatelessWidget {
  final Color corPokemon;
  final String nomePokemon;
  final String imageUrl;
  final String id;
  final List<String> types;

  const EvolutionCard(
      {Key key,
      this.corPokemon,
      this.nomePokemon,
      this.imageUrl,
      this.id,
      this.types})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 100,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: corPokemon),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              margin: EdgeInsets.all(5),
              child: CachedNetworkImage(
                width: 90,
                height: 90,
                imageUrl: imageUrl,
                placeholder: (context, url) {
                  return Container(color: Colors.transparent);
                },
              ),
            ),
            Text(
              id,
              style: TextStyle(
                  color: Colors.white, fontSize: 14, fontFamily: 'Google'),
            ),
            Flexible(
              child: Text(
                nomePokemon,
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontFamily: 'Google'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ConstsApp.setTipos(types, 1),
            )
          ],
        ),
      ),
    );
  }
}
