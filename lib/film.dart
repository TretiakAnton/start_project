class Film {
  final String id;
  final String url;

  const Film(this.id, this.url);
  Film.fromJSON(Map <String,dynamic>json): id = json['id'],url =json['url'];
}
