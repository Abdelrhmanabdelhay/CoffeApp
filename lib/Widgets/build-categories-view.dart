import 'package:flutter/material.dart';
import 'package:untitled1/colors.dart';

class CategoriesView extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategoriesView({super.key, required this.onCategorySelected});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final List<String> categories = ["All Coffee", "Macchiato", "Latte", "Americano"];
  int selectedIndex = 0; // Track selected index

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31, // Adjust height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onCategorySelected(categories[index]);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: isSelected ? xprimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Text(
                categories[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black54,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
