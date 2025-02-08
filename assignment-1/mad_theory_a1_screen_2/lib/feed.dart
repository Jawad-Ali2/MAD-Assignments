import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Color(0xffd620fe),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.message,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),

      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffd620fe),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              // Positioned Card
              Positioned(
                top: 10, // Adjust position to overlap with the app bar
                left: 16,
                right: 16,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Items Price",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.grey[700]),
                              ),
                              DropdownMenu(
                                inputDecorationTheme: InputDecorationTheme(),
                                dropdownMenuEntries: [],
                                label: Text("Today"),
                                width: 130,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Items with prices
                            ItemWidget(
                                imageUrl:
                                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                                price: "75,000"),
                            ItemWidget(
                                imageUrl:
                                    "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                                price: "2,00"),
                            ItemWidget(
                                imageUrl:
                                    "https://pixlr.com/images/generator/how-to-generate.webp",
                                price: "15,000"),
                          ],
                        ),
                        // SizedBox(height: 3),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            customTextIcon("Like", Icons.thumb_up),
                            customTextIcon("Comment", Icons.comment),
                            customTextIcon("Share", Icons.share),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 280,
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Products",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[700]),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ItemWidgetTwo(
                    imageUrl:
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                    price: "60,000",
                    name: "Car",
                  ),
                  ItemWidgetTwo(
                    imageUrl:
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                    price: "22,000",
                    name: "Bottle",
                  ),
                  ItemWidgetTwo(
                    imageUrl:
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                    price: "10,000",
                    name: "Laptop",
                  ),
                  ItemWidgetTwo(
                    imageUrl:
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                    price: "25,000",
                    name: "Car",
                  ),
                ],
              ),
              SizedBox(height: 3),
              PostWidget(
                name: 'John Doe',
                timeAgo: '2d',
                postText: 'Amazing Scenery!',
                postImageUrl:
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
              ),
            ],
          ),
        ],
      ),

      // FLOATING BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffd620fe),
        onPressed: () {},
        shape: CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // BOTTOM BAR
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        shape: CircularNotchedRectangle(),
        child: IconTheme(
          data: IconThemeData(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: 'Open navigation menu',
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.newspaper),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(Icons.doorbell),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextIcon(String text, IconData icon) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.grey[600],
      ),
      label: Text(
        text,
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String imageUrl; // URL of the image
  final String price;

  const ItemWidget({super.key, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Square container for the network image
        Container(
          width: 60, // Define the size of the square
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
            image: DecorationImage(
              image: NetworkImage(imageUrl), // Load image from network
              fit: BoxFit.cover, // Ensure the image fits within the square
            ),
          ),
        ),
        const SizedBox(height: 4),
        // Price text
        Text(
          price,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class ItemWidgetTwo extends StatelessWidget {
  final String imageUrl; // URL of the image
  final String price;
  final String name;

  const ItemWidgetTwo(
      {super.key,
      required this.imageUrl,
      required this.price,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Square container for the network image
        Container(
          width: 60, // Define the size of the square
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            // Optional: Rounded corners
            image: DecorationImage(
              image: NetworkImage(imageUrl), // Load image from network
              fit: BoxFit.cover, // Ensure the image fits within the square
            ),
          ),
        ),
        const SizedBox(height: 4),
        // Price text
        Text(
          name,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  final String name;
  final String timeAgo;
  final String postText;
  final String postImageUrl;

  const PostWidget({
    super.key,
    required this.name,
    required this.timeAgo,
    required this.postText,
    required this.postImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 24,
                  child: Icon(
                    Icons.person,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                // User Name and Time
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Options Menu
                Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 10),
            // Post Text
            Padding(
              padding: const EdgeInsets.only(left: 55.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postText,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  // Post Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      postImageUrl,
                      height: 200, // Adjust height as needed
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
