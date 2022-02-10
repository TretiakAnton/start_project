class Film {
  const Film(this.id, this.url);

  Film.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'];

  @override
  bool operator ==(o) =>o==this && o is Film && id == o.id && url == o.url;

  final String id;
  final String url;

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

}
