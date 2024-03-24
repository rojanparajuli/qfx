// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
// import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
// import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:qfx/const/colors.dart';
import 'package:qfx/screen/appbar/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> cities = [
  'Kathmandu',
  'Biratnagar',
  'Butwal',
  'Nepalgunj',
  'Narayangarh',
  'Birtamod',
  'Damauli',
  'Itahari',
  'Birgunj'
];
TextEditingController cityController = TextEditingController();

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  void showMultiSelect(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectChipDisplay(
          items: _items,
          // initialValue: _selectedCity,
          // onConfirm: (values) {
          //   print(values);
          // },
        );
      },
    );
  }

  final _items =
      cities.map((city) => MultiSelectItem<String>(city, city)).toList();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    // Implement your refresh logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        child: Column(
          children: [],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 100,
        backgroundColor: CustomColors.scaffoldDarkBack,
        leading: Image.asset(
          'assets/logo.png',
          height: 100,
          width: 100,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                readOnly: true,
                controller: cityController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Locations',
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color.fromARGB(255, 22, 22, 22),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 160,
                                      child: MultiSelectChipDisplay<String>(
                                        chipColor: Colors.grey[50],
                                        textStyle: const TextStyle(
                                            color: Colors.black),
                                        items: _items,
                                        onTap: (values) {
                                          print(values);
                                          setState(() {
                                            cityController.text = values;
                                          });
                                          Future.delayed(
                                              const Duration(milliseconds: 200),
                                              () {
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
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
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Now Showing ko items
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Now Showing >',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        Row(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 200,
                              height: 300,
                              color: Colors.red,
                            ),
                            Container(
                              width: 200,
                              height: 300,
                              color: Colors.green,
                            ),
                            // Container(
                            //   width: 100,
                            //   height: 100,
                            //   color: Colors.blue,
                            // ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 200,
                              height: 300,
                              color: Colors.orange,
                            ),
                            Container(
                              width: 200,
                              height: 300,
                              color: Colors.purple,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Coming soon ko items
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Coming Soon Content',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.yellow,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.cyan,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.deepOrange,
                            ),
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
      ),
    bottomNavigationBar: const DefaultTabController(
  length: 3,
  child: Material(
    color: CustomColors.scaffoldDarkBack,
    child: TabBar(
      labelStyle: TextStyle(color: Colors.white),
      tabs: [
        Tab(
          icon: Icon(Icons.movie),
          text: 'Movies',
        ),
        Tab(
          icon: Icon(Icons.loyalty_rounded),
          text: 'My Loyalty',
        ),
        Tab(
          icon: Icon(Icons.person),
          text: 'Profile',
        ),
      ],
    ),
  ),
)
    );
  }
    }
