import 'package:get/get.dart';
import 'package:qfx/model/up_comming_model.dart';
import 'package:qfx/service/up_comming_movie_service.dart';

class UpcomingMoviesController extends GetxController {
  final UpCommingMovieService movieService = UpCommingMovieService();
  var upcomingMovies = UpCommingModel().obs;
  var isLoading = false.obs;
  var hasError = false.obs;
  var movies = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var movies = await movieService.fetchUpcomingMovies();
      if (movies != null) {
        upcomingMovies.value = movies;
        hasError(false);
      } else {
        hasError(true);
      }
    } catch (e) {
      hasError(true);
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
