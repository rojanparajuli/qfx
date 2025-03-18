import 'package:get/get_connect/connect.dart';
import 'package:qfx/constant/api.dart';
import 'package:qfx/constant/token.dart';
import 'package:qfx/model/movie_model.dart';

class MovieService extends GetConnect {
  Future<List<Result>> fetchMovies() async {
    const String apiUrl = "${API.baseUrl}/popular";

    try {
      final response = await get(apiUrl,
          headers: {"Authorization": "Bearer ${RequestToken.bearerToken}"});

      if (response.statusCode == 200) {
        if (response.body['results'] == null) {
          throw Exception("Invalid API response format");
        }

        List<Result> movies =
            response.body['results'].map<Result>((resultData) {
          return Result(
            adult: resultData['adult'],
            backdropPath: resultData['backdrop_path'],
            genreIds: List<int>.from(resultData['genre_ids']),
            id: resultData['id'],
            originalLanguage: resultData['original_language'],
            originalTitle: resultData['original_title'],
            overview: resultData['overview'],
            popularity: resultData['popularity'],
            posterPath: resultData['poster_path'],
            releaseDate: resultData['release_date'] != null
                ? DateTime.tryParse(resultData['release_date'])
                : null,
            title: resultData['title'],
            video: resultData['video'],
            voteAverage: resultData['vote_average']?.toDouble() ?? 0.0,
            voteCount: resultData['vote_count'] ?? 0,
          );
        }).toList();

        return movies;
      } else {
        throw Exception('API Error: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
