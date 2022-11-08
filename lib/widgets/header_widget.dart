import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/add_view.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  int total = 0;

  



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
    stream: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Coins").snapshots(),

      builder: (ontext, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

        //ÖNEMLİİİİİ
        
        getTotal(){
          for (var element in snapshot.data!.docs) {
        setState(() {
           total+=double.parse(element["Amount"].toString()).toInt();
        });
         print(total.toString());
         
        }
        return total;
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Text(
                "Hello Ali",
                style: TextStyle(
                    color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 65, 70, 90).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundImage:
                                  AssetImage("assets/images/profile_pic.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "YOUR BALANCE",
                              style: TextStyle(color: Colors.amber[800]),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "\$23.983.221",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                       
                      },
                      child: Icon(
                        Icons.arrow_right_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
