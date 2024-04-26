import 'package:get/get.dart';
import 'package:qfx/model/movie_model.dart';
import 'package:qfx/service/movies_service.dart';

class MovieController extends GetxController with StateMixin<Movie> {
  var isLoading = true.obs;
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
      final response = await _movieService.fetchMovies();
      if ( response != null) {
        change(response, status: RxStatus.success());

      } else {
        change(null, status: RxStatus.error());
      }
    } catch (error) {
      errorMessage('Failed to fetch movies: $error');
    } finally {
      isLoading(false);
    }
  }
}
