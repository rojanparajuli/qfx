import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:qfx/components/colors.dart';
import 'package:qfx/controller/movie_controller.dart';
import 'package:qfx/screen/appbar/Drawer_items/drawer.dart';
import 'package:qfx/screen/appbar/search/search_screen.dart';
import 'package:qfx/screen/bottom%20items/bottom_tab_bar.dart';
// import 'package:qfx/screen/splash/loyality.dart';
import 'package:qfx/screen/profile/profile.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
final MovieController movieController =
      Get.put(MovieController());}

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
    _items = cities.map((city) => MultiSelectItem<String>(city, city)).toList();
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.index == 1) {
      // Show warning dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          titlePadding: EdgeInsets.zero,
          title: Container(alignment: Alignment.center, decoration:const BoxDecoration(color: CustomColors.lightblue ),child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("My Loyality", style: TextStyle(color: Colors.white),),
          ),
          ),
          content: const Text("Please Login/sign-up \n for club OFX point"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _tabController.index = 0;
                });
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 80,
        backgroundColor: CustomColors.scaffoldDarkBack,
        leading: Image.asset(
          'assets/logo.png',
          height: 100,
          width: 80,
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
                  contentPadding: const EdgeInsets.all(5),
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
                                      color: Colors.black,
                                    ),
                                    items: _items,
                                    onTap: (values) {
                                      print(values);
                                      setState(() {
                                        cityController.text =
                                            values.toString();
                                      });
                                      Future.delayed(
                                        const Duration(milliseconds: 200),
                                        () {
                                          Navigator.pop(context);
                                        },
                                      );
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
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const SearchScreen());
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MovieTab(),
           MovieTab(),
          // LoyalityScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Material(
        color: CustomColors.scaffoldDarkBack,
        child: TabBar(
          controller: _tabController,
          labelStyle: const TextStyle(color: Colors.white),
          tabs: const [
            Tab(
              icon: Icon(Icons.local_movies),
              text: 'Movies',
            ),
            Tab(
              icon: Icon(Icons.loyalty),
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
