import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Animation/FadeAnimation.dart';
import 'package:flutterapp/ui/LoginPage1.dart';
import 'package:flutterapp/ui/verification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'verification.dart';
import 'package:flutterapp/signInWithGoogle.dart';
import 'homepage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
bool showSpinning = false;

class SignUpPage1 extends StatefulWidget {
  final String title;
  SignUpPage1({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage1> {
  String email;
  String password;
  String fullName;
  String confirmPassword;
  bool checkBoxValue = false;
  double _height;
  double _width;
  String logo = "assets/filmfoxfull.png";
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
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
            onTap: () {
              signInWithGoogle().whenComplete(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AppHomeScreen();
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
        showSpinning = true;

        try {
          if (checkBoxValue == true) {
            FirebaseUser firebaseUser =
                (await _auth.createUserWithEmailAndPassword(
                        email: email, password: password))
                    .user;
            //_auth.sendPasswordResetEmail(email: email);
            firebaseUser.sendEmailVerification();

            if (firebaseUser != null) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                final userid = firebaseUser.uid;
                return VerificationPage(
                  userid: userid,
                );
              }));
            }
          }
        } catch (e) {
          print(e);
        }
      },
      child: Container(
        width: 175,
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
          'Submit',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget signuptext() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FadeAnimation(
            1,
            Text(
              "Welcome !",
              style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffffffff)),
            )),
        SizedBox(
          height: 20,
        ),
        FadeAnimation(
            1,
            Text(
              "   Sign Up now !",
              style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.headline2,
                  fontSize: 20,
                  color: Color(0xffffffff)),
            )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget filmfoxlogo() {
    return Container(
      child: Column(
        children: <Widget>[
          FadeAnimation(
              1.3,
              Padding(
                padding: EdgeInsets.all(25),
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

  Widget emailTextFormField() {
    return CustomTextField(
      onPressed: (value) {
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
      onPressed: (value) {
        password = value;
      },
      obscureText: true,
      keyboardType: TextInputType.text,
      textEditingController: passwordController,
      icon: Icons.lock,
      hint: "Password",
    );
  }

  /* Widget confirmpasswordTextFormField() {
    return CustomTextField(
      onPressed: (value) {},
      keyboardType: TextInputType.text,
      textEditingController: confirmpasswordController,
      icon: Icons.lock,
      obscureText: true,
      hint: "Confirm Password",
    );
  } */

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.blue[400],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all ",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          Text(
            "terms and conditions",
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 30.0, right: _width / 30.0, top: _height / 40.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
            SizedBox(height: _height / 40.0),
            /* confirmpasswordTextFormField(),
            SizedBox(height: 10), */
            acceptTermsTextRow()
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage1()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(5),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Log In',
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
    return ModalProgressHUD(
      inAsyncCall: showSpinning,
      child: Scaffold(
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
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: signuptext(),
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
                      padding: EdgeInsets.all(0),
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
                            1.6,
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              alignment: Alignment.center,
                              child: _submitButton(),
                            ),
                          ),
                          _divider(),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
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
  final Function onPressed;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;

  CustomTextField({
    this.onPressed,
    this.hint,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.obscureText = true,
  });

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
        onChanged: onPressed,
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
