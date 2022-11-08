import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_first_crypto_app/globalconst/global_const.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({
    Key? key, required this.coinName, required this.coinInt, required this.percentCoin,
  }) : super(key: key);
  final String coinName;
  final int coinInt;
 
  final double percentCoin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      height: MediaQuery.of(context).size.width / 2.3,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 65, 70, 90).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
              
            ],
          ),
             Padding(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Text(
              coinName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
       
          Container(
            padding: EdgeInsets.only(top: 25,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 2),
                  child: Text("Total amount: ${coinInt.toString()}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: PageSize.height15,),
                 LinearPercentIndicator(
                  
                  barRadius: Radius.circular(20),
                  width: MediaQuery.of(context).size.width/2.4,
                  backgroundColor: Colors.white.withOpacity(0.7),
                  
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: percentCoin,
                  
                  center: Text("${(percentCoin*100).toString()}%",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
