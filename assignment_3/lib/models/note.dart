class Note {
  int? id; // Add an ID for database purposes
  String name;
  String description;
  String? imagePath;

  Note({
    this.id,
    required this.name,
    required this.description,
    this.imagePath,
  });

  // Convert a Note to a Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
    };
  }

  // Create a Note from a Map retrieved from the database
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imagePath: map['imagePath'],
    );
  }
}
