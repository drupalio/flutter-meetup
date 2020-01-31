import 'package:flutter/material.dart';
import 'package:primerapi/classes/anime.dart';

class DetalleAnime extends StatelessWidget {
  final Anime anime;

  const DetalleAnime({this.anime}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(anime.canonicalTitle),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              Image.network(anime.posterImage),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      '${anime.startDate} / ${anime.endDate}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${anime.ageRatingGuide}'),
                        Row(
                          children: <Widget>[
                            Text('Episodios: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('${anime.episodeCount}')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('${anime.synopsis}')
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
