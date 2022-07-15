import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'modules/register_screen/register_cubit/cubit.dart';
import 'modules/register_screen/register_cubit/state.dart';


class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController  _userEmail = TextEditingController();
  TextEditingController  _password = TextEditingController();
  TextEditingController  _phone = TextEditingController();
  TextEditingController  _userName = TextEditingController();

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();             
    
      prefs.setString('name', _userName.text);
      prefs.setString('email', _userEmail.text);
      prefs.setString('phone', _phone.text);
      prefs.setString('password',_password.text);

    
    print('------------------------------------');
    print('save RegisterScreen done successfllly');
    print(_userName);
    print(_userEmail);
    print(_phone);
    print(_password);            
    print('------------------------------------');

  } 




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create : (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit , RegisterState>
          (
            listener: (context , state) {
              if  (state is errorCreateUserState) {
              Fluttertoast.showToast(
              msg: "this Email Is Already Exist",  // message
              toastLength: Toast.LENGTH_LONG, // length
              gravity: ToastGravity.BOTTOM,    // location
              timeInSecForIosWeb: 1               // duration
              );
              }
               if(state is successRegisterState ) {
                Navigator.of(context).pop();
                Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Login()));
                 }
            },
            builder: (context , state)=>
                Scaffold(
                    body: Container(
                      decoration : BoxDecoration(
                       gradient: LinearGradient(
                        //  colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 174, 217, 255)],
                        //  colors: [Color.fromARGB(255, 96, 165, 239), Color.fromARGB(255, 153, 204, 250)], // mahmoud
                         colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],

                         begin: Alignment.centerLeft,
                         end: Alignment.centerRight,
                       ),
                  ),

                        child: ListView(
                            children: [
                              Container(
                          margin:EdgeInsets.all(5),
                          height: 150,
                          width: 200,
                          child: Image.asset('images/logo2.png'),
                          ),
                           
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "Sign Up",
                                          style: GoogleFonts.poppins(
                                            fontSize: 30,
                                            color: Color(0xff07446C),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),

                              Container(
                                margin: EdgeInsets.all(40),
                                padding: EdgeInsets.only(top: 0, left: 5, right: 5),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                          controller: _userEmail,
                                          decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.email,
                                                color: Color.fromARGB(255, 13, 13, 13),
                                                size: 20,
                                              ),
                                              focusColor: Color(0xff757575),
                                              hintText: "Email Address",
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey))),
                                          keyboardType: TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value == null || value
                                                .trim()
                                                .isEmpty) {
                                              return 'Please enter your email address';
                                            }
                                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                              return 'Please enter a valid email address';
                                            }
                                          }
                                      ),

                                      SizedBox(height: 30),
                                      TextFormField(
                                          controller: _userName,
                                          decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.person,
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                size: 20,
                                              ),
                                              focusColor: Color(0xff757575),
                                              hintText: "User Name",
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey))),
                                          keyboardType: TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value == null || value
                                                .trim()
                                                .isEmpty) {
                                              return 'Please enter your name';
                                            }
                                            if (value
                                                .trim()
                                                .length < 4) {
                                              return 'Username must be at least 4 characters in length';
                                            }
                                          }
                                      ),

                                      SizedBox(height: 30),
                                      TextFormField(
                                          controller: _phone,
                                          decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.phone,
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                size: 20,
                                              ),
                                              focusColor: Color(0xff757575),
                                              hintText: "Phone",
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey))),
                                          keyboardType: TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value == null || value
                                                .trim()
                                                .isEmpty) {
                                              return 'Please enter your phone';
                                            }
                                            if (value
                                                .trim()
                                                .length < 11) {
                                              return 'Phone must be at least 11 number in length';
                                            }
                                          }
                                      ),

                                      SizedBox(height: 30),
                                      TextFormField(
                                          controller: _password,
                                          decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.remove_red_eye,
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                size: 20,
                                              ),
                                              hintText: "Password",
                                              fillColor: Color(0xff757575),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey))),
                                          obscureText: true,
                                          validator: (value) {
                                            if (value == null || value
                                                .trim()
                                                .isEmpty) {
                                              return 'This field is required';
                                            }
                                            if (value
                                                .trim()
                                                .length < 8) {
                                              return 'Password must be at least 8 characters in length';
                                            }
                                          }
                                      ),
                                      SizedBox(height: 40),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          state is!loadingRegisterState
                                              ?
                                          FlatButton(
                                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                                            onPressed: () async {
                                              if (_formKey.currentState!.validate()) {
                                                RegisterCubit.get(context).userRegister(
                                                  name: _userName.text,
                                                  email: _userEmail.text,
                                                  phone: _phone.text,
                                                  password: _password.text,
                                                );
                                                }else
                                                  {
                                                    print("else button");
                                                  }
                                                  await savePref();
                                            },
                                            shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(30.0),
                                            ),
                                            child: Text(
                                              "Sign Up",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  letterSpacing: 0.168,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            color: Color(0xff07446C),
                                          )
                                        : const Center(
                                         child: CircularProgressIndicator(
                                         color: Colors.indigo,
                                          ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Already have an account ?",
                                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            child: Text(
                                              " Sign In",
                                                          style: TextStyle(
                                                 color: Color.fromARGB(255, 206, 104, 20),
                                               fontSize: 13,
                                               fontWeight: FontWeight.w600),
                                            ),
                                            onTap: () {              
                                              Navigator.of(context).pop();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Login()),
                                              );
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]
                        )
                    )
                )
        )
    );
  }
}
