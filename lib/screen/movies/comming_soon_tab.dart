import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/upcoming_movies_controller.dart';

class ComingSoonTab extends StatelessWidget {
  const ComingSoonTab({super.key});

  @override
  Widget build(BuildContext context) {
    final UpcomingMoviesController movieController =
        Get.put(UpcomingMoviesController());

    return Obx(
      () {
        if (movieController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (movieController.hasError.value) {
          return const Center(child: Text("Failed to load movies"));
        }

        if (movieController.upcomingMovies.value.results == null ||
            movieController.upcomingMovies.value.results!.isEmpty) {
          return const Center(child: Text("No movies available"));
        }

        var movies = movieController.upcomingMovies.value.results!;

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            var movie = movies[index];

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                      child: movie.posterPath != null
                          ? Image.network(
                              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                              fit: BoxFit.cover,
                            )
                          : const Placeholder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      movie.title ?? "Untitled",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
