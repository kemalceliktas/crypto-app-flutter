import 'package:flutter/material.dart';
import 'package:my_first_crypto_app/pages/notes_view.dart';



class AltBaslik extends StatelessWidget {
  final String baslik1,baslik2;
  final Function func;

  const AltBaslik({super.key, required this.baslik1, required this.func, required this.baslik2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(baslik1,style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          InkWell(
            onTap: () {
              func();
            },
            child: Text(baslik2,style: TextStyle(color: Colors.amber[800],),))
        ],
      ),
    );
  }
}