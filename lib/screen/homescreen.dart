import 'package:flutter/material.dart';
import 'package:qfx/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? _selectedCity;

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.scaffoldDarkBack,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png',
            height: 80,
            width: 80,
          ),
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
    );
  }
}
