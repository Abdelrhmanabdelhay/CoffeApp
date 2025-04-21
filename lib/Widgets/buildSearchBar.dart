import 'package:flutter/material.dart';
class buidlSearchBar extends StatefulWidget {
   buidlSearchBar({super.key,required this.searchController});
   TextEditingController searchController = TextEditingController();

  @override
  State<buidlSearchBar> createState() => _buidlSearchBarState();
}

class _buidlSearchBarState extends State<buidlSearchBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: const Color(0xff2a2a2a),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Image.network("assets/coffee-shop/ic_search.png", height: 25, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: widget.searchController,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search for coffee",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
          if (widget.searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                widget.searchController.clear();
                setState(() {}); // Refresh UI
              },
            ),
        ],
      ),
    );
  }
}

