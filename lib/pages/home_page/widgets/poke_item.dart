import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_app.dart';

class PokeItem extends StatelessWidget {
  const PokeItem({
    Key key,
    this.name,
    this.index,
    this.color,
    this.numero,
    this.types,
    this.imageUrl,
  }) : super(key: key);

  final String name;
  final int index;
  final Color color;
  final String numero;
  final List<String> types;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              ConstsApp.getColorType(type: types[0]).withOpacity(0.8),
              ConstsApp.getColorType(type: types[0])
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: Text(
                    '$numero',
                    style: TextStyle(
                        color: Color.fromARGB(50, 0, 0, 0),
                        fontFamily: 'Google',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      ConstsApp.whitePokeball,
                      width: 90,
                      height: 90,
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Hero(
                  tag: name,
                  child: CachedNetworkImage(
                      width: 90,
                      height: 90,
                      placeholder: (context, url) {
                        return Container(
                          color: Colors.transparent,
                          child: CircularProgressIndicator(),
                        );
                      },
                      imageUrl: imageUrl),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Google',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ConstsApp.setTipos(types, 1),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
