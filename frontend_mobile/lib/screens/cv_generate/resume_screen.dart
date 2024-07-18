import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({Key? key}) : super(key: key);

  @override
  _CVScreenState createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = CarouselController();

  List<Map<String, String>> _products = [
    {
      'title': 'Free',
      'image':
          'https://marketplace.canva.com/EAFRuCp3DcY/1/0/1131w/canva-black-white-minimalist-cv-resume-f5JNR-K5jjw.jpg',
    },
    {
      'title': 'Free',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9g5xjZV6YRiTWjFZWETn16OlqVJJDyrzCjg&s',
    },
    {
      'title': 'Pro',
      'image':
          'https://www.cvresumebuild.com/wp-content/uploads/2023/05/photo_2023-12-23_21-13-07-600x849.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 234, 155, 121),
        title: Text(
          'RESUME',
          style: TextStyle(
            letterSpacing: 0.5,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(child: _buildCVScroll()),
        _buildBottom(),
        SizedBox(
          height: 150,
        )
      ],
    );
  }

  Widget _buildCVScroll() {
    return Container(
      width: double.infinity,
      height: 420.0, // Set fixed height
      child: CarouselSlider(
        carouselController: _carouselController,
        options: CarouselOptions(
          height: 420.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.70,
          enlargeCenterPage: true,
          pageSnapping: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: _products.map((product) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = (_selectedIndex == product) ? {} : product;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 228, 212),
                    borderRadius: BorderRadius.circular(20),
                    border: _selectedIndex == product
                        ? Border.all(
                            color: Color.fromARGB(255, 250, 199, 154), width: 3)
                        : null,
                    boxShadow: _selectedIndex == product
                        ? [
                            BoxShadow(
                              color: const Color.fromARGB(255, 251, 215, 187),
                              blurRadius: 30,
                              offset: Offset(0, 10),
                            )
                          ]
                        : [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 20,
                              offset: Offset(0, 5),
                            )
                          ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 330,
                          margin: EdgeInsets.only(top: 20),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            product['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          product['title']!,
                          style: TextStyle(
                            color: Color.fromARGB(255, 216, 104, 56),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: () {
          // Perform an action when the button is pressed
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 236, 116, 52),
          elevation: 2,
          minimumSize: Size(350, 60), // Adjust the width and height as needed
          padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30), // Add padding for a bigger touch area
        ),
        child: const Text(
          'Generate',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
