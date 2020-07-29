import 'dart:async';

import 'package:flutter/material.dart';
/* import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gender_selection/gender_selection.dart'; */

class profile_about extends StatefulWidget {
  static const routeName = '/BottomNavBar';
  @override
  _Profile_About createState() => _Profile_About();
}

class _Profile_About extends State<profile_about> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    String height;
    var ranges = ['100-119', '120-139', '140-150'];
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Expansion Tile'
        ),
      ),*/
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              // color: Colors.white,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0),
                  bottomLeft: const Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  ExpansionTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(
                        "User Information",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        SizedBox(height: 10),

                        /*TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.white,
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue, ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),*/

                        /*CustomTextField1(
                    keyboardType: TextInputType.emailAddress,
                   // textEditingController: emailController,
                    icon: Icons.account_circle,
                    hint: "Name",
                  ),*/

                        TextFormField(
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Name',
                            prefixIcon: // add padding to adjust icon
                                Icon(Icons.account_circle),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          maxLines: 3,
                          maxLength: 10,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Bio',
                            prefixIcon: // add padding to adjust icon
                                Icon(Icons.mode_edit),
                          ),
                        ),

/*
                  Text("${selectedDate.toLocal()}".split(' ')[0]),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select date'),
                  ),*/

                        TextFormField(
                          onTap: () => _selectDate(context),
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Date of Birth',
                            prefixIcon: // add padding to adjust icon
                                Icon(Icons.calendar_today),
                          ),
                        ),
                        SizedBox(height: 20.0),

                        /*TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Date of Birth'
                    ),
                  ),*/
                      ]),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              // color: Colors.white,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0),
                  bottomLeft: const Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  ExpansionTile(
                      leading: Icon(Icons.phone),
                      title: Text(
                        "Contact Information",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Email',
                            prefixIcon: // add padding to adjust icon
                                Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Phone no:',
                            prefixIcon: // add padding to adjust icon
                                Icon(Icons.phone),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Hometown',
                            prefixIcon: // add padding to adjust icon
                                Icon(Icons.place),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Language',
                            prefixIcon: // add padding to adjust icon
                                Icon(Icons.language),
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ]),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              // color: Colors.white,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0),
                  bottomLeft: const Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  ExpansionTile(
                      leading: Icon(Icons.accessibility),
                      title: Text(
                        "Physical Information",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text("Height"),
                          trailing: DropdownButton(
                            value: height,
                            hint: Text('Choose'),
                            onChanged: ((String newValue) {
                              setState(() {
                                height = newValue;
                              });
                            }),
                            //  items: this.ranges,
                          ),
                        ),

                        ListTile(
                          title: Text("Body Type"),
                          trailing: DropdownButton(
                            value: height,
                            hint: Text('Choose'),
                            onChanged: ((String newValue) {
                              setState(() {
                                height = newValue;
                              });
                            }),
                            //  items: this.ranges,
                          ),
                        ),

                        ListTile(
                          title: Text("Skin Tone"),
                          trailing: DropdownButton(
                            value: height,
                            hint: Text('Choose'),
                            onChanged: ((String newValue) {
                              setState(() {
                                height = newValue;
                              });
                            }),
                            //  items: this.ranges,
                          ),
                        ),

//                                IconButton(
//                                  icon: Icon(Icons.volume_up),
//                                  tooltip: 'Increase volume by 10',
//                                  onPressed: () {
//                                    setState(() {
//                                      _volume += 10;
//                                    });
//                                  },
//                                ),

                        /* GenderSelection(
                            femaleImage: NetworkImage("https://cdn1.iconfinder.com/data/icons/website-internet/48/website_-_female_user-512.png"),
                            maleImage: NetworkImage("https://icon-library.net/images/avatar-icon/avatar-icon-4.jpg"),
                            selectedGenderIconBackgroundColor: Colors.amber,
                            selectedGenderTextStyle: TextStyle(color: Colors.amber,fontSize: 19,fontWeight: FontWeight.bold),
                          ),*/

                        ListTile(
                          title: Text("Gender"),
                          trailing: DropdownButton(
                            value: height,
                            hint: Text('Choose'),
                            onChanged: ((String newValue) {
                              setState(() {
                                height = newValue;
                              });
                            }),
                            //  items: this.ranges,
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField1 extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;

  CustomTextField1({
    this.hint,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget1.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget1.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      elevation: 1,
      /*elevation: large ? 12 : (medium ? 10 : 8),*/
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.blue[500],
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue[200], size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class ResponsiveWidget1 {
  static bool isScreenLarge(double width, double pixel) {
    return width * pixel >= 1440;
  }

  static bool isScreenMedium(double width, double pixel) {
    return width * pixel < 1440 && width * pixel >= 1080;
  }

  static bool isScreenSmall(double width, double pixel) {
    return width * pixel <= 720;
  }
}
