import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class LocationController extends GetxController {
  final List<String> cities = [
    'Kathmandu', 'Biratnagar', 'Butwal', 'Nepalgunj', 'Narayangarh', 
    'Birtamod', 'Damauli', 'Itahari', 'Birgunj'
  ];
  
  RxString selectedLocation = 'Select a city'.obs;
  late List<MultiSelectItem<String>> locations;

  @override
  void onInit() {
    super.onInit();
    locations = cities.map((city) => MultiSelectItem<String>(city, city)).toList();
  }

  void updateLocation(String city) {
    selectedLocation.value = city;
  }
}
