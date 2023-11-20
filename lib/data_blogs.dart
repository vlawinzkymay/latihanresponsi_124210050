class Blogs {
  int? count;
  String? next;
  Null? previous;
  List<Results>? results;

  Blogs({this.count, this.next, this.previous, this.results});

  Blogs.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  String? publishedAt;
  String? updatedAt;
  bool? featured;
  List<Null>? launches;
  List<Null>? events;

  Results(
      {this.id,
      this.title,
      this.url,
      this.imageUrl,
      this.newsSite,
      this.summary,
      this.publishedAt,
      this.updatedAt,
      this.featured,
      this.launches,
      this.events});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['image_url'];
    newsSite = json['news_site'];
    summary = json['summary'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
    featured = json['featured'];
    if (json['launches'] != null) {
      launches = <Null>[];
      json['launches'].forEach((v) {
        launches!.add(new Null.fromJson(v));
      });
    }
    if (json['events'] != null) {
      events = <Null>[];
      json['events'].forEach((v) {
        events!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['news_site'] = this.newsSite;
    data['summary'] = this.summary;
    data['published_at'] = this.publishedAt;
    data['updated_at'] = this.updatedAt;
    data['featured'] = this.featured;
    if (this.launches != null) {
      data['launches'] = this.launches!.map((v) => v.toJson()).toList();
    }
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
