import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/Notes.dart';

class DetailedNote extends StatefulWidget {
  Note selectedNote;

  DetailedNote(this.selectedNote);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailedNoteState(selectedNote);
  }
}

class DetailedNoteState extends State<DetailedNote> {
  Note selectedNote;

  DetailedNoteState(this.selectedNote);

  _handleReadCheckbox(bool readStatus) {
    this.setState(() {
      selectedNote.setReadState = readStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedNote.getTitle),
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context,selectedNote.getReadState);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                selectedNote.getNoteContent,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Read?',
                  style: TextStyle(fontSize: 20.0),
                ),
                Checkbox(
                    value: selectedNote.getReadState,
                    onChanged: _handleReadCheckbox)
              ],
            )
          ],
        ),
      ),
    );
  }
}
