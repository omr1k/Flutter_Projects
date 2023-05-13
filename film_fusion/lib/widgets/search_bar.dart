import 'package:flutter/material.dart';

class RoundedSearchBar extends StatefulWidget {
  @override
  _RoundedSearchBarState createState() => _RoundedSearchBarState();
}

class _RoundedSearchBarState extends State<RoundedSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey[300],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _searchController.clear();
                  _isSearching = false;
                  FocusScope.of(context).unfocus();
                });
              },
              icon: Icon(_isSearching ? Icons.clear : Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
