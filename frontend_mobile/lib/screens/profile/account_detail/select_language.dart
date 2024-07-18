import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/screens/profile/widget/custom_accAppBar.dart';

class UserLanguageScreen extends StatefulWidget {
  const UserLanguageScreen({Key? key}) : super(key: key);

  @override
  State<UserLanguageScreen> createState() => _UserLanguageScreenState();
}

class _UserLanguageScreenState extends State<UserLanguageScreen> {
  final List<String> allSkills = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Korean',
    'Russian',
    'Portuguese',
    'Italian'
  ];

  List<String> filteredSkills = [];
  List<String> selectedSkills = [];
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    filteredSkills = allSkills;
  }

  void updateSearchTerm(String value) {
    setState(() {
      searchTerm = value;
      filteredSkills = allSkills
          .where(
              (skill) => skill.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  void selectSkill(String skill) {
    setState(() {
      if (!selectedSkills.contains(skill)) {
        selectedSkills.add(skill);
      }
    });
  }

  void removeSkill(String skill) {
    setState(() {
      selectedSkills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
              AppImage.upperStyle), // Ensure AppImage.upperStyle is valid
          const CustomAccountAppBar(
            showBackArrow: true,
            leadingIconColor: Colors.black,
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: Text(
                    "Language",
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TextField(
                  onChanged: updateSearchTerm,
                  decoration: InputDecoration(
                    labelText: 'Search skills',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 16.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: selectedSkills
                      .map((skill) => Chip(
                            label: Text(skill),
                            onDeleted: () => removeSkill(skill),
                          ))
                      .toList(),
                ),
                //const SizedBox(height: 16.0),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                itemCount: filteredSkills.length,
                itemBuilder: (context, index) {
                  final skill = filteredSkills[index];
                  return ListTile(
                    title: Text(skill),
                    onTap: () => selectSkill(skill),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Implement save functionality here
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
