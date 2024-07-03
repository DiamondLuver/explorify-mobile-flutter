import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class AppreciationForm extends StatefulWidget {
  const AppreciationForm({super.key});

  @override
  State<AppreciationForm> createState() => _AppreciationFormState();
}

class _AppreciationFormState extends State<AppreciationForm> {
  final TextEditingController _awardController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Text("Award Name", style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _awardController, // Assign the controller
            decoration: InputDecoration(
              hintText: "Enter Your Award Name",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),

              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 7), // Adjust padding values
              enabledBorder: OutlineInputBorder(
                // Custom border style
                borderRadius: BorderRadius.circular(15), // Rounded corners
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use theme color
                  width: 2.0, // Adjust border thickness
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // Style for focused state
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use accent color
                  width: 2.0,
                ),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.black), // Match text style
          ),
          SizedBox(
            height: 24,
          ),
          Text("Category/Achievement achieved",
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _categoryController, // Assign the controller
            decoration: InputDecoration(
              hintText: "Enter Your Achievement",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),

              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 7), // Adjust padding values
              enabledBorder: OutlineInputBorder(
                // Custom border style
                borderRadius: BorderRadius.circular(15), // Rounded corners
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use theme color
                  width: 2.0, // Adjust border thickness
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // Style for focused state
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use accent color
                  width: 2.0,
                ),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.black), // Match text style
          ),
          SizedBox(
            height: 24,
          ),
          Text("Achivement Year",
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _dateController, // Assign the controller
            decoration: InputDecoration(
              hintText: "Enter the Year",
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),

              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 7), // Adjust padding values
              enabledBorder: OutlineInputBorder(
                // Custom border style
                borderRadius: BorderRadius.circular(15), // Rounded corners
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use theme color
                  width: 2.0, // Adjust border thickness
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // Style for focused state
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.grey.withOpacity(0.5), // Use accent color
                  width: 2.0,
                ),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.black), // Match text style
          ),
          SizedBox(
            height: 24,
          ),
          Text("Description", style: Theme.of(context).textTheme.titleSmall),
          SizedBox(
            height: 12,
          ),
          Container(
            width: 1000,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _descriptionController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: 'Write additional information here',
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Save'),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
