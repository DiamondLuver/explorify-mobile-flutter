import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/artical/detail_screen.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

final List<IconData> buttonIcon = [
  Icons.home,
  Icons.design_services, // Changed to design-related icon
  Icons.person, // Changed to soft skill-related icon
  Icons.code, // Changed to backend-related icon
  Icons.developer_mode, // Changed to developer-related icon
];
final List<String> title = [
  "Upskill",
  "Design",
  "Softskill",
  "Backend",
  "Developer",
];

int selectedIndex = 0;

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 249, 198, 157),
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     color: Colors.grey[100],
        //     image: DecorationImage(
        //       image: AssetImage("assets/images/upper_style.png"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        title: _buildText(),
      ),
      body: _buildBody(),
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    // use to call the api

    //   try {
    //   final response =
    //       await http.get(Uri.parse("https://fakestoreapi.com/products"));

    //   if (response.statusCode == 200) {
    //     List list = json.decode(response.body);
    //     List<Map<String, dynamic>> items =
    //         list.map((e) => e as Map<String, dynamic>).toList();
    //     return items;
    //   } else {
    //     throw Exception("Failed to load data");
    //   }
    // } catch (e) {
    //   throw Exception("Error fetching data: ${e.toString()}");
    // }

    // Sample data
    List<Map<String, dynamic>> sampleData = [
      {
        'title': 'Future of Work Trends',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque .',
        'image':
            'https://www.chieflearningofficer.com/wp-content/uploads/2023/05/AdobeStock_577015054.jpeg',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque .laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
      {
        'title': 'Skill Needs for Different',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque .',
        'image':
            'https://sloanreview.mit.edu/wp-content/uploads/2021/05/GEN-Palmer-Skills-Atrophy-1290x860-1.jpg',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
      {
        'title': 'A Day in the Life of as student',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque .',
        'image':
            'https://www.21kschool.com/in/wp-content/uploads/sites/4/2022/10/Will-Graduation-become-Irrelevant-in-the-Age-of-Skill-based-Education-1.png',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
      {
        'title': 'Sample Article 3',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque ',
        'image':
            'https://www.netsolutions.com/insights/wp-content/uploads/2022/06/how-to-become-a-software-developer.webp',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
      {
        'title': 'Development Life Cycle',
        'category':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque ',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGvLJOyDqTP40tXu2LdXWH0AdrGmdpFrsVD0iSfBgV4bNxioEeKRQN1ffnOg6LpXkKlzQ&usqp=CAU',
        'description':
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatemSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem',
      },
    ];

    return Future.delayed(const Duration(seconds: 2), () => sampleData);
  }

  Widget _buildText() {
    return Column(
      children: [
        Text(
          'Article',
          style: TextStyle(
            letterSpacing: 0.5,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildMenuBar(),
        _buildTextTitles(),
        SizedBox(height: 20),
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: [
              _buildApi(),
              _buildApi(),
              _buildApi(),
              _buildApi(),
              _buildApi(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextTitles() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 15),
      child: Align(
        alignment: Alignment.centerLeft, // Aligns the container to the left
        child: Text(
          'Getting Started ',
          textAlign: TextAlign.left, // Aligns text to the left
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar() {
    return Container(
      height: 150,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: buttonIcon.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // color: Colors.grey[100],
                    width: 65,
                    height: 65,

                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color.fromARGB(255, 255, 244, 233)
                          : Color.fromARGB(153, 247, 247, 245),
                      borderRadius: BorderRadius.circular(15),
                      // border: isSelected
                      //     ? Border.all(
                      //         color: Color.fromARGB(255, 250, 86, 4),
                      //         width: 2,
                      //       )
                      //     : null,
                      // // border: Border.all(
                      //   color: Colors.orange,
                      //   width: 1.5,
                      // ),
                    ),
                    child: Center(
                      child: Icon(
                        buttonIcon[index],
                        color: isSelected
                            ? Color.fromARGB(255, 250, 86, 4)
                            : Color.fromARGB(255, 21, 11, 61),
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    title[index],
                    style: TextStyle(
                      color: isSelected
                          ? Color.fromARGB(255, 250, 86, 4)
                          : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildApi() {
    return Center(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildListView(snapshot.data ?? []);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Map<String, dynamic>> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(items[index]);
      },
    );
  }

  Widget _buildItem(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        borderRadius: BorderRadius.circular(26.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromRGBO(0, 0, 0, 0.08),
        //     spreadRadius: 0,
        //     blurRadius: 12,
        //     offset: Offset(0, 4), // changes position of shadow
        //   ),
        // ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.0),
        ),
        color: Colors.transparent, // Set the Card color to transparent
        elevation: 0, // Remove the Card elevation to avoid shadow overlap
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(item['image']),
                    fit: BoxFit.cover,
                    onError: (error, stackTrace) => Container(
                      color: Colors.white,
                      // Optionally, you can add an error icon here
                      // child: Icon(Icons.error, size: 50),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${item['title']}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 242, 124, 28),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.bookmark_border,
                          color: Color.fromARGB(255, 82, 75, 107),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${item['category']}",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(item: item), // Pass the item here
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Read more ",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(153, 247, 247, 245),
                            ),
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: Color.fromARGB(255, 21, 11, 61)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
