import 'package:flutter/material.dart';
import 'package:untitled1/Screens/Details-Screen.dart';
import 'package:untitled1/Widgets/Coffe-Card.dart';
import 'package:untitled1/Widgets/build-categories-view.dart';
import 'package:dio/dio.dart';
import 'package:untitled1/models/Coffe-Model.dart';

import '../Services/Coffe_Services.dart';

class CoffeView extends StatefulWidget {
  CoffeView({super.key});

  @override
  State<CoffeView> createState() => _CoffeViewState();
}

class _CoffeViewState extends State<CoffeView> {
  String selectedCategory = "All Coffee";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Column(
        children: [
          CategoriesView(
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FutureBuilder<List<CoffeeModel>>(
                future: CoffeServices(dio: Dio()).getCoffe(category: selectedCategory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    print('Error loading coffee data: ${snapshot.error}');
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Error loading data"),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No coffee available"));
                  }
                  final coffeeList = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7, // Adjust for image proportions
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: coffeeList.length,
                    itemBuilder: (context, index) {
                      final coffee = coffeeList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CoffeDetails(coffe: coffee),
                            ),
                          );
                        },
                        child: CoffeContainer(coffeeModel: coffee),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
