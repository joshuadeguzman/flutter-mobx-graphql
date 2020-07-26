class SearchArtists {
  Data data;

  SearchArtists({this.data});

  SearchArtists.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Artist> queryArtists;

  Data({this.queryArtists});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['queryArtists'] != null) {
      queryArtists = new List<Artist>();
      json['queryArtists'].forEach((v) {
        queryArtists.add(new Artist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.queryArtists != null) {
      data['queryArtists'] = this.queryArtists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Artist {
  String name;
  String id;
  String image;
  List<Album> albums;

  Artist({this.name, this.id, this.image, this.albums});

  Artist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image = json['image'];
    if (json['albums'] != null) {
      albums = new List<Album>();
      json['albums'].forEach((v) {
        albums.add(new Album.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['image'] = this.image;
    if (this.albums != null) {
      data['albums'] = this.albums.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Album {
  String name;
  String id;
  String image;

  Album({
    this.name,
    this.id,
    this.image,
  });

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
