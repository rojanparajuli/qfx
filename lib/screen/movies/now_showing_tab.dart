import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qfx/controller/movie_controller.dart';
import 'package:qfx/screen/movies/movie_detail_screen.dart';

class NowShowingTab extends StatelessWidget {
  final MovieController movieController;

  const NowShowingTab({super.key, required this.movieController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (movieController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (movieController.errorMessage.isNotEmpty) {
        return Center(child: Text(movieController.errorMessage.value));
      }

      return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: movieController.movies.length,
        itemBuilder: (context, index) {
          var movie = movieController.movies[index];

          return GestureDetector(
            onTap: () {
              Get.to(() => MovieDetailScreen(movie: movie,));
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
