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
          'data:image/jpeg;base64,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',
    },
    {
      'title': 'Free',
      'image':
          'data:image/jpeg;base64,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',
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
