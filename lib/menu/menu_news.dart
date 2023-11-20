import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../api_data_source.dart';
import '../data_news.dart';


class menuNews extends StatefulWidget {
  const menuNews({super.key});

  @override
  State<menuNews> createState() => _menuNewsState();
}

class _menuNewsState extends State<menuNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS LIST"),
      ),
      body: _buildListArticlesBody(),
    );
  }

  Widget _buildListArticlesBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadNews(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
             News = News.fromJson(snapshot.data);
            return _buildSuccessSection(News);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(News results) {
    return ListView.builder(
      itemCount: results.results!.length,
      itemBuilder: (BuildContext context, int index) {
        final data = _buildItemArticles(results.results![index]);
        return data;
      },
    );
  }

  Widget _buildItemArticles(Results News) {
    return InkWell(
      onTap: () {},
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              child: Image.network(News.imageUrl!),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400, // Atur lebar sesuai kebutuhan
                  child: Wrap(
                    children: [
                      Text(
                        News.title!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}