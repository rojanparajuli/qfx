import 'dart:convert';
import 'package:get/get_connect/connect.dart';
import 'package:qfx/components/api.dart';
import 'package:qfx/model/movie_model.dart';

class MovieService extends GetConnect {
  Future<List<Movie>> fetchMovies() async {
    final String apiUrl = API.baseUrl;

    try {
      final response = await get(apiUrl, headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYmJkMTUwYTA5NTNmOGZjNTU3N2ExMjA3ZTVlMzU0ZCIsInN1YiI6IjY2MjEwOGY3OTYwY2RlMDE0YWE2MDdmZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AA94tDpFTiNAP0ztc0QZByZz_zdVUd7Bk30eimuy5Co"
      });

      print(
          '${response.body}ffffffffffffffffffffffffffffffffffffffffffffffffffff');
      print(response.statusCode);
      print('${response.body}yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<Movie> movies = [];

        for (var movieData in jsonData['results']) {
          Movie movie = Movie(
            page: jsonData['page'],
            results: [],
            totalPages: jsonData['total_pages'],
            totalResults: jsonData['total_results'],
          );

          for (var resultData in movieData['results']) {
            movie.results.add(Result(
              adult: resultData['adult'],
              backdropPath: resultData['backdrop_path'],
              genreIds: List<int>.from(resultData['genre_ids']),
              id: resultData['id'],
              originalLanguage: resultData['original_language'],
              originalTitle: resultData['original_title'],
              overview: resultData['overview'],
              popularity: resultData['popularity'],
              posterPath: resultData['poster_path'],
              releaseDate: DateTime.parse(resultData['release_date']),
              title: resultData['title'],
              video: resultData['video'],
              voteAverage: resultData['vote_average'],
              voteCount: resultData['vote_count'],
            ));
          }

          movies.add(movie);
        }
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
