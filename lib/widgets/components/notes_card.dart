import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_crypto_app/globalconst/global_const.dart';
import 'package:my_first_crypto_app/pages/notes_view.dart';


class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Notes").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,index){
            return Container(
              
              width: PageSize.width20*7,
              
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 22),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 92, 234, 97).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                 
                  Text(snapshot.data!.docs[index]["date"].toString().substring(0,11),style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(height: PageSize.height10/2,),
                  Text(snapshot.data!.docs[index]["date"].toString().substring(11,16),style: TextStyle(color: Colors.white.withOpacity(0.3),fontSize: 13,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),

                  Expanded(child: Text(snapshot.data!.docs[index]["noteTitle"].toString(),style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),)),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteView()));
                  }, child: Text("View All"))
                ],
              ));
          });
      }
    );
  }
}