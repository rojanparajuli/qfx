import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qfx/components/colors.dart';
import 'package:qfx/screen/movies/movie_screen.dart';

class MovieTab extends StatefulWidget {
  const MovieTab({super.key});

  @override
  State<MovieTab> createState() => _MovieTabState();
}

late TabController tabController;

class _MovieTabState extends State<MovieTab>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Future _refresh() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            indicatorColor: Colors.black,
            labelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(
                text: 'Now Showing',
              ),
              Tab(
                text: 'Coming Soon',
              ),
            ],
            controller: tabController,
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: const FractionalOffset(0.1, 0.4),
                        child: const Text(
                          'Now Showing >',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 500,
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Get.to(() => MovieScreen());
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 150,
                              height: 200,
                              color: const Color.fromARGB(255, 8, 6, 6),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 200,
                            height: 240,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: <Widget>[
              BottomAppBar(
                color: CustomColors.scaffoldDarkBack,
              )
            ],
          )
        ],
      ),
    );
  }
}
