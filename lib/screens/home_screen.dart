import 'package:book_library_app/screens/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  BuildContext _context;

  List bookCartItems = [
    {
      "id": "1",
      "name": "You're A Miracle",
      "author": "Mike McHargue",
      "price": 20.0,
      "image": "assets/images/book1.jpg"
    },
    {
      "id": "2",
      "name": "Pattern Maker",
      "author": "Kerry Jhonston",
      "price": 40.0,
      "image": "assets/images/book2.jpg"
    },
    {
      "id": "3",
      "name": "Fifty Shades Darker",
      "author": "E. L. James",
      "price": 25.0,
      "image": "assets/images/book3.jpg"
    },
    {
      "id": "4",
      "name": "Fifty Shades of Grey",
      "author": "E. L. James",
      "price": 30.0,
      "image": "assets/images/book4.jpg"
    },
    {
      "id": "5",
      "name": "Fifty Shades Freed",
      "author": "E. L. James",
      "price": 26.0,
      "image": "assets/images/book5.jpg"
    },
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red[200],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User")
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            widgetHeader(),
            searchWidget(),
            widgetTapBar(),
            widgetPaginator(),
            widgetPopular()
          ],
        ),
      ),
    );
  }

  Padding widgetTapBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TabBar(
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        tabs: [
          Tab(text: 'New'),
          Tab(text: 'Trending'),
          Tab(text: 'Best Seller'),
        ],
        controller: controller,
      ),
    );
  }

  Widget widgetPaginator() {
    return Container(
      height: 180,
      width: 18,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Card(
              child: Container(
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/images/book2.jpg"))),
          )),
          Card(
              child: Container(
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/images/book3.jpg"))),
          )),
          Card(
              child: Container(
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/images/book4.jpg"))),
          )),
          Card(
              child: Container(
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/images/book5.jpg"))),
          )),
          Card(
              child: Container(
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage("assets/images/book1.jpg"))),
          )),
        ],
      ),
    );
  }

  Padding widgetPopular() {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular",
            style: GoogleFonts.openSans(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          for (var i in bookCartItems)
            cardPopularItem(
              name: i["name"],
              author: i["author"],
              price: i["price"],
              image: i["image"],
              id: i["id"],
            ),
        ],
      ),
    );
  }

  Widget cardPopularItem(
      {String name, String author, double price, String image, String id}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(_context).push(
            MaterialPageRoute(builder: (BuildContext context) => BookDetail()));
      },
      child: Card(
        margin: EdgeInsets.only(top: 16),
        elevation: 2,
        child: Container(
            child: Row(
          children: [
            Flexible(flex: 3, child: Hero(tag: id, child: Image.asset(image))),
            Flexible(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 8, right: 8, bottom: 8),
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      author,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$" + price.toString(),
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Padding widgetHeader() {
    return Padding(
      padding: EdgeInsets.only(
        left: 25,
        top: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, Damian",
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          Text(
            "Discover Latest Book",
            style: GoogleFonts.openSans(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Container searchWidget() {
    return Container(
        height: 39,
        margin: EdgeInsets.only(left: 25, right: 25, top: 19),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Stack(children: <Widget>[
          TextField(
              maxLengthEnforced: true,
              style: GoogleFonts.openSans(
                fontSize: 12,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 19, right: 50, bottom: 5),
                  border: InputBorder.none,
                  hintText: "Search book...",
                  hintStyle: GoogleFonts.openSans(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ))),
          Positioned(
              right: 0,
              height: 39,
              width: 39,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red[200],
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ))
        ]));
  }
}
