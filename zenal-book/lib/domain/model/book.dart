class Book {
  int? id;
  String? title;
  List<Authors>? authors;
  List<String>? translators;
  List<String>? subjects;
  List<String>? bookshelves;
  List<String>? languages;
  bool? copyright;
  String? mediaType;
  Formats? formats;
  int? downloadCount;

  Book({
    this.id,
    this.title,
    this.authors,
    this.translators,
    this.subjects,
    this.bookshelves,
    this.languages,
    this.copyright,
    this.mediaType,
    this.formats,
    this.downloadCount,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add(new Authors.fromJson(v));
      });
    }
    subjects = json['subjects'].cast<String>();
    bookshelves = json['bookshelves'].cast<String>();
    languages = json['languages'].cast<String>();
    copyright = json['copyright'];
    mediaType = json['media_type'];
    formats = json['formats'] != null ? new Formats.fromJson(json['formats']) : null;
    downloadCount = json['download_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.authors != null) {
      data['authors'] = this.authors!.map((v) => v.toJson()).toList();
    }
    data['subjects'] = this.subjects;
    data['bookshelves'] = this.bookshelves;
    data['languages'] = this.languages;
    data['copyright'] = this.copyright;
    data['media_type'] = this.mediaType;
    if (this.formats != null) {
      data['formats'] = this.formats!.toJson();
    }
    data['download_count'] = this.downloadCount;
    return data;
  }
}

class Authors {
  String? name;
  int? birthYear;
  int? deathYear;

  Authors({this.name, this.birthYear, this.deathYear});

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthYear = json['birth_year'];
    deathYear = json['death_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['birth_year'] = this.birthYear;
    data['death_year'] = this.deathYear;
    return data;
  }
}

class Formats {
  String? textHtml;
  String? textHtmlCharsetUtf8;
  String? applicationEpubZip;
  String? applicationXMobipocketEbook;
  String? textPlainCharsetUtf8;
  String? applicationRdfXml;
  String? imageJpeg;
  String? applicationOctetStream;
  String? textPlainCharsetUsAscii;

  Formats({
    this.textHtml,
    this.textHtmlCharsetUtf8,
    this.applicationEpubZip,
    this.applicationXMobipocketEbook,
    this.textPlainCharsetUtf8,
    this.applicationRdfXml,
    this.imageJpeg,
    this.applicationOctetStream,
    this.textPlainCharsetUsAscii,
  });

  Formats.fromJson(Map<String, dynamic> json) {
    textHtml = json['text/html'];
    textHtmlCharsetUtf8 = json['text/html; charset=utf-8'];
    applicationEpubZip = json['application/epub+zip'];
    applicationXMobipocketEbook = json['application/x-mobipocket-ebook'];
    textPlainCharsetUtf8 = json['text/plain; charset=utf-8'];
    applicationRdfXml = json['application/rdf+xml'];
    imageJpeg = json['image/jpeg'];
    applicationOctetStream = json['application/octet-stream'];
    textPlainCharsetUsAscii = json['text/plain; charset=us-ascii'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text/html'] = this.textHtml;
    data['text/html; charset=utf-8'] = this.textHtmlCharsetUtf8;
    data['application/epub+zip'] = this.applicationEpubZip;
    data['application/x-mobipocket-ebook'] = this.applicationXMobipocketEbook;
    data['text/plain; charset=utf-8'] = this.textPlainCharsetUtf8;
    data['application/rdf+xml'] = this.applicationRdfXml;
    data['image/jpeg'] = this.imageJpeg;
    data['application/octet-stream'] = this.applicationOctetStream;
    data['text/plain; charset=us-ascii'] = this.textPlainCharsetUsAscii;
    return data;
  }
}
