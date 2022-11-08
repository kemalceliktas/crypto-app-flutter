
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';


class FavoriteScreen extends StatefulWidget {
  final snap;
  const FavoriteScreen({super.key, this.snap});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.snap.data()["FavCoins"].toString()),
    );
  }
}
