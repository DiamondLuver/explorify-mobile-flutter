import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class SearchDropdown extends StatefulWidget {
  final List<String> techSkills;
  final List<String> softSkills;
  final Function(List<String>) onItemsSelected;

  const SearchDropdown({
    required this.techSkills,
    required this.softSkills,
    required this.onItemsSelected,
    Key? key,
  }) : super(key: key);

  @override
  _SearchDropdownState createState() => _SearchDropdownState();
}

class _SearchDropdownState extends State<SearchDropdown> {
  TextEditingController searchController = TextEditingController();
  List<String> filteredTechSkills = [];
  List<String> filteredSoftSkills = [];
  List<String> selectedPreferences = [];

  @override
  void initState() {
    super.initState();
    filteredTechSkills = widget.techSkills;
    filteredSoftSkills = widget.softSkills;
    searchController.addListener(_filterLists);
  }

  void _filterLists() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredTechSkills = widget.techSkills
          .where((skill) => skill.toLowerCase().contains(query))
          .toList();
      filteredSoftSkills = widget.softSkills
          .where((skill) => skill.toLowerCase().contains(query))
          .toList();
    });
  }

  void _selectItem(String preference) {
    setState(() {
      if (!selectedPreferences.contains(preference)) {
        if (selectedPreferences.length < 10) {
          selectedPreferences.add(preference);
        }
      } else {
        selectedPreferences.remove(preference);
      }
      widget.onItemsSelected(selectedPreferences);
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterLists);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search for skills',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (searchController.text.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdown("Tech", filteredTechSkills),
              const SizedBox(height: 8),
              _buildDropdown("Soft Skills", filteredSoftSkills),
            ],
          ),
      ],
    );
  }

  Widget _buildDropdown(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          // runSpacing: 8.0,
          children: items.map((item) {
            return GestureDetector(
              onTap: () {
                _selectItem(item);
                searchController.clear();
              },
              child: Chip(
                label: Text(item),
                backgroundColor: AppColor.primary.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: AppColor.primary),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
