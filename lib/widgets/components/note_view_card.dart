import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_first_crypto_app/globalconst/global_const.dart';




Widget noteCard(Function()? onTab,QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTab,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
           
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  print("Delete");
                  FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Notes").doc(doc.id).delete();
                 
                },
                child: Icon(Icons.cancel,color: Colors.amber[800],))
            ],
          ),
          Text(doc["note"],
          style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
         ),
          SizedBox(height: 4,),
          Text(doc["date"].toString().substring(0,11),style:TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 14,fontWeight: FontWeight.w600) ,
         ),
          SizedBox(height: PageSize.height20,),
          
          Text(doc["noteTitle"],style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w400),
       ),
        ],
      ),
    ),
  );
}