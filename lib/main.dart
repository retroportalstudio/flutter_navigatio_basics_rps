import 'package:flutter/material.dart';
import 'package:flutter_app/DetailedNote.dart';
import 'package:flutter_app/Utils/Notes.dart';

void main(){
  runApp(MaterialApp(
    title: 'Notes',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }

}

class HomeScreenState extends State<HomeScreen>{

  List<Note> _notes;

  HomeScreenState(){
    _notes = Notes.initializeNotes().getNotes;
  }

  _handleDetailedViewData(int index) async {
    bool data = await Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedNote(_notes[index])));
    this.setState((){
      _notes[index].setReadState = data;
    });
  }

  _handleIconDisplay(int index){
    bool readStatus = _notes[index].getReadState;
    return Icon((readStatus? Icons.check_circle:Icons.remove_circle),color: (readStatus)?Colors.green:Colors.red,);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context,index){
        return Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color:Colors.grey,width: 1.0))
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_notes[index].getTitle),
                _handleIconDisplay(index)
              ],
            ),
            onTap: (){
            _handleDetailedViewData(index);
            },
          ),
        );
      }),
    );
  }

}