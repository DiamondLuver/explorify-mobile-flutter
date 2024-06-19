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
  final List<String> _languages = [
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
  List<String> _filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    _filteredLanguages = _languages;
  }

  void _filterLanguages(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredLanguages = _languages;
      } else {
        _filteredLanguages = _languages
            .where((language) =>
                language.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                AppImage.upperStyle), // Ensure AppImage.upperStyle is valid
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAccountAppBar(
                  showBackArrow: true,
                  leadingIconColor: Colors.black,
                  title: Row(
                    children: [
                      Text(
                        "Language",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Combined Search and List Container

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: AppColor.primary),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                size: 17,
                                color: AppColor.primary,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                    onChanged: _filterLanguages,
                                    decoration: const InputDecoration(
                                      hintText: 'Search...',
                                      border: InputBorder.none,
                                      hintStyle:
                                          TextStyle(color: AppColor.midGrey),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 510, // Adjust height as needed
                        child: ListView.builder(
                          itemCount: _filteredLanguages.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_filteredLanguages[index]),
                              onTap: () {
                                print('Selected: ${_filteredLanguages[index]}');
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
