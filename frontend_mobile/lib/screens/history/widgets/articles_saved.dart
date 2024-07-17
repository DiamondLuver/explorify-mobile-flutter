import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/screens/history/widgets/custom_danger_button.dart';
import 'package:frontend_mobile/screens/history/widgets/remove_btn.dart';

class ArticleSavedScreen extends StatelessWidget {
  const ArticleSavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Saved Articles",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
            ),
            const SizedBox(height: 8),
            _buildArticleCard(
              context,
              title: "Flutter for Beginners",
              author: "John Doe",
              description:
                  "An introductory guide to building apps with Flutter.",
              publicationInfo: "Published on: 2023-07-01",
            ),
            const SizedBox(height: 8),
            _buildArticleCard(
              context,
              title: "Advanced Flutter Techniques",
              author: "Jane Smith",
              description:
                  "In-depth techniques for optimizing Flutter applications.",
              publicationInfo: "Published on: 2023-06-15",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleCard(
    BuildContext context, {
    required String title,
    required String author,
    required String description,
    required String publicationInfo,
  }) {
    return Card(
      color: Colors.white,
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              author,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[800],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              publicationInfo,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            OverflowRemoveBarButton(
              title: 'Remove',
              onPressed: () => _confirmRemove(context, title),
            )
          ],
        ),
      ),
    );
  }

  void _confirmRemove(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onVerticalDragDown: (_) => Navigator.of(context).pop(),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  height: 4.0, // Height of the handle indicator
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Confirm Removal',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  height: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Are you sure you want to remove "$title"?',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextButton(
                        // onPressed: () => _confirmRemove(context, title),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side:
                                const BorderSide(color: AppColor.borderPrimary),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: DangerButton(
                        onPressed: () {
                          // Handle removal logic
                          // Navigator.of(context).pop();
                        },
                        buttonText: 'Remove',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
