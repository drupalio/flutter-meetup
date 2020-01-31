import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:primerapi/classes/anime.dart';
import 'package:primerapi/ui/tarjeta_anime.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'primer api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Kitsu API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Anime> animes;

  void consultar() async {
    animes = List();
    final response = await http.get('https://kitsu.io/api/edge/anime');

    if (response.statusCode == 200) {
      var cuerpo = json.decode(response.body);
      var lista = cuerpo['data'];
      animes = List<Anime>.from(lista.map((a) => Anime.fromJson(a)));
    } else {
      throw Exception('Error al consumir la api');
    }
    setState(() => animes = animes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => consultar(),
              child: Text('Ver'),
            ),
            animes != null
                ? GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    childAspectRatio: .7,
                    children: List.generate(animes.length, (index) {
                      return TarjetaAnime(anime: animes[index]);
                    }),
                  )
                : Offstage()
          ],
        ),
      ),
    );
  }
}
