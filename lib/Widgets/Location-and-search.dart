import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:untitled1/Screens/Details-Screen.dart';
import 'package:untitled1/models/Coffe-Model.dart';
import '../Services/Coffe_Services.dart';
import '../colors.dart';
import '_buildLocationInfo.dart';
import 'buildSearchBar.dart';

class LocationContainer extends StatefulWidget {
  const LocationContainer({super.key});

  @override
  State<LocationContainer> createState() => _LocationContainerState();
}

class _LocationContainerState extends State<LocationContainer> {
  final TextEditingController _searchController = TextEditingController();
  final CoffeServices coffeeService = CoffeServices(dio: Dio());

  List<CoffeeModel> _coffeeList = [];
  List<CoffeeModel> _filteredList = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchCoffeeData();
    _searchController.addListener(_filterCoffeeList);
  }

  Future<void> _fetchCoffeeData() async {
    try {
      List<CoffeeModel> data = await coffeeService.getCoffe(category: "All Coffee");
      setState(() {
        _coffeeList = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  void _filterCoffeeList() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      if (searchText.isEmpty) {
        _filteredList = [];
      } else {
        _filteredList = _coffeeList
            .where((coffee) => coffee.name.toLowerCase().contains(searchText))
            .toList();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      decoration: buildGradientBackground(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildLocationInfo(context: context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: buidlSearchBar(searchController: _searchController,),
              ),
            ],
          ),
          if (_filteredList.isNotEmpty) _buildSearchResults(),
        ],
      ),
    );
  }
  Widget _buildSearchResults() {
    return Positioned(
      top: 0, // Ensures results appear above search bar
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 70, // Fixed height for results container
          decoration: BoxDecoration(
            color: const Color(0xff3a3a3a),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: _filteredList.map((coffee) => _buildCoffeeItem(coffee)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeItem(CoffeeModel coffee) {
    return ListTile(
      leading: Image.network(coffee.image, width: 40, height: 40, fit: BoxFit.cover),
      title: Text(coffee.name, style: const TextStyle(color: Colors.white)),
      subtitle: Text("\$${coffee.price}", style: const TextStyle(color: Colors.grey)),
      onTap: () {
        _searchController.text = coffee.name;
        setState(() {
          _filteredList = [];
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>CoffeDetails(coffe: coffee)));// Hide results after selection
        });
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
