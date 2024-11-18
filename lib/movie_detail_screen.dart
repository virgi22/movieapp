import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieId;

  MovieDetailScreen({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Película'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('movies').doc(movieId).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var movieData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(movieData['image_url']),
                SizedBox(height: 10),
                Text('Título: ${movieData['title']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Año: ${movieData['year']}'),
                Text('Director: ${movieData['director']}'),
                Text('Género: ${movieData['genre']}'),
                SizedBox(height: 10),
                Text('Sinopsis: ${movieData['synopsis']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
