import 'package:flutter/material.dart';
import 'package:qfx/model/movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final Result movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movie.title ?? "Movie Details"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 300,
                      color: Colors.grey.shade800,
                      child: const Center(
                          child:
                              Icon(Icons.error, color: Colors.red, size: 100)),
                    );
                  },
                ),
                // Positioned.fill(
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                //     child:
                //         Container(color: Colors.black.withValues(alpha: 0.3)),
                //   ),
                // ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    movie.title ?? "No Title",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black54,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow.shade700, size: 24),
                      const SizedBox(width: 5),
                      Text(
                        "${movie.voteAverage?.toStringAsFixed(1) ?? "N/A"} / 10",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "(${movie.voteCount} votes)",
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Release Date: ${movie.releaseDate?.toLocal().toString().split(' ')[0] ?? "Unknown"}",
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Colors.grey.shade900,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Overview",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            movie.overview ?? "No overview available",
                            style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
