import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMovieScreen extends StatefulWidget {
  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _synopsisController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  Future<void> _addMovie() async {
    try {
      // Agregar la película a Firestore
      await FirebaseFirestore.instance.collection('movies').add({
        'title': _titleController.text,
        'year': _yearController.text,
        'director': _directorController.text,
        'genre': _genreController.text,
        'synopsis': _synopsisController.text,
        'image_url': _imageUrlController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Película agregada correctamente'),
      ));

      // Limpiar los campos después de agregar la película
      _titleController.clear();
      _yearController.clear();
      _directorController.clear();
      _genreController.clear();
      _synopsisController.clear();
      _imageUrlController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error al agregar película'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Película'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Título')),
            TextField(controller: _yearController, decoration: InputDecoration(labelText: 'Año')),
            TextField(controller: _directorController, decoration: InputDecoration(labelText: 'Director')),
            TextField(controller: _genreController, decoration: InputDecoration(labelText: 'Género')),
            TextField(controller: _synopsisController, decoration: InputDecoration(labelText: 'Sinopsis')),
            TextField(controller: _imageUrlController, decoration: InputDecoration(labelText: 'URL de la Imagen')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addMovie,
              child: Text('Guardar Película'),
            ),
          ],
        ),
      ),
    );
  }
}
