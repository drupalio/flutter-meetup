import 'package:flutter/material.dart';
import 'package:primerapi/classes/anime.dart';
import 'package:primerapi/ui/detalle_anime.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
        ),
        child: child);
  }
}

class TarjetaAnime extends StatelessWidget {
  final Anime anime;

  const TarjetaAnime({this.anime}) : super();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(context,
          CustomRoute(builder: (context) => DetalleAnime(anime: anime))),
      child: Card(
        elevation: 10,
        child: Column(
          children: <Widget>[
            Image.network(anime.posterImage),
            Text('${anime.canonicalTitle}'),
          ],
        ),
      ),
    );
  }
}
