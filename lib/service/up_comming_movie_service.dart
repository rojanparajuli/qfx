import 'package:get/get_connect/connect.dart';
import 'package:qfx/constant/api.dart';
import 'package:qfx/constant/token.dart';
import 'package:qfx/model/up_comming_model.dart';

class UpCommingMovieService extends GetConnect {
  final String apiKey = RequestToken.bearerToken;

  Future<UpCommingModel?> fetchUpcomingMovies() async {
    final response = await get(
      "${API.baseUrl}/upcoming",
      headers: {"Authorization": "Bearer $apiKey"},
    );

    if (response.statusCode == 200) {
      if (response.body != null) {
        return UpCommingModel.fromJson(response.body);
      } else {
        return Future.error("No data received from the API");
      }
    } else {
      return Future.error(
          "Error ${response.statusCode}: ${response.statusText ?? 'Something went wrong'}");
    }
  }
}
