import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class CustomCardInfo extends StatelessWidget {
  const CustomCardInfo({
    super.key,
    required this.jobImage,
    required this.positionName,
    required this.companyName,
    required this.location,
    required this.jobType,
    required this.minSalary,
    required this.maxSalry,
    this.textButton = "View Details",
    this.onTap,
  });

  final String jobImage;
  final String positionName, companyName, location, jobType;
  final double minSalary, maxSalry;
  final String? textButton;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          padding: const EdgeInsets.all(18),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(15),
          ),
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
                          jobImage,
                          fit: BoxFit.cover,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            positionName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "$companyName . $location",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            jobType,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "$minSalary\$ - $maxSalry\$",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          minimumSize: const Size(85, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      onPressed: () {},
                      child: Text(
                        textButton!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, color: AppColor.white),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
