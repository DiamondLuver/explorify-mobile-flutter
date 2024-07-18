import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';
import 'package:frontend_mobile/screens/home/widgets/custom_header.dart';
import 'package:frontend_mobile/screens/profile/widget/costom_appBar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  //for calander
  void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor, // Use your primary color
              onPrimary: Colors.white, // Text color for the selected date
              onSurface:
                  Theme.of(context).primaryColor, // Text color for the dates
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the date picker dialog
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      // Format the date string to omit time (yyyy-MM-dd)
      final formattedDate = pickedDate.toString().split(' ').first;
      _dateController.text = formattedDate;
    }
  }

  String? _selectedGender = ''; //for gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: PrimaryCustomContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0), // Add horizontal padding
                  child: Column(
                    children: [
                      const CustomProfileAppBar(
                        showBackArrow: true,
                        title: Row(
                          children: [
                            SizedBox(height: 40),
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 34, right: 54, top: 10),
                        child: Align(
                          alignment: Alignment.centerLeft, // Align to the start
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/profile_img.png",
                                width: 98,
                                height: 98,
                              ),
                              Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColor.primary.withOpacity(0.8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    minimumSize: const Size(85, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100))),
                                onPressed: () {},
                                child: Text(
                                  "change profile",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 13, color: AppColor.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Add edit fields here
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name
                  Title(
                    color: AppColor.black,
                    child: Text(
                      "Full Name",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black), // Match text style
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameController, // Assign the controller
                    decoration: InputDecoration(
                      hintText: "Enter Your Name",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.7)),

                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 7), // Adjust padding values
                      enabledBorder: OutlineInputBorder(
                        // Custom border style
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        borderSide: BorderSide(
                          color:
                              AppColor.grey.withOpacity(0.5), // Use theme color
                          width: 2.0, // Adjust border thickness
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Style for focused state
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColor.grey
                              .withOpacity(0.5), // Use accent color
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.black), // Match text style
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Date
                  Title(
                    color: AppColor.black,
                    child: Text(
                      "Date of Birth",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black), // Match text style
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true, // Set to read-only
                    decoration: InputDecoration(
                      hintText: "YYYY-MM-DD",
                      labelStyle: TextStyle(color: AppColor.black),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 7),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColor.grey.withOpacity(0.5),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColor.grey.withOpacity(0.5),
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min, // Row doesn't expand
                        children: [
                          IconButton(
                            icon: Icon(Icons.calendar_today,
                                color: Theme.of(context).primaryColor),
                            onPressed: () {
                              _showDatePicker();
                            },
                          ),
                        ],
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black,
                        ),
                  ),

                  //Gender
                  SizedBox(
                    height: 10,
                  ),
                  //Name
                  Title(
                    color: AppColor.black,
                    child: Text(
                      "Gender",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black), // Match text style
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // This code implements two RadioButtons for selecting gender

                  Row(
                    children: [
                      Radio(
                        value: 'Male',
                        groupValue:
                            _selectedGender, // You need to define this variable to hold the selected gender
                        onChanged: (value) {
                          setState(() {
                            _selectedGender =
                                value as String; // Cast the value to String
                          });
                        },
                      ),
                      Text('Male'),
                      SizedBox(width: 10),
                      Radio(
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender =
                                value as String; // Cast the value to String
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                  //Email
                  SizedBox(
                    height: 10,
                  ),
                  //Country
                  Title(
                    color: AppColor.black,
                    child: Text(
                      "Country",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black), // Match text style
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _countryController, // Assign the controller
                    decoration: InputDecoration(
                      hintText: "Enter Your Country",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.7)),

                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 7), // Adjust padding values
                      enabledBorder: OutlineInputBorder(
                        // Custom border style
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        borderSide: BorderSide(
                          color:
                              AppColor.grey.withOpacity(0.5), // Use theme color
                          width: 2.0, // Adjust border thickness
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Style for focused state
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColor.grey
                              .withOpacity(0.5), // Use accent color
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.black), // Match text style
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Title(
                    color: AppColor.black,
                    child: Text(
                      "Email",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black), // Match text style
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController, // Assign the controller
                    decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.7)),

                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 7), // Adjust padding values
                      enabledBorder: OutlineInputBorder(
                        // Custom border style
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        borderSide: BorderSide(
                          color:
                              AppColor.grey.withOpacity(0.5), // Use theme color
                          width: 2.0, // Adjust border thickness
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Style for focused state
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColor.grey
                              .withOpacity(0.5), // Use accent color
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.black), // Match text style
                  ),

                  //location
                  SizedBox(
                    height: 10,
                  ),
                  Title(
                    color: AppColor.black,
                    child: Text(
                      "Location",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.black), // Match text style
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _locationController, // Assign the controller
                    decoration: InputDecoration(
                      hintText: "Enter Your Location",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.7)),

                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 7), // Adjust padding values
                      enabledBorder: OutlineInputBorder(
                        // Custom border style
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        borderSide: BorderSide(
                          color:
                              AppColor.grey.withOpacity(0.5), // Use theme color
                          width: 2.0, // Adjust border thickness
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Style for focused state
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColor.grey
                              .withOpacity(0.5), // Use accent color
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.black), // Match text style
                  ),
                ],
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                  minimumSize: const Size(85, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                // Handle saving edited profile information
              },
              child: Text('Save Changes'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 145, vertical: 16),
                minimumSize: const Size(85, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.grey)), // Add border color
                //textStyle: TextStyle(color: Colors.black)
              ), // Add text color
              onPressed: () {
                // Handle saving edited profile information
              },
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 15, color: AppColor.primary),
              ),
            ),

            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
