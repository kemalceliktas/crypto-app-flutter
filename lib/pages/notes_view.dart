import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_crypto_app/authfirebase/flutterfire.dart';
import 'package:my_first_crypto_app/globalconst/global_const.dart';
import 'package:my_first_crypto_app/widgets/components/note_view_card.dart';
import 'package:my_first_crypto_app/widgets/components/notes_card.dart';
import 'package:my_first_crypto_app/widgets/notes_view.dart';
import 'package:uuid/uuid.dart';


class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  TextEditingController _noteController = TextEditingController();
  TextEditingController _noteTitle = TextEditingController();
 

  @override
  void dispose() {
    // TODO: implement dispose
    _noteController.dispose();
    _noteTitle.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
     var uuid = Uuid();

  // Generate a v1 (time-based) id
  var v1=uuid.v1().toString();
    return Scaffold(
     
       backgroundColor: Color.fromARGB(255, 25, 33, 36),
       primary: true,
       
      appBar: AppBar(
         iconTheme: IconThemeData(
    color: Colors.white, //change your color here
  ),
        title: Text("Notes View",style: TextStyle(color: Colors.white),),
        
        backgroundColor: Color.fromARGB(255, 25, 33, 36),
        elevation: 0,
        
      ),
      body: Container(
        padding: EdgeInsets.all(PageSize.width20,),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              
              controller: _noteTitle,
              decoration: InputDecoration(
              hintText: "Your notes title here...",hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),),
              
              
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              focusColor: Colors.white,
              border: OutlineInputBorder(
                
                
                borderRadius: BorderRadius.circular(50)
                
              ),
            ),
            ),
            SizedBox(height: PageSize.height20,),
               TextFormField(
                maxLines: 5,
              controller: _noteController,
              decoration: InputDecoration(
              hintText: "Your notes here...",
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),),
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            ),
            SizedBox(height: PageSize.height20,),
            Center(
              child: TextButton(onPressed: ()async{
          
        
               await addNote(v1, _noteTitle.text, _noteController.text);
               _noteController.clear();
               _noteTitle.clear();
               setState(() {
                 
               });
              }, child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.amber,width: 1.5)
                ),
                child: Text("Save Your Note",style: TextStyle(color: Colors.amber[800],fontSize: 17,fontWeight: FontWeight.bold),)),),
            ),



           Expanded(child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Notes").snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return Column(
                       
                        children: snapshot.data!.docs
                            .map((item){
                              return noteCard((){}, item);
                            })
                            .toList(),
                      );
                    }
                    return Text(
                      "ther's no Notes",
                    
                    );
                  },
                ),),
          ],
        ),
      ),
    );
  }
}