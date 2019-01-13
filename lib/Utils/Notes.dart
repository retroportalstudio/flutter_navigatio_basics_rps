
class Notes {
  List<Note> _notes;

  Notes.initializeNotes () {
    _notes = List<Note>();
    _notes.add(Note('Wedding', 'This is some note regarding Wedding',false));
    _notes.add(Note('Office', 'This is some note regarding Office',false));
    _notes.add(Note('Birthday', 'This is some note regarding Birthday',false));
    _notes.add(Note('Holiday', 'This is some note regarding Holiday',false));
    _notes.add(Note('Saturday', 'This is some note regarding Saturday',false));
    _notes.add(Note('Sunday', 'This is some note regarding Sunday',false));
    _notes.add(Note('Work', 'This is some note regarding Work',false));
    _notes.add(Note('Project', 'This is some note regarding Project',false));
  }

  List<Note> get getNotes => _notes;
}


class Note {
  String _title;
  String _noteContent;
  bool _noteRead;

  Note(this._title,this._noteContent,this._noteRead);

  String get getTitle => _title;
  String get getNoteContent => _noteContent;
  bool get getReadState => _noteRead;
  set setReadState(bool readState) => this._noteRead = readState;
}