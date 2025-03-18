import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qfx/model/search_model.dart';
import 'package:qfx/service/search_service.dart';

class SearchScreenController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final SearchService _movieService = SearchService();

  var isLoading = false.obs;
  var searchResults = <Result>[].obs;
  var errorMessage = ''.obs;

  void clearSearch() {
    searchController.clear();
    searchResults.clear();
    errorMessage.value = '';
  }

  Future<void> searchMovies() async {
    String query = searchController.text.trim();
    if (query.isEmpty) {
      errorMessage.value = "Please enter a search query.";
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _movieService.searchMovies(query);
      if (response != null && response.results != null) {
        searchResults.assignAll(response.results!);
      } else {
        errorMessage.value = "No results found.";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
