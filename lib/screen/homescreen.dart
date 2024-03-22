import 'package:flutter/material.dart';
import 'package:qfx/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
  String? _selectedCity;

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
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: CustomColors.scaffoldDarkBack,
        leading: Image.asset(
          'assets/logo.png',
          height: 100, 
          width: 100, 
        ),
        title: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            filled: true,
            fillColor: Colors.black,
            hintText: 'Select Location',
            prefixIcon: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          ),
          value: _selectedCity,
          onChanged: (String? newValue) {
            setState(() {
              _selectedCity = newValue;
            });
          },
          items: cities.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: _selectedCity == value ? Colors.white : Colors.black,
                  ),
                ));
          }).toList(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'Now Showing'),
                Tab(text: 'Coming Soon'),
              ],
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // Now showing ko items
                  Center(
                    child: Text('Now Showing Content'),
                  ),
                  // Coming soon ko items
                  Center(
                    child: Text('Coming Soon Content'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
