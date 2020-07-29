import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
String dropdownValue = 'Feature Film';
dynamic _chosenValue;
String category;
String projectName;
String projectDescription;
int numberofroles;
String characterDetails;
Color color1 = Colors.white;
Color color2 = Colors.white;
Color genderColor = Colors.white;
Color endo = Colors.white;
Color meso = Colors.white;

class Character extends StatefulWidget {
  Character({Key key}) : super(key: key);

  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  RangeValues _values = RangeValues(1, 100);
  RangeValues _age = RangeValues(1, 100);
  RangeLabels _ageLabel = RangeLabels('1 YR', '100 YR');
  RangeLabels _labels = RangeLabels('1 CM', '100 CM');
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
                  'Character Details',
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
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        child: Row(
                      children: [
                        InputTextField(
                          label: 'Gender       :',
                        ),
                        SizedBox(
                          width: 40.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              color1 = Colors.grey.shade300;
                              color2 = Colors.white;
                            });
                          },
                          child: CircleAvatar(
                            radius: 20.0,
                            child: Image.asset('images/male.png'),
                            backgroundColor: color1,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              color2 = Colors.grey.shade300;
                              color1 = Colors.white;
                            });
                          },
                          child: CircleAvatar(
                            radius: 20.0,
                            child: Image.asset('images/female.png'),
                            backgroundColor: color2,
                          ),
                        )
                      ],
                    )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InputTextField(label: 'Height        :'),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Rangeslider(
                              values: _values,
                              labels: _labels,
                              division: 10,
                              onchanges: (values) {
                                setState(() {
                                  _values = values;
                                  _labels = RangeLabels(
                                      (values.start.toInt() * 2).toString(),
                                      (values.end.toInt() * 2).toString());
                                });
                              }),
                        ),
                        InputTextField(label: 'CM')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InputTextField(label: 'Age Range :'),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Rangeslider(
                              values: _age,
                              labels: _ageLabel,
                              division: 100,
                              onchanges: (values) {
                                setState(() {
                                  _age = values;

                                  _ageLabel = RangeLabels(
                                      values.start.toInt().toString(),
                                      values.end.toInt().toString());
                                });
                              }),
                        ),
                        InputTextField(label: 'Yr')
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InputTextField(label: 'Body Type :'),
                        SizedBox(
                          width: 20.0,
                        ),
                        BodyType(
                          image: AssetImage('images/ecto.png'),
                          colors: genderColor,
                          colorSelection: () {
                            setState(() {
                              genderColor = Colors.grey.shade300;
                              endo = Colors.white;
                              meso = Colors.white;
                            });
                          },
                        ),
                        BodyType(
                          image: AssetImage('images/endo.png'),
                          colors: endo,
                          colorSelection: () {
                            setState(() {
                              endo = Colors.grey.shade300;
                              meso = Colors.white;
                              genderColor = Colors.white;
                            });
                          },
                        ),
                        BodyType(
                          image: AssetImage('images/meso.png'),
                          colors: meso,
                          colorSelection: () {
                            setState(() {
                              meso = Colors.grey.shade300;
                              genderColor = Colors.white;
                              endo = Colors.white;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    InputField(
                      hintText: 'More Details About Character',
                      labelText: 'Character Details',
                      icon: FontAwesomeIcons.comment,
                      onchanged: (value) {
                        characterDetails = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    InputField(
                      hintText: 'Other',
                      labelText: 'Any other details ',
                      icon: FontAwesomeIcons.searchLocation,
                      onchanged: (value) {
                        characterDetails = value;
                      },
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
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
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

class BodyType extends StatelessWidget {
  BodyType({@required this.image, this.colors, this.colorSelection});
  final AssetImage image;
  final Color colors;
  final Function colorSelection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: colorSelection,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(10.0)),
        child: Image(
          image: image,
          height: 70.0,
          width: 70.0,
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  InputTextField({@required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: Colors.grey.shade600, fontSize: 16.0),
    );
  }
}

class Rangeslider extends StatelessWidget {
  Rangeslider({
    @required this.values,
    @required this.labels,
    @required this.onchanges,
    this.division,
  });
  final RangeValues values;
  final RangeLabels labels;
  final Function onchanges;
  final division;

  Widget build(BuildContext context) {
    return RangeSlider(
        values: values,
        min: 1,
        max: 100,
        labels: labels,
        divisions: division,
        onChanged: onchanges);
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
