class Anime {
  final String synopsis;
  final String canonicalTitle;
  final String startDate;
  final String endDate;
  final String ageRatingGuide;
  final int episodeCount;
  final String posterImage;

  Anime({
    this.synopsis,
    this.canonicalTitle,
    this.startDate,
    this.endDate,
    this.ageRatingGuide,
    this.episodeCount,
    this.posterImage,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    var atributos = json['attributes'] as Map<String, dynamic>;
    var poster = atributos['posterImage'] as Map<String, dynamic>;
    return Anime(
        synopsis: atributos['synopsis'],
        canonicalTitle: atributos['canonicalTitle'],
        startDate: atributos['startDate'],
        endDate: atributos['endDate'],
        ageRatingGuide: atributos['ageRatingGuide'],
        episodeCount: atributos['episodeCount'],
        posterImage: poster['original']);
  }
}
