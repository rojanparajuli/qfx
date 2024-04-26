import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qfx/components/api.dart';
import 'package:qfx/components/colors.dart';
import 'package:qfx/screen/movies/movie_screen.dart';

import '../../controller/movie_controller.dart';

class MovieTab extends StatefulWidget {
  const MovieTab({Key? key}) : super(key: key);

  @override
  State<MovieTab> createState() => _MovieTabState();
}

late TabController tabController;

class _MovieTabState extends State<MovieTab>
    with SingleTickerProviderStateMixin {
  MovieController movieController = Get.put(MovieController());
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _refresh() async {}

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
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
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
                movieController.obx(
                  (data) => Column(
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
                      Flexible(
                  
                        // width: 500,
                        // height: MediaQuery.of(context).size.height-100,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                3, 
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.65

                          ),
                          itemCount: data?.results?.length ?? 0,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Get.to(() => MovieScreen());
                            },
                            child: Stack(
                              children: [
                                
                                Image.network(
                                    '${API.imageUrl}${data!.results![index].posterPath}', fit: BoxFit.fitWidth,),
                                Text(
                                  data.results![index].title ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
