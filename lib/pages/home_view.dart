import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_crypto_app/api/api_methods.dart';
import 'package:my_first_crypto_app/authfirebase/auth.dart';
import 'package:my_first_crypto_app/globalconst/global_const.dart';

import 'package:my_first_crypto_app/pages/add_view.dart';
import 'package:my_first_crypto_app/widgets/alt_baslik.dart';

import 'package:my_first_crypto_app/widgets/coin_screen.dart';
import 'package:my_first_crypto_app/widgets/components/notes_card.dart';

import 'package:my_first_crypto_app/widgets/favorite_screen.dart';
import 'package:my_first_crypto_app/widgets/notes_view.dart';
import 'package:my_first_crypto_app/widgets/porfolio_all.dart';

import '../widgets/components/drawer_item.dart';
import '../widgets/header_widget.dart';
import 'notes_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isClear = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        padding:
            EdgeInsets.only(top: PageSize.height45 * 3, left: PageSize.width20),
        width: PageSize.screenWidth / 1.3,
        decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.9)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage:
                            AssetImage("assets/images/profile_pic.png"),
                      ),
                      
                    ),
                  ),
                  SizedBox(width: PageSize.width10,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12)

                    ),
                    child: Text("Hello Ali",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),))
                ],
              ),
            ),
            DrawerItem(
              func: (){
                
              },
              icon: Icons.person,
              text: "My Profile",
            ),
            DrawerItem(
              func: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeView()));
              },
              icon: Icons.home,
              text: "Home Page",
            ),
            DrawerItem(
              func: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>NoteView()));
              },
              icon: Icons.note,
              text: "All notes",
            ),
            DrawerItem(
              func: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>AddView()));
              },
              icon: Icons.add,
              text: "Add coin",
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: PageSize.height45),
              child: DrawerItem(
                func: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthProject()));
                },
                icon: Icons.logout,
                text: "Log Out",
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 25, 33, 36),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.logout_sharp))
        ],
        backgroundColor: Color.fromARGB(255, 25, 33, 36),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: HeaderWidget(),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: AltBaslik(
              baslik2: "See all",
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteView(),
                  ),
                );
              },
              baslik1: "Your Notes",
            ),
          ),
          Expanded(child: NoteCard()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: AltBaslik(
              baslik2: "Add",
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddView(),
                  ),
                );
              },
              baslik1: "Invesment portfolio",
            ),
          ),
          Expanded(child: SingleChildScrollView(child: Portfolio())),
        ],
      ),
    );
  }
}








// coins list

/* SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("Coins")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) => CoinScreen(
                          snap: snapshot.data!.docs[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            */




              //fav list

             /* Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("Favorites")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Center(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) => FavoriteScreen(
                          snap: snapshot.data!.docs[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ), */