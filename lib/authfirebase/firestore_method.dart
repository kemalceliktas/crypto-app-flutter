import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethod{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;




   Future<void> deleteCoin(String postId)async{
    try {
      await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Coins")
        .doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }


    
}


