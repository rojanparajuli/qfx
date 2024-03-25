import 'package:flutter/material.dart';
import 'package:qfx/const/colors.dart';

class MovieTab extends StatefulWidget {
  const MovieTab({super.key});

  @override
  State<MovieTab> createState() => _MovieTabState();
}
late TabController tabController;

class _MovieTabState extends State<MovieTab> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);

  }

  Future _refresh() async {

  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _refresh,
        child: Column(
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
            const SizedBox(height: 5,),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  // Now Showing ko items
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                           alignment: const FractionalOffset(0.1, 0.4),
                          child: const Text(
                            'Now Showing >',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 200,
                              height: 240,
                              color: Colors.black,
                            ),
                            Container(
                              width: 200,
                              height: 240,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 200,
                              height: 240,
                              color: Colors.black,
                            ),
                            Container(
                              width: 200,
                              height: 240,
                              color: Colors.black,
                            ),
                            
                          ],
                        ),
                        
                        const SizedBox(height: 20,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                              Container(
                              width: 200,
                              height: 240,
                              color: Colors.black,
                            ),
                            Container(
                              width: 200,
                              height: 240,
                              color: Colors.black,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Coming soon ko items
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // const Text(
                        //   'Coming Soon Content',
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 5,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
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
                            Container(
                              width: 200,
                              height: 240,
                              color: Colors.cyan,
                            ),
                            // Container(
                            //   width: 100,
                            //   height: 100,
                            //   color: Colors.deepOrange,
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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