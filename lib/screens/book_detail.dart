import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetail extends StatefulWidget {
  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail>
    with SingleTickerProviderStateMixin {
  TabController controller;

  BuildContext _context;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Flexible(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red[100],
          child: Stack(
            children: [
              Positioned(
                top: 36,
                left: 18,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(_context).pop();
                  },
                  child: Container(
                    child: Icon(Icons.arrow_back_ios),
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              Hero(
                tag: "1",
                child: Center(
                  child: Container(
                    width: 130,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: ExactAssetImage("assets/images/book1.jpg"))),
                  ),
                ),
              )
            ],
          ),
        )),
        Flexible(
            child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            children: [
              Text(
                "You're A Miracle",
                style: GoogleFonts.openSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "Mike McHargue",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                "\$20",
                style: GoogleFonts.openSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[200],
                ),
              ),
              widgetTapBar(),
              Container(
                height: 8,
              ),
              Text(
                "Labore fugiat incididunt ad ad adipisicing est ipsum. Voluptate deserunt ut Lorem ullamco laboris magna ut anim consectetur minim culpa quis. Consectetur ullamco dolore nisi magna quis et tempor. Mollit enim velit minim ad cillum sit ea ea sint eiusmod non. Pariatur exercitation Lorem nostrud officia ea exercitation mollit Lorem anim proident.",
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 8,
              ),
              RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0)),
                color: Colors.red[200],
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Add to Library",
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ))
      ],
    )));
  }

  Widget widgetTapBar() {
    return TabBar(
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      tabs: [
        Tab(text: 'Description'),
        Tab(text: 'Reviews(20)'),
        Tab(text: 'Similar'),
      ],
      controller: controller,
    );
  }
}
