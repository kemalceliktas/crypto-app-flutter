import 'package:flutter/material.dart';

import 'components/notes_card.dart';



class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:NoteCard()
    );
  }
}

