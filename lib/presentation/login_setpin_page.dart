import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproo/presentation/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/const.dart';
import 'login_resetpin_page.dart';

class EnterMPinPageView extends StatefulWidget {
  const EnterMPinPageView({super.key});

  @override
  State<EnterMPinPageView> createState() => _EnterMPinPageViewState();

}

class _EnterMPinPageViewState extends State<EnterMPinPageView> {

  TextEditingController otpFieldOne = TextEditingController();
  TextEditingController otpFieldTwo = TextEditingController();
  TextEditingController otpFieldThree = TextEditingController();
  TextEditingController otpFieldFour = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text("Set a PIN For Login",style: TextStyle(color: Colors.black),),
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.grey[100],
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  //   height: 150,
                  //   width: 150,
                  //   child: MyImageAssets.otpPin,
                  // ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 75, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 50,
                          height: 75,
                          child: TextField(
                              maxLength: 1,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.next,
                              //onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                              onChanged: (value){
                                FocusScope.of(context).nextFocus();
                              },
                              controller: otpFieldOne,
                              decoration: InputDecoration(
                                  counterText: "",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(100)
                                  )
                              ),
                              style: TextStyle(fontSize:20)
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 75,
                          child: TextField(
                              maxLength: 1,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.next,
                              //onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                              onChanged: (value){
                                FocusScope.of(context).nextFocus();
                              },
                              controller: otpFieldTwo,
                              decoration: InputDecoration(
                                  counterText: "",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(100)
                                  )
                              ),
                              style: TextStyle(fontSize:20)
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 75,
                          child: TextField(
                              maxLength: 1,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.next,
                              //onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                              onChanged: (value){
                                FocusScope.of(context).nextFocus();
                              },
                              controller: otpFieldThree,
                              decoration: InputDecoration(
                                  counterText: "",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(100)
                                  )
                              ),
                              style: TextStyle(fontSize:20)
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 75,
                          child: TextField(
                              maxLength: 1,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.done,
                              //onSubmitted: (_) => FocusScope.of(context).unfocus(),
                              onChanged: (value){
                                FocusScope.of(context).unfocus();
                              },
                              controller: otpFieldFour,
                              decoration: InputDecoration(
                                  counterText: "",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(100)
                                  )
                              ),
                              style: TextStyle(fontSize:20)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    width: 325,
                    height: 43,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("CONTINUE"),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                      onPressed: () async {

                        SharedPreferences shp = await SharedPreferences.getInstance();

                        String pinOne = otpFieldOne.text;
                        String pinTwo = otpFieldTwo.text;
                        String pinThree = otpFieldThree.text;
                        String pinFour = otpFieldFour.text;

                        if(pinOne.isEmpty)
                        {
                          _showDialogOfMPINSet(context,"Please Enter PIN One Properly");
                          return;
                        }

                        if(pinTwo.isEmpty)
                        {
                          _showDialogOfMPINSet(context,"Please Enter PIN Two Properly");
                          return;
                        }

                        if(pinThree.isEmpty)
                        {
                          _showDialogOfMPINSet(context,"Please Enter PIN Three Properly");
                          return;
                        }

                        if(pinFour.isEmpty)
                        {
                          _showDialogOfMPINSet(context,"Please Enter PIN Four Properly");
                          return;
                        }

                        String totalPIN = "$pinOne$pinTwo$pinThree$pinFour";
                        shp.setString(Const.Shpref_PIN, totalPIN!);

                        String getPinString = shp.getString(Const.Shpref_PIN).toString();

                        if (totalPIN == getPinString)
                          {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (route) => false);

                          }

                      },

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(35),
                    child: GestureDetector(
                      onTap: (){

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const ResetMPinPageView()), (route) => false);

                      },
                      child: Text("Reset MPIN",style: TextStyle(color: Colors.red),),
                    ),
                  )
                ],
              )),
        ),
      );


  }

  _showDialogOfMPINSet(BuildContext context,String message)
  {
    showDialog(context: context, builder: (context){

      return AlertDialog(
        content: Container(
          height: 175,
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(message,textAlign: TextAlign.center,)),
              ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("OK"))
            ],
          ),
        ),
      );

    });

  }

}
