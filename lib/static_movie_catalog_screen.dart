import 'package:flutter/material.dart';
import 'detalles_pelicula.dart'; // Ruta corregida

class StaticMovieCatalogScreen extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      'title': 'The Matrix',
      'year': '1999',
      'director': 'The Wachowskis',
      'genre': 'Science Fiction',
      'synopsis': 'A computer hacker learns about the true nature of reality and his role in the war against its controllers.',
      'image': 'assets/images/matrix.jpg',
    },
    {
      'title': 'Batman',
      'year': '2022',
      'director': 'Matt Reeves',
      'genre': 'Action, Crime, Drama',
      'synopsis': 'A young Bruce Wayne uncovers corruption in Gotham City that connects to his own family while facing the serial killer, The Riddler.',
      'image': 'assets/images/batman.jpg',
    },
    {
      'title': 'Venom',
      'year': '2018',
      'director': 'Ruben Fleischer',
      'genre': 'Action, Sci-Fi, Thriller',
      'synopsis': 'Journalist Eddie Brock is trying to take down Carlton Drake, the notorious founder of the Life Foundation, when he becomes Venom, a parasitic anti-hero.',
      'image': 'assets/images/venom.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Películas'),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dos columnas
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6, // Relación ajustada para un diseño vertical
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallesPelicula(movie: movie),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.asset(
                        movie['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie['title']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Año: ${movie['year']}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Género: ${movie['genre']}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
