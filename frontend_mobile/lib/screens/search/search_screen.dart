import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/common/image_strings.dart';
import 'package:frontend_mobile/common/list.dart';
import 'package:frontend_mobile/common/text.dart';
import 'package:frontend_mobile/routes/route_manager.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_card.dart';
import 'package:frontend_mobile/screens/search/widgets/company_card.dart';
import 'package:frontend_mobile/widget/app_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> companies = AppList.companyList;
  List<String> filteredCompanies = [];

  @override
  void initState() {
    super.initState();
    filteredCompanies = companies;
  }

  void _filterCompanies(String query) {
    final filtered = companies.where((company) {
      return company.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredCompanies = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImage.upperStyle),
            CustomAppBar(
              isCenter: true,
              showBackArrow: true,
              title: Text(
                "Search",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            // Title above body
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            //   child: Text(
            //     'Search',
            //     style: Theme.of(context).textTheme.headlineMedium,
            //     textAlign: TextAlign.left,
            //   ),
            // ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Hero(
                tag: 'search-bar',
                child: Material(
                  borderRadius: BorderRadius.circular(24.0),
                  elevation: 3.0,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: AppText.enText['search-text'] ?? 'Search...',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: AppColor.midGrey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: _filterCompanies,
                  ),
                ),
              ),
            ),

            // List of Companies
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              itemCount: filteredCompanies.length,
              itemBuilder: (context, index) {
                return CompanyCard(
                  logoImg: AppImage.google,
                  companyName: filteredCompanies[index],
                  location: "Cambodia",
                  // contact: "",
                  // onTap: () {}
                );
              },
            ),

            // List of Job Listings
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomCardInfo(
                          jobImage: AppImage.google,
                          jobType: "Full Time",
                          companyName: "Google Inc",
                          positionName: "UX/UI Designer",
                          location: "California, USA",
                          minSalary: 200,
                          maxSalry: 400,
                          onTap: () {
                            Navigator.popAndPushNamed(
                                context, RouteManager.jobDetailScreen);
                          },
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
