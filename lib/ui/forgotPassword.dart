import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('Hi Reshnu')],
    );
  }
}

/*  Alert(
              context: context,
              title: "",
              content: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                    top: 0, left: 0.0, right: 0.0, bottom: 10.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      padding: const EdgeInsets.only(
                          top: 50.0, left: 0.0, right: 0.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Account Verification",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              "Enter the OTP sent your Email-ID to verify your account",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: PinEntryTextField(
                                  showFieldAsBox: false,
                                  onSubmit: (String pin) {
                                    showAlertDialogOnOkCallback(
                                        'Success !',
                                        'Verification Completed',
                                        DialogType.SUCCES,
                                        context,
                                        () => {}); //end showDialog()
                                  }, // end onSubmit
                                ), // end PinEntryTextField()
                              ), // end Padding()
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Divider(
                                  color: Colors.grey.shade600,
                                )),
                                const SizedBox(width: 10.0),
                                Text(
                                  "Having problems?",
                                  style: smallText,
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                    child: Divider(
                                  color: Colors.grey.shade600,
                                )),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            GestureDetector(
                              child: Text(
                                "Contact Us".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 80,
                        child: Image.asset(
                          logo,
                          fit: BoxFit.scaleDown,
                        )),
                  ],
                ),
              ),
            ).show(), */
/* import 'package:flutterapp/res/typography.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart'; */
