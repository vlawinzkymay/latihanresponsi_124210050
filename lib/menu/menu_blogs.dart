import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../api_data_source.dart';
import '../data_blogs.dart';


class menuBlogs extends StatefulWidget {
  const menuBlogs({super.key});

  @override
  State<menuBlogs> createState() => _menuBlogsState();
}

class _menuBlogsState extends State<menuBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOG LIST"),
      ),
      body: _buildListArticlesBody(),
    );
  }

  Widget _buildListArticlesBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadReports(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
             Blogs = Blogs.fromJson(snapshot.data);
            return _buildSuccessSection(Blogs);
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

  Widget _buildSuccessSection(Blogs results) {
    return ListView.builder(
      itemCount: results.results!.length,
      itemBuilder: (BuildContext context, int index) {
        final data = _buildItemArticles(results.results![index]);
        return data;
      },
    );
  }

  Widget _buildItemArticles(Results Blogs) {
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
              child: Image.network(Blogs.imageUrl!),
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
                        Blogs.title!,
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