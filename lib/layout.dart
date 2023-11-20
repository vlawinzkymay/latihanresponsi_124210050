import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key, required this.image, required this.name, required this.desc});
  final String image;
  final String name;
  final String desc;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
