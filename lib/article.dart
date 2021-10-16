class Article {
  Article({
    this.title,
    this.url,
  });

  final String title;
  final String url;

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'],
      url: map['url'],
    );
  }

}