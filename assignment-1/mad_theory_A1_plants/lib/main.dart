import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/hanging_plant.png'),
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Form(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            ),
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            // contentPadding: EdgeInsets.only(bottom: 4)
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            // contentPadding: EdgeInsets.only(bottom: 4)
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.white70),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductsPage()));
                                },
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                      EdgeInsets.symmetric(vertical: 20)),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  backgroundColor:
                                      WidgetStateProperty.all(Colors.white),
                                ),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "New User? ",
                              style: TextStyle(fontWeight: FontWeight.w300),
                              children: [
                                TextSpan(
                                    text: "Sign Up",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

enum ProductsFilter { all, small, medium, hanging }

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("App bar"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What Kind",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text("Of Plants You Want",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SearchBar(
              hintText: "Search",
              leading: const Icon(Icons.search),
              trailing: [
                Icon(Icons.mic),
              ],
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ProductsFilter.values.map((filter) {
                int index = filter.index;
                return FilterChip(
                  selected: index == 2 ? true : false,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  selectedColor: Colors.green,
                  label: Text(
                    filter.toString().split('.').last[0].toUpperCase() +
                        filter.toString().split('.').last.substring(1),
                  ),
                  onSelected: (bool value) {
                    // Handle filter logic
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Indoor",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage("assets/images/plant 1.png"),
                          height: 145,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ficas",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "From \$20",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Indoor",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage("assets/images/plant 2.png"),
                          height: 145,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ficas",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "From \$20",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Indoor",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage("assets/images/plant 3.png"),
                          height: 145,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ficas",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "From \$20",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      splashColor: Colors.white70,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProductDetailsPage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Indoor",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.normal),
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white70,
                                ),
                              ],
                            ),
                            Image(
                              image: AssetImage("assets/images/plant 4.png"),
                              height: 145,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ficas",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "From \$20",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Details"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Image(image: AssetImage("assets/images/plant 4.png")),
            SizedBox(height: 25),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cactus",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Regular Price \$195.00",
                      style: TextStyle(fontSize: 18, color: Colors.black38),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Ink(
                      height: 30,
                      width: 30,
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          color: Colors.green),
                      child: IconButton(
                          onPressed: () {},
                          alignment: Alignment.center,
                          icon: Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(width: 10),
                    Text("1"),
                    SizedBox(width: 10),
                    Ink(
                      height: 30,
                      width: 30,
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          color: Colors.green),
                      child: IconButton(
                          onPressed: () {},
                          alignment: Alignment.center,
                          icon: Icon(
                            Icons.remove,
                            size: 15,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orangeAccent),
                    Icon(Icons.star, color: Colors.orangeAccent),
                    Icon(Icons.star, color: Colors.orangeAccent),
                    Icon(Icons.star, color: Colors.orangeAccent),
                    Icon(Icons.star, color: Colors.orangeAccent),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              "It is a long established fact that a reader will be distracter by the readable content of a page when looked at its layout.",
              style: TextStyle(fontSize: 20, color: Colors.black45),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductsPage()));
                    },
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(vertical: 20)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(Colors.green),
                    ),
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
