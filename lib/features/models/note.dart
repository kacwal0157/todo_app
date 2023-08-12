class Note {
  String noteTitle;
  String noteContent;

  Note({
    required this.noteTitle,
    required this.noteContent,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      noteTitle: json['noteTitle'],
      noteContent: json['noteContent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'noteTitle': noteTitle,
      'noteContent': noteContent,
    };
  }
}
