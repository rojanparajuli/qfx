import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qfx/controller/movie_controller.dart';

class MovieScreen extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Screen'),
      ),
      body: movieController.obx((data) {
        if (movieController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (movieController.errorMessage.value.isNotEmpty) {
          return Center(
            child: Text(movieController.errorMessage.value),
          );
        } else {
          return ListView.builder(
            itemCount: data?.results?.length,
            itemBuilder: (context, index) {
              return const ListTile(
              );
            },
          );
        }
      }),
    );
  }
}
