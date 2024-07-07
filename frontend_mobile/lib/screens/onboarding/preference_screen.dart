import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/onboarding/widget/search_drop_down.dart';
import 'package:frontend_mobile/screens/onboarding/widget/skill_custom_app_bar.dart';
import 'package:frontend_mobile/common/skill_list.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  List<String> preferenceList = SkillList.preferenceList;

  List<String> softSkillList = SkillList.softSkillList;

  Set<int> selectedIndexes = {};
  Set<int> pendingIndexes = {};
  bool showMoreTech = false;
  bool showMoreSoft = false;

  List<String> selectedPreferences = [];

  TextEditingController searchController = TextEditingController();

  void _onItemSelected(String preference) {
    setState(() {
      selectedPreferences.add(preference);
      int index = preferenceList.indexOf(preference);
      if (index != -1) {
        selectedIndexes.add(index);
      } else {
        index = softSkillList.indexOf(preference);
        if (index != -1) {
          selectedIndexes.add(index + preferenceList.length);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isCenter: true,
        showBackArrow: true,
        // title: Text(
        //   "Preference Screen",
        //   style: Theme.of(context).textTheme.headlineMedium,
        // ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton.extended(
                onPressed: null,
                backgroundColor: AppColor.white,
                // foregroundColor:  AppColor.primary,
                label: Text(
                  "${selectedPreferences.length} / 10 selected",
                  style: const TextStyle(fontSize: 16, color: AppColor.primary),
                ),
                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                icon: const Icon(Icons.check, color: AppColor.primary),
              ),
              TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, RouteManager.loginScreen);
                },
                child: Row(
                  children: [
                    Text(
                      // 'Skip',
                      selectedPreferences.isNotEmpty ? "Next" : "Skip",

                      style: const TextStyle(
                          fontSize: 16, color: AppColor.primary),
                    ),
                    const Icon(Icons.skip_next, color: AppColor.primary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      bottomNavigationBar: const BottomAppBar(color: Colors.white),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: 20), // Adjust padding here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tell us about your skills",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Which skills are you good at or interested in learning? Pick at least 1",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  SearchDropdown(
                    techSkills: preferenceList,
                    softSkills: softSkillList,
                    onItemsSelected: (items) {
                      setState(() {
                        selectedPreferences = items;
                        selectedIndexes.clear();
                        for (var preference in items) {
                          int index = preferenceList.indexOf(preference);
                          if (index != -1) {
                            selectedIndexes.add(index);
                          } else {
                            index = softSkillList.indexOf(preference);
                            if (index != -1) {
                              selectedIndexes
                                  .add(index + preferenceList.length);
                            }
                          }
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 5.0,
                    children: selectedPreferences.map((preference) {
                      return Chip(
                        label: Text(
                          preference,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                        backgroundColor: AppColor.primary.withOpacity(0.7),
                        deleteIcon:
                            const Icon(Icons.close, color: Colors.white),
                        onDeleted: () {
                          setState(() {
                            selectedPreferences.remove(preference);
                            int index = preferenceList.indexOf(preference);
                            if (index != -1) {
                              selectedIndexes.remove(index);
                            } else {
                              index = softSkillList.indexOf(preference);
                              if (index != -1) {
                                selectedIndexes
                                    .remove(index + preferenceList.length);
                              }
                            }
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: AppColor.grey,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    "Tech",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.start,
                    children: preferenceList
                        .asMap()
                        .entries
                        .map((entry) {
                          int index = entry.key;
                          String preference = entry.value;
                          bool isSelected = selectedIndexes.contains(index);
                          bool isPending = pendingIndexes.contains(index);
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (selectedIndexes.contains(index)) {
                                  selectedIndexes.remove(index);
                                  selectedPreferences.remove(preference);
                                } else if (selectedIndexes.length < 10) {
                                  selectedIndexes.add(index);
                                  selectedPreferences.add(preference);
                                }
                              });
                            },
                            onHover: (isHovering) {
                              setState(() {
                                if (isHovering) {
                                  pendingIndexes.add(index);
                                } else {
                                  pendingIndexes.remove(index);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColor.primary.withOpacity(0.3)
                                    : isPending
                                        ? AppColor.primary.withOpacity(0.1)
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColor.primary
                                      : isPending
                                          ? AppColor.primary.withOpacity(0.5)
                                          : AppColor.grey,
                                ),
                              ),
                              child: Text(
                                preference,
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColor.primary
                                      : isPending
                                          ? AppColor.primary.withOpacity(0.5)
                                          : Colors.black,
                                ),
                              ),
                            ),
                          );
                        })
                        .toList()
                        .take(showMoreTech ? preferenceList.length : 10)
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showMoreTech = !showMoreTech;
                      });
                    },
                    child: Text(
                      showMoreTech ? "Show less" : "Show more",
                      style: const TextStyle(color: AppColor.primary),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Soft Skills",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.start,
                    children: softSkillList
                        .asMap()
                        .entries
                        .map((entry) {
                          int index = entry.key;
                          String preference = entry.value;
                          bool isSelected = selectedIndexes
                              .contains(index + preferenceList.length);
                          bool isPending = pendingIndexes
                              .contains(index + preferenceList.length);
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (selectedIndexes
                                    .contains(index + preferenceList.length)) {
                                  selectedIndexes
                                      .remove(index + preferenceList.length);
                                  selectedPreferences.remove(
                                      preference); // Update selected list
                                } else if (selectedIndexes.length < 10) {
                                  selectedIndexes
                                      .add(index + preferenceList.length);
                                  selectedPreferences
                                      .add(preference); // Update selected list
                                }
                              });
                            },
                            onHover: (isHovering) {
                              setState(() {
                                if (isHovering) {
                                  pendingIndexes
                                      .add(index + preferenceList.length);
                                } else {
                                  pendingIndexes
                                      .remove(index + preferenceList.length);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColor.primary.withOpacity(0.3)
                                    : isPending
                                        ? AppColor.primary.withOpacity(0.1)
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColor.primary
                                      : isPending
                                          ? AppColor.primary.withOpacity(0.5)
                                          : AppColor.grey,
                                ),
                              ),
                              child: Text(
                                preference,
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColor.primary
                                      : isPending
                                          ? AppColor.primary.withOpacity(0.5)
                                          : Colors.black,
                                ),
                              ),
                            ),
                          );
                        })
                        .toList()
                        .take(showMoreSoft ? softSkillList.length : 10)
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showMoreSoft = !showMoreSoft;
                      });
                    },
                    child: Text(
                      showMoreSoft ? "Show less" : "Show more",
                      style: const TextStyle(color: AppColor.primary),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
