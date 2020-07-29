import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutterapp/res/FaBar.dart';
import 'package:flutter/widgets.dart';

final _firestore = Firestore.instance;
String dropdownValue = 'Feature Film';
dynamic _chosenValue;
String category;
String projectName;
String projectDescription;
int numberofroles;
String characterDetails;
DateTime date2;
enum SingingCharacter { yes, no }

class AddPost extends StatefulWidget {
  AddPost({Key key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  SingingCharacter _character = SingingCharacter.no;
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(FontAwesomeIcons.podcast),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Post Your Casting Call',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FAProgressBar1(
                      currentValue: 30,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.list,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 18.0),
                        Text(
                          'Category     :',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        DropdownButton<String>(
                          value: _chosenValue,
                          isDense: true,
                          items: <String>[
                            'Feature Film',
                            'Short Film',
                            'Web Series ',
                            'Advertistment',
                            'TV Serials',
                            'Other'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 15.0,
                    ),
                    InputField(
                      hintText: 'What do the Name Of Project ?',
                      labelText: 'Project Name *',
                      icon: FontAwesomeIcons.film,
                      validator: (value) {
                        if (value.isEmpty) {
                          print('required');
                        }
                      },
                      onchanged: (value) {
                        projectName = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    InputField(
                      hintText: 'Small Description About Your Project',
                      labelText: 'Project Description',
                      icon: FontAwesomeIcons.clipboard,
                      onchanged: (value) {
                        projectDescription = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    InputField(
                      hintText: 'Number Of Roles for The Current Character',
                      labelText: 'Number of Roles',
                      icon: FontAwesomeIcons.user,
                      onchanged: (values) {
                        numberofroles = values;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    DateTimeField(
                      format: format,
                      decoration: InputDecoration(
                          icon: Icon(FontAwesomeIcons.clock),
                          labelText: 'Last Date For Apply'),
                      onShowPicker: (context, currentValue) async {
                        final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.combine(date, time);
                        } else {
                          return currentValue;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    InputField(
                      hintText: 'Location Details',
                      labelText: 'Shooting Location',
                      icon: FontAwesomeIcons.searchLocation,
                      onchanged: (value) {
                        characterDetails = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.planeArrival,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 14.0),
                            Text(
                              'Shooting Abroad :',
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 16.0),
                            ),
                            Text('No'),
                            Radio(
                              value: SingingCharacter.no,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                            Text('Yes'),
                            Radio(
                              value: SingingCharacter.yes,
                              groupValue: _character,
                              onChanged: (SingingCharacter value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _firestore.collection('post_details').add({
                          'Category': _chosenValue,
                          'character_details': characterDetails,
                          'no_of_roles': numberofroles,
                          'project_description': projectDescription,
                          'project_name': projectName
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w900,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final Function onchanged;
  final Function validator;

  InputField(
      {@required this.hintText,
      @required this.labelText,
      @required this.icon,
      this.onchanged,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hintText,
        labelText: labelText,
      ),
      onSaved: (String value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      onChanged: onchanged,
      validator: validator,
    );
  }
}
