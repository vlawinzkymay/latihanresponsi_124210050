import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../api_data_source.dart';
import '../data_reports.dart';


class menuReports extends StatefulWidget {
  const menuReports({super.key});

  @override
  State<menuReports> createState() => _menuReportsState();
}

class _menuReportsState extends State<menuReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REPORT LIST"),
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
             Reports = Reports.fromJson(snapshot.data);
            return _buildSuccessSection(Reports);
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

  Widget _buildSuccessSection(Reports results) {
    return ListView.builder(
      itemCount: results.results!.length,
      itemBuilder: (BuildContext context, int index) {
        final data = _buildItemArticles(results.results![index]);
        return data;
      },
    );
  }

  Widget _buildItemArticles(Results Reports) {
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
              child: Image.network(Reports.imageUrl!),
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
                        Reports.title!,
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