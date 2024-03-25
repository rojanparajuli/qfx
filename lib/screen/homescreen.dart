// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:qfx/const/colors.dart';
import 'package:qfx/screen/appbar/search_screen.dart';
import 'package:qfx/screen/bottom_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
  late List<MultiSelectItem<String>> _items;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _items = cities
        .map((city) => MultiSelectItem<String>(city, city))
        .toList();
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
          children: [

          ],
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
      body: TabBarView(
        controller: _tabController,
        children: [
          MovieTab(),
          Container(),
          Container(),

        ],
      ),
      bottomNavigationBar: Material(
        color: CustomColors.scaffoldDarkBack,
        child: TabBar(
          controller: _tabController,
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
    );
  }
}
