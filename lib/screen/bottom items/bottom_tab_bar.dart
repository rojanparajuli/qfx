import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qfx/controller/movie_controller.dart';
import 'package:qfx/screen/movies/comming_soon_tab.dart';
import 'package:qfx/screen/movies/now_showing_tab.dart';

class MovieTab extends StatelessWidget {
  MovieTab({super.key});

  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const AppTabBar(),
          const SizedBox(height: 5),
          Expanded(
            child: TabBarView(
              children: [
                NowShowingTab(movieController: movieController),
                const ComingSoonTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: Colors.black,
      labelStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      tabs: [
        Tab(text: 'Now Showing'),
        Tab(text: 'Coming Soon'),
      ],
    );
  }
}