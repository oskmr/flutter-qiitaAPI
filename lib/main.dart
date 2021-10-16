import 'package:flutter/material.dart';
import 'package:qiita/article.dart';
import 'package:qiita/getArticle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      title: 'Qiita',
      home: ArticlesPage(title: '記事一覧'),
    );
  }
}

class ArticlesPage extends StatefulWidget {
  ArticlesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {

  GetArticle getArticle = GetArticle();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Article>>(
        future: getArticle.getArticle(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.error != null) {
            return Center(
              child: Text('error'),
            );
          }

          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final title = snapshot.data[index].title ?? "";
                return ListTile(
                  title: Text(title),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 0.5);
              },
              itemCount: snapshot.data?.length
          );
        },
      ),
    );
  }

}