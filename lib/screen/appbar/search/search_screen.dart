import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qfx/controller/search_controller.dart';
import 'package:qfx/screen/movies/search_movie_detail.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchScreenController searchController = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.grey.shade300,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController.searchController,
                  decoration: const InputDecoration(
                    hintText: 'Movie, Genres, & Languages',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (_) => searchController.searchMovies(),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: searchController.searchMovies,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: searchController.clearSearch,
            child: const Text('CLEAR', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Obx(() {
        if (searchController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (searchController.errorMessage.isNotEmpty) {
          return Center(child: Text(searchController.errorMessage.value));
        }

        if (searchController.searchResults.isEmpty) {
          return const Center(child: Text("Search for movies..."));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.6,
            ),
            itemCount: searchController.searchResults.length,
            itemBuilder: (context, index) {
              final movie = searchController.searchResults[index];
              return GestureDetector(
                onTap: () => Get.to(() => SearchMovieDetailScreen(movie: movie)),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                          child: movie.posterPath != null
                              ? Image.network(
                                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )
                              : Container(
                                  color: Colors.grey.shade300,
                                  child: const Icon(Icons.movie, size: 50),
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.title ?? "Unknown",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
