import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qfx/screen/movies/upcomming_detail_screen.dart';
import '../../controller/upcoming_movies_controller.dart';

class ComingSoonTab extends StatelessWidget {
  const ComingSoonTab({super.key});

  @override
  Widget build(BuildContext context) {
    final UpcomingMoviesController movieController =
        Get.put(UpcomingMoviesController());

    return Obx(() {
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
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
                  var movie = movies[index];



          return GestureDetector(
            onTap: () {
             Get.to(()=>UpcomingMovieDetailScreen(movie: movie));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, color: Colors.red);
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      movie.title ?? "No Title",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}