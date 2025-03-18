import 'package:get/get.dart';
import 'package:qfx/constant/api.dart';
import 'package:qfx/constant/token.dart';
import 'package:qfx/model/search_model.dart';

class SearchService extends GetConnect {
  final String apiKey = RequestToken.bearerToken;

  @override
  void onInit() {
    httpClient.baseUrl = "${API.search}/search/movie";
    super.onInit();
  }

  Future<SearchResponseModel?> searchMovies(String query) async {
    final uri = Uri.parse("${API.search}/search/movie").replace(
      queryParameters: {"query": query},
    );

    final response = await get(
      uri.toString(),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
    );
      print("Error: ${response.statusCode} - ${response.bodyString}");

    if (response.status.hasError) {
      print("Error: ${response.statusCode} - ${response.bodyString}");
      return null;
    }

    if (response.bodyString != null) {
      return searchResponseModelFromJson(response.bodyString!);
    }
    return null;
  }
}
