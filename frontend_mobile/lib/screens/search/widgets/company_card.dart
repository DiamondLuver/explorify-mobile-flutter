import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/screens/company/company_details_screen.dart'; // Ensure this import points to the correct location

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.logoImg,
    required this.companyName,
    required this.location,
    this.textButton = "View Details",
  });

  final String logoImg;
  final String companyName, location;
  final String? textButton;

  void _navigateToDetails(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CompanyDetailsScreen(
        companyName: companyName,
        logoImg: logoImg,
        location: location,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.textAccent.withOpacity(.1),
                        child: Image.asset(
                          logoImg,
                          fit: BoxFit.cover,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            companyName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            location,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
