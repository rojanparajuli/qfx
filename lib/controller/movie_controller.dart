import 'package:get/get.dart';
import 'package:qfx/model/movie_model.dart';
import 'package:qfx/service/movies_service.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var movies = <Movie>[].obs;
  var errorMessage = ''.obs;

  final MovieService _movieService = MovieService();

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      final List<Movie> fetchedMovies = await _movieService.fetchMovies();
      movies.assignAll(fetchedMovies);
    } catch (error) {
      errorMessage('Failed to fetch movies: $error');
    } finally {
      isLoading(false);
    }
  }
}
