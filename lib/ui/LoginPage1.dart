import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Animation/FadeAnimation.dart';
import 'package:flutterapp/ui/navbar.dart';
import 'package:flutterapp/res/typography.dart';
import 'package:flutterapp/ui/signup1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'homepage.dart';
import 'package:flutterapp/signInWithGoogle.dart';
/*import 'package:rflutter_alert/rflutter_alert.dart';*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _auth = FirebaseAuth.instance;

class LoginPage1 extends StatefulWidget {
  //static const routeName = '/LoginPage1';
  final String title;
  LoginPage1({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

/*Future<String> _asyncInputDialog(BuildContext context) async {
  String teamName = '';
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter current team'),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
                  onChanged: (value) {
                    teamName = value;
                  },
                ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
    },
  );      
}*/

class _LoginPageState extends State<LoginPage1> {
  String email;
  String password;
  double _height;
  double _width;
  String logo = "assets/filmfoxfull.png";
  TextEditingController recoveremailController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  void showAlertDialogOnOkCallback(String title, String msg,
      DialogType dialogType, BuildContext context, VoidCallback onOkPress) {
    AwesomeDialog(
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: dialogType,
      tittle: title,
      desc: msg,
      btnOkIcon: Icons.check_circle,
      btnOkColor: Colors.blue,
      btnOkOnPress: onOkPress,
    ).show();
  }

  Widget socialIconsRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              signInWithGoogle().whenComplete(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BottomNavBar();
                    },
                  ),
                );
              });
            },
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/google_logo.png"),
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/fblogo.jpg"),
          ),
        ],
      ),
    );
  }

  Widget filmfoxlogo() {
    return Container(
      child: Column(
        children: <Widget>[
          FadeAnimation(
              1.3,
              Padding(
                padding: EdgeInsets.all(12),
                child: Image.asset(
                  'assets/foxfilmlogo.png',
                  height: 60,
                  fit: BoxFit.fill,
                ),
              )),
          form(),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        try {
          _key.currentState.validate()
              ? Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('This is Valid')))
              : Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('This is not  Valid')));
          final user = (await _auth.signInWithEmailAndPassword(
                  email: email, password: password))
              .user;

          if (user != null && user.isEmailVerified == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavBar();
                },
              ),
            );
          }
        } catch (e) {}
      },
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff00a2e1), Color(0xff0066a4)])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget recover() {
    return InkWell(
        onTap: () async {
          try {
            _auth.sendPasswordResetEmail(email: email);
          } catch (e) {
            print(e);
          }
          showAlertDialogOnOkCallback(
              'Success !',
              'Password reset link was successfully sent.',
              DialogType.SUCCES,
              context,
              () => {});
        },
        child: Container(
          width: 150,
          padding: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xff00a2e1), Color(0xff0066a4)])),
          child: Text(
            'Reset',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ));
  }

  Widget emailTextFormField() {
    return CustomTextField(
      onpressed: (value) {
        email = value;
      },
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      onpressed: (value) {
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {}
      },
      keyboardType: TextInputType.emailAddress,
      textEditingController: passwordController,
      icon: Icons.lock,
      obscureText: true,
      hint: "Password",
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 30.0, right: _width / 30.0, top: _height / 20.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage1()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(5),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign Up',
              style: TextStyle(
                  color: Color(0xff00a2e1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [Color(0xff0066a4), Color(0xff00a2e1)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Log In",
                        style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffffffff)),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1,
                      Text(
                        "  Welcome back...",
                        style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headline2,
                            fontSize: 18,
                            /*fontWeight: FontWeight.w700,*/
                            color: Color(0xffffffff)),
                      )),
                ],
              ),
            ),
            /*SizedBox(height: 20),*/
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                          1.4,
                          filmfoxlogo(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.5,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () =>
                                    /*Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RecoverPasswordPage()),
                                ),*/
                                    Alert(
                                  context: context,
                                  title: "",
                                  content: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(
                                        top: 0,
                                        left: 0.0,
                                        right: 0.0,
                                        bottom: 10.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: _width,
                                          margin: const EdgeInsets.only(
                                            top: 50,
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 50.0, left: 0.0, right: 0.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              color: Colors.white),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  "Forgotten your Password?",
                                                  style:
                                                      TextStyle(fontSize: 15.0),
                                                ),
                                                const SizedBox(height: 30.0),
                                                Text(
                                                  "We will help you in resetting your password\nEnter your email id below",
                                                  style:
                                                      TextStyle(fontSize: 15.0),
                                                ),
                                                const SizedBox(height: 20.0),
                                                CustomTextField1(
                                                  onpressed: (value) {
                                                    email = value;
                                                    print(email);
                                                  },
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  textEditingController:
                                                      recoveremailController,
                                                  icon: Icons.email,
                                                  hint: "Email ID",
                                                ),
                                                const SizedBox(height: 20.0),
                                                recover(),
                                                const SizedBox(height: 20.0),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                        child: Divider(
                                                      color:
                                                          Colors.grey.shade600,
                                                    )),
                                                    const SizedBox(width: 10.0),
                                                    Text(
                                                      "Having problems?",
                                                      style: smallText,
                                                    ),
                                                    const SizedBox(width: 10.0),
                                                    Expanded(
                                                        child: Divider(
                                                      color:
                                                          Colors.grey.shade600,
                                                    )),
                                                  ],
                                                ),
                                                const SizedBox(height: 20.0),
                                                GestureDetector(
                                                  child: Text(
                                                    "Contact Us".toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(top: 0.0),
                                            alignment: Alignment.center,
                                            height: 80,
                                            child: Image.asset(
                                              logo,
                                              fit: BoxFit.scaleDown,
                                            )),
                                      ],
                                    ),
                                  ),
                                ).show(),

                                //  _displayDialog(context),

                                child: Text('Forgot Password ?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.6,
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: _submitButton(),
                          ),
                        ),
                        _divider(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: socialIconsRow(),
                        ),
                        Wrap(children: <Widget>[
                          _createAccountLabel(),
                        ])
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;
  final Function onpressed;
  final Function validator;

  CustomTextField(
      {this.onpressed,
      this.hint,
      this.textEditingController,
      this.keyboardType,
      this.icon,
      this.obscureText = true,
      this.validator});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        onChanged: onpressed,
        validator: validator,
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.blue[500],
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue[200], size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class CustomTextField1 extends StatelessWidget {
  GlobalKey<FormState> _key = GlobalKey();
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;
  final Function onpressed;

  CustomTextField1(
      {this.hint,
      this.textEditingController,
      this.keyboardType,
      this.icon,
      this.obscureText = false,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget1.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget1.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 2,
      key: _key,
      /*elevation: large ? 12 : (medium ? 10 : 8),*/
      child: TextFormField(
        onChanged: onpressed,
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.blue[500],
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue[200], size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class ResponsiveWidget {
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
