import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'imagePath': 'https://png.pngtree.com/png-vector/20230206/ourlarge/pngtree-neon-circle-pink-shining-png-image_6583657.png',
      'title': 'News',
      'description': 'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites.',
    },
    {
      'imagePath': 'https://png.pngtree.com/png-vector/20230206/ourlarge/pngtree-neon-circle-pink-shining-png-image_6583657.png',
      'title': 'Blogs',
      'description': 'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast',
    },
    {
      'imagePath': 'https://png.pngtree.com/png-vector/20230206/ourlarge/pngtree-neon-circle-pink-shining-png-image_6583657.png',
      'title': 'Reports',
      'description': 'Space stations and other missions often publish their data. With SNAPI, you can include it in your apps as well',
    },
    // Tambahkan item lain sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPACE FLIGT NEWS'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CardItem(
            imagePath: items[index]['imagePath'],
            title: items[index]['title'],
            description: items[index]['description'],
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const CardItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(
            imagePath,
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
