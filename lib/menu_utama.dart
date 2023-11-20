import 'package:flutter/material.dart';
import 'layout.dart';
import 'menu/menu_news.dart';
import 'menu/menu_blogs.dart';
import 'menu/menu_reports.dart';

class MenuUtama extends StatelessWidget {
  const MenuUtama ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Column(children: [
          MenuCard(
              menu: menuNews(
              name: "News",
              desc: ,
                  image:
                      "https://e1.pngegg.com/pngimages/842/589/png-clipart-pink-things-pink-triangular-artwork-thumbnail.png",
                  )),
          MenuCard(
              menu: menuBlogs(
            name: "Blogs",
            desc: ,
            image:
                "https://img2.pngdownload.id/20180605/twc/kisspng-pink-color-gel-green-yellow-pink-rectangle-5b175121c30d90.4546417915282547537989.jpg",
          )),
          MenuCard(
              menu: menuReports(
                name: "Reports",
                desc: ,
                image:
                    "https://png.pngtree.com/png-vector/20230206/ourlarge/pngtree-neon-circle-pink-shining-png-image_6583657.png"),
          ),  
        ]),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.menu});
  final Layout menu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return menu;
        }));
      },
      child: 
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.pink[300],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0,
                  spreadRadius: -6.0)
            ],),
            child:  Card(
        child: Column(children: [
          SizedBox(
              height: 200, width: 200, child: Image.network(menu.image)),
          Text(menu.name),
          SizedBox(height:20),
          Text(menu.desc),
        ]),
      ),
      ),
    );
  }
}

class CardMenuUtama extends StatelessWidget {
  const CardMenuUtama({super.key, required this.image, required this.name, required this.desc});
  final String image;
  final String name;
  final String desc;

 @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.pink[300],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0,
                  spreadRadius: -6.0)
            ],
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.multiply),
                image: NetworkImage(image),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0), 
              ),
              alignment: Alignment.center,
            ),
            
          ],
        ));
  }

}

