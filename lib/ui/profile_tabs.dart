import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class profile_tabs extends StatefulWidget {
  static const routeName = '/Profile2';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<profile_tabs> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new ListView(
          children: <Widget>[
                BottomSection()


              ],
            ),


      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
//=======================
// Build bottom Profile
//=======================
class BottomSection extends StatefulWidget {

  @override
  _BottomSectionState createState() => new _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new Tab(text: 'Gallery'),
      new Tab(text: 'Skills'),
      new Tab(text: 'About'),
    ];
    _pages = [
      Gallery(),
      Skills(),
      About(),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            labelColor: Theme.of(context).accentColor,
            indicatorColor: Theme.of(context).accentColor,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}

//==============================================================================


//===================
// Build Gallery Tab
//===================
class Gallery extends StatelessWidget {
  List<Widget> _buildItems() {
    var items = <Widget>[];

    for (var i = 900; i <= 914; i++) {
      var image = new Image.network(
        'https://i.picsum.photos/id/$i/200/200.jpg',
        width: 200.0,
        height: 200.0,
      );

      items.add(image);
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    var delegate = new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return new GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: _buildItems(),
    );
  }
}


//==============================================================================


//===================
// Build Skills Tab
//===================
class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();

  }
}


//==============================================================================


//===================
// Build About Tab
//===================
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



//==============================================================================
