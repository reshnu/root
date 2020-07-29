import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  bool colour = false;
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
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Skills',
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
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Skill set ",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                    ),
                    Wrap(
                      spacing: 5.0,
                      runSpacing: 3.0,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              colour = !colour;
                            });
                          },
                          child: SkillChip(
                            child: colour
                                ? Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                  )
                                : null,
                            text: Text('Dance'),
                          ),
                        ),
                        SkillChip(
                          text: Text('Sing'),
                        ),
                        SkillChip(text: Text('Drawing')),
                        SkillChip(text: Text('skill 1')),
                        SkillChip(text: Text('skill 2')),
                        SkillChip(text: Text('skill 3')),
                        SkillChip(text: Text('skill 4')),
                        SkillChip(text: Text('skill 5')),
                        SkillChip(text: Text('skill 6')),
                        SkillChip(text: Text('skill 7')),
                        SkillChip(text: Text('skill 8')),
                        SkillChip(text: Text('skill 9')),
                        SkillChip(text: Text('skill 10')),
                        SkillChip(text: Text('skill 11')),
                        SkillChip(text: Text('skill 12')),
                        SkillChip(text: Text('skill 13')),
                        SkillChip(text: Text('skill 14')),
                      ],
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

class SkillChip extends StatefulWidget {
  SkillChip({@required this.text, this.color, this.child, this.selected});
  final Function selected;
  final Text text;
  final Color color;
  final Icon child;

  @override
  _SkillChipState createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Chip(
        avatar: selected
            ? CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.check),
              )
            : null,
        label: widget.text,
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
