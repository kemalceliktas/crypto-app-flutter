import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_crypto_app/authfirebase/firestore_method.dart';
import 'package:my_first_crypto_app/authfirebase/flutterfire.dart';

import '../api/api_methods.dart';

class CoinScreen extends StatefulWidget {
  final snap;
  const CoinScreen({super.key, this.snap});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  double bitcoin = 0.0;
  double ethereum = 0.0;
  double tether = 0.0;
  bool isFavorite=false;
  void getCoins() async {
    try {
      QuerySnapshot snaps = await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Coins")
          .get();
    } catch (e) {
      print(e.toString() + "coin screen error");
    }

    setState(() {});
  }

   getValues() async {
    bitcoin = await getPrice("bitcoin");
    ethereum = await getPrice("ethereum");
    tether = await getPrice("tether");
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
    
          Text(widget.snap.data()["Amount"].toString()),
          Text(widget.snap.id.toString()),
          
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            shrinkWrap: true,
                            children: [
                              "Delete",
                            ]
                                .map((e) => InkWell(
                                      onTap: () async {
                                          await  FirestoreMethod().deleteCoin(
                                            widget.snap.id.toString());
                                        
                                           Navigator.of(context).pop();
                                            
                                       
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 16),
                                        child: Text(e),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ));
              },
              icon: Icon(Icons.delete)),

              IconButton(onPressed: ()async{
                setState(() {
                  isFavorite=!isFavorite;
                });
                await addFavoriteCoin(widget.snap.id, isFavorite);
                
               
              }, icon: Icon(Icons.favorite),),
        ],
      ),
    );
  }
}
