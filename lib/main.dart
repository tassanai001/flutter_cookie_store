import 'package:flutter/material.dart';

import 'bottom_bar.dart';
import 'cookie_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<String> _titleList = <String>['Cookies', 'Cookies cake', 'Ice cream'];
//  String title =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Pickup',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xFF545D68),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Color(0xFF545D68),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text(
                    _titleList[0],
                    style: TextStyle(
                      fontFamily: "Varela",
                      fontSize: 21.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    _titleList[1],
                    style: TextStyle(
                      fontFamily: "Varela",
                      fontSize: 21.0,
                    ),
                  ),
                ),
                Tab(
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Text(
                      _titleList[2],
                      style: TextStyle(
                        fontFamily: "Varela",
                        fontSize: 21.0,
                      ),
                    ),
                  ),
                )
              ]),
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                CookiePage(title: _titleList[_tabController.index]),
                CookiePage(title: _titleList[_tabController.index]),
                CookiePage(title: _titleList[_tabController.index]),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
