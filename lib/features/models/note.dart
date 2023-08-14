class Note {
  String noteTitle;
  String noteContent;
  SpecialSignature specialSignature;

  Note({
    required this.noteTitle,
    required this.noteContent,
    required this.specialSignature,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      noteTitle: json['noteTitle'],
      noteContent: json['noteContent'],
      specialSignature: SpecialSignature.fromJson(json['specialSignature']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'noteTitle': noteTitle,
      'noteContent': noteContent,
      'specialSignature': specialSignature.toJson(),
    };
  }
}

class SpecialSignature {
  bool favourite;
  bool important;
  List<String> marked;

  SpecialSignature({
    required this.favourite,
    required this.important,
    required this.marked,
  });

  factory SpecialSignature.fromJson(Map<String, dynamic> json) {
    return SpecialSignature(
      favourite: json['favourite'],
      important: json['important'],
      marked: List<String>.from(json['marked']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favourite': favourite,
      'important': important,
      'marked': marked,
    };
  }
}
