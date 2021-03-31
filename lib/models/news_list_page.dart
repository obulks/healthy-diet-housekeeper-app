class NewsList {
  int code;
  String msg;
  Data data;

  NewsList({this.code, this.msg, this.data});

  NewsList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String page;
  String pageSize;
  List<News> news;

  Data({this.page, this.pageSize, this.news});

  Data.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['page_size'];
    if (json['news'] != null) {
      news = [];
      json['news'].forEach((v) {
        news.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  String uniquekey;
  String title;
  String date;
  String category;
  String authorName;
  String url;
  String thumbnailPicS;
  String isContent;
  String thumbnailPicS02;
  String thumbnailPicS03;

  News(
      {this.uniquekey,
        this.title,
        this.date,
        this.category,
        this.authorName,
        this.url,
        this.thumbnailPicS,
        this.isContent,
        this.thumbnailPicS02,
        this.thumbnailPicS03});

  News.fromJson(Map<String, dynamic> json) {
    uniquekey = json['uniquekey'];
    title = json['title'];
    date = json['date'];
    category = json['category'];
    authorName = json['author_name'];
    url = json['url'];
    thumbnailPicS = json['thumbnail_pic_s'];
    isContent = json['is_content'];
    thumbnailPicS02 = json['thumbnail_pic_s02'];
    thumbnailPicS03 = json['thumbnail_pic_s03'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uniquekey'] = this.uniquekey;
    data['title'] = this.title;
    data['date'] = this.date;
    data['category'] = this.category;
    data['author_name'] = this.authorName;
    data['url'] = this.url;
    data['thumbnail_pic_s'] = this.thumbnailPicS;
    data['is_content'] = this.isContent;
    data['thumbnail_pic_s02'] = this.thumbnailPicS02;
    data['thumbnail_pic_s03'] = this.thumbnailPicS03;
    return data;
  }
}
