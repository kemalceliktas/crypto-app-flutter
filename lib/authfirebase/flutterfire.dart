import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//Sign in
Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e.toString() + "sign in");
    return false;
  }
}

//REGİSTER

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == "weak-password") {
      print("Password is weak");
    } else {
      print("Something went wrong - Register page");
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> addNote(String id,String noteTitle,String note)async{
  try {
    String uid = await FirebaseAuth.instance.currentUser!.uid;
    DocumentReference documentReference = await FirebaseFirestore.instance.collection("Users").doc(uid).collection("Notes").doc(id);
    String date = DateTime.now().toString();
    FirebaseFirestore.instance.runTransaction((transaction)async{
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({
          "noteTitle":noteTitle,
          "date":date,
          "note":note,

        });
        return true;
      }else if(snapshot.exists){
        transaction.update(documentReference, {
          "noteTitle":noteTitle,
          "date":date,
          "note":note,
        });
        return true;
      }
     
    });
     return true;
  } catch (e) {
    print(e.toString()+"add notes error");
    return false;
  }
}

Future<bool> addCoin(String id, String amount) async {
  try {
    String uid = await FirebaseAuth.instance.currentUser!.uid;
    var value = double.parse(amount);
    DocumentReference documentReference = await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Coins")
        .doc(id);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({"Amount": value});
        return true;
      } else if (snapshot.exists) {
        
        double newAmount = snapshot["Amount"] + value;
        transaction.update(
          documentReference,
          {"Amount": newAmount},
        );
        return true;
      }
    });

    return true;
  } catch (e) {
    print(e.toString() + "addCoin failed");
    return false;
  }
}

Future<bool>addFavoriteCoin(String id,bool isFavorite)async{
   try {
    String uid = await FirebaseAuth.instance.currentUser!.uid;
    
    DocumentReference documentReference = await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Favorites")
        .doc(id);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists&&isFavorite) {
        documentReference.set({"FavCoins":id.toString()});
        print("OLDU");
        return true;
      }else if(snapshot.exists&&isFavorite){
        documentReference.set({"FavCoins":id.toString()});
      } 
      else{
        documentReference.delete();
        print("Sildi");
        return true;
        
      }
    });

    return true;
  } catch (e) {
    print(e.toString() + "addFavorite failed");
    return false;
  }
}

Future<void> removeAllCoin(String id) async {
  try {
    String uid = await FirebaseAuth.instance.currentUser!.uid;
    double value = 0;
    DocumentReference documentReference = await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Coins")
        .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({"Amount": value});
        return true;
      } else if (snapshot.exists) {
        transaction.update(
          documentReference,
          {"Amount": value},
        );
        return true;
      }
    });

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Coins")
        .doc(id)
        .delete();
   
  } catch (e) {
    print(e.toString() + "addCoin failed");
  }

  Future<void> totalBalance()async{
    try {
      
     
    } catch (e) {
      
    }
  }
}

Future<bool> removeCoin(String id) async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .collection("Coins")
      .doc(id)
      .delete();
  return true;
}
