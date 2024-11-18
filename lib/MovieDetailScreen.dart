import 'package:flutter/material.dart';

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
          childAspectRatio: 0.6,  // Ajustamos la relación para que sea más alargado verticalmente
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            elevation: 4,  // Sombra para el Card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),  // Bordes redondeados
            ),
            child: InkWell(
              onTap: () {
                // Al hacer clic, navegar a la pantalla de detalles de la película
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(movie: movie),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity, // La imagen ocupa todo el ancho disponible
                    height: 200, // Establecemos una altura controlada para la imagen
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
                        fit: BoxFit.cover, // Aseguramos que la imagen cubra todo el espacio disponible
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

class MovieDetailScreen extends StatelessWidget {
  final Map<String, String> movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']!),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen de la película
            Center(
              child: Image.asset(
                movie['image']!,
                width: 300,
                height: 450,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // Título de la película
            Text(
              movie['title']!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Año de la película
            Text(
              'Año: ${movie['year']}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),

            // Director de la película
            Text(
              'Director: ${movie['director']}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),

            // Género de la película
            Text(
              'Género: ${movie['genre']}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),

            // Sinopsis de la película
            Text(
              'Sinopsis: ${movie['synopsis']}',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
