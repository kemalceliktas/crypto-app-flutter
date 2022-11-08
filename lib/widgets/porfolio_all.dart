import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_crypto_app/data/portfolio.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'components/portfolio_card.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {


    
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Coins").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }

        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    snapshot.data!.docs.length,
                    (index) => PortfolioCard(
                        coinName: snapshot.data!.docs[index].id.toUpperCase(),
                        coinInt: double.parse(snapshot.data!.docs[index]["Amount"].toString()).toInt(),
                        
                        percentCoin: portfolio[index].percentCoin!,),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
