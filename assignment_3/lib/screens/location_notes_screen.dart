import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../models/note.dart';
import '../services/database_helper.dart';

class LocationNotesScreen extends StatefulWidget {
  const LocationNotesScreen({super.key});

  @override
  State<LocationNotesScreen> createState() => _LocationNotesScreenState();
}

class _LocationNotesScreenState extends State<LocationNotesScreen> {
  final List<Note> _notes = [];
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await _dbHelper.getNotes();
    setState(() {
      _notes.clear();
      _notes.addAll(notes);
    });
  }

  void _addNote() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    XFile? image;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Location Name'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final picker = ImagePicker();
                    image = await picker.pickImage(source: ImageSource.gallery);
                  },
                  child: const Text('Add Picture'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final description = descriptionController.text.trim();

                    if (name.isEmpty || description.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('All fields are required')),
                      );
                      return;
                    }

                    final newNote = Note(
                      name: name,
                      description: description,
                      imagePath: image?.path,
                    );
                    await _dbHelper.insertNote(newNote);
                    _loadNotes();
                    // Navigator.of(ctx).pop();
                  },
                  child: const Text('Add Note'),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  void _editNote(int index) {
    final TextEditingController nameController =
        TextEditingController(text: _notes[index].name);
    final TextEditingController descriptionController =
        TextEditingController(text: _notes[index].description);
    String? imagePath = _notes[index].imagePath;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Location Name'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      imagePath = image.path;
                    }
                  },
                  child: const Text('Update Picture'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final description = descriptionController.text.trim();

                    if (name.isEmpty || description.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('All fields are required')),
                      );
                      return;
                    }

                    final updatedNote = Note(
                      id: _notes[index].id,
                      name: name,
                      description: description,
                      imagePath: imagePath,
                    );
                    await _dbHelper.updateNote(updatedNote);
                    _loadNotes();
                  },
                  child: const Text('Update Note'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _deleteNoteImage(int index) async {
    final updatedNote = Note(
      id: _notes[index].id,
      name: _notes[index].name,
      description: _notes[index].description,
      imagePath: null,
    );
    await _dbHelper.updateNote(updatedNote);
    _loadNotes();
  }

  void _deleteNote(int index) async {
    await _dbHelper.deleteNote(_notes[index].id!);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Notes')),
      body: _notes.isEmpty
          ? const Center(child: Text('No notes added yet.'))
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(_notes[index].name),
                    subtitle: Text(_notes[index].description),
                    leading: _notes[index].imagePath != null
                        ? Image.file(
                            File(_notes[index].imagePath!),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.location_on),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editNote(index),
                          tooltip: "Edit Note",
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteNoteImage(index),
                          tooltip: "Remove Image Only",
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_forever),
                          onPressed: () => _deleteNote(index),
                          tooltip: "Delete Note",
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
