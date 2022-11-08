import 'package:flutter/material.dart';

import '../../globalconst/global_const.dart';


class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key, required this.icon, required this.text, required this.func,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function func;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
          
            Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(width: PageSize.width20,),
            Icon(Icons.arrow_forward_ios,color: Colors.amber[800],)
          ],
        ),
      ),
    );
  }
}