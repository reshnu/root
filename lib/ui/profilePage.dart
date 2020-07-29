import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Fox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Profile'),
    );
  }
}

bool _isEditingText = false;
TextEditingController _editingController;
String initialText = "Initial Text";

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = path.basename(_image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: profile());
  }

  Widget _editTitleTextField() {
    if (_isEditingText)
      return Expanded(
        child: TextField(
          decoration: new InputDecoration(
            labelText: "Enter Email",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          onSubmitted: (newValue) {
            setState(() {
              initialText = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      );
    return InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: Text(
          initialText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ));
  }

  Widget profile() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "http://cdn30.us1.fansshare.com/image/background/background-1153037165.jpg"),
              fit: BoxFit.cover,
            )),
            // color: Colors.deepOrange,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height / 1.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: height / 7.5,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Stack(fit: StackFit.loose, children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: Color(0xff476cfb),
                                child: ClipOval(
                                  child: SizedBox(
                                    width: 180.0,
                                    height: 180.0,
                                    child: (_image != null)
                                        ? Image.file(
                                            _image,
                                            fit: BoxFit.fill,
                                          )
                                        : Image.asset(
                                            'images/profile.png',
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            /*  child: (_image != null)
                                    ? Image.file(
                                        _image,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        "http://cdn30.us1.fansshare.com/image/background/background-1153037165.jpg",
                                        fit: BoxFit.cover), */
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 25.0,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      getImage();
                                    },
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      _editTitleTextField(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isEditingText = true;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.lightBlue,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Athlete',
                    style: TextStyle(fontSize: 20, color: Colors.black45),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Text(
                  'Welcome to the official page of Leo messi',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: height / 16,
                      width: width / 4,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: Colors.lightBlue,
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: width / 4,
                      height: height / 16.5,
                      child: OutlineButton(
                        borderSide:
                            BorderSide(color: Colors.lightBlue, width: 2.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        onPressed: () {},
                        child: Text('Message'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            '128M',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            '492',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            '226',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.grid_on,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.account_box,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    shape: BoxShape.rectangle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: width / 2.2,
                        height: height / 4.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage('images/1.jpg'),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2.0,
                                  spreadRadius: 3.0)
                            ]),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: width / 2.2,
                        height: height / 4.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage('images/3.jpg'),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2.0,
                                  spreadRadius: 3.0)
                            ]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
