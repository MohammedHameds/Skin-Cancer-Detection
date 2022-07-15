
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/modules/login_screen/login_cubit/cubit.dart';
import 'package:flutter_application_1/modules/login_screen/login_cubit/state.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();


   var user;

   var pass;  

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   
setState(() {
        user = prefs.getString('email');
      pass = prefs.getString('password');
});
print('---------------------------');
print(user);
print(pass);

     }

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();             
    
      prefs.setString('email', user);       
      prefs.setString('password',pass);       
    
    print('------------------------------------');
    print('save login pref done successfllly');
    print(user);
  } 


  TextEditingController  _userEmail = TextEditingController(text:'');
  TextEditingController  _password = TextEditingController(text:'');


  SubmitLoginForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');


    }
  }

 Future<void> parameter_ () async {
  try {
     {
      await Future.delayed(const Duration(milliseconds: 50), (){
        _userEmail.text = user != null ? user : '';
        _password.text = pass != null ? pass : '';
        
      });
         }}
         
   catch (e) {       
          print('parameter_ has failed' + e.toString());
          }
       }


    @override
  void initState() {
    getPref();
    parameter_();
    print(_userEmail.text);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();}



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create : (BuildContext context) => LoginCubit(),
    child: BlocConsumer<LoginCubit , LoginState>
    (
    listener: (context , state){
      if  (state is errorLoginState) {
        Fluttertoast.showToast(
            msg: "please enter valid name and password",  // message
            toastLength: Toast.LENGTH_LONG, // length
            gravity: ToastGravity.BOTTOM,    // location
            timeInSecForIosWeb: 1               // duration
        );
      }
      if(state is successLoginState ) {
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => Home()));
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
                  // color: Colors.amber,
                  child: Column(
                    children: [

                      Container(
                          margin:EdgeInsets.all(5),
                          height: 220,
                          width: 250,
                          child: Image.asset('images/logo2.png'),
                          ),
                           
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "Sign In",
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
                              // initialValue: _userEmail.text,
                                controller: _userEmail,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color.fromARGB(255, 0, 0, 0),
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
                                  // Check if the entered email has the right format
                                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                }
                            ),

                            SizedBox(height: 30),
                            TextFormField(
                              // controller: _password,
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
                            SizedBox(height: 70),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // ignore: deprecated_member_use
                                state is!loadingLoginState
                                    ?
                                FlatButton(
                                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                                  onPressed: () async {
                                    //  SubmitLoginForm();
                                    if (_formKey.currentState?.validate()==true) {
                                      LoginCubit.get(context).userLogin(
                                          email: _userEmail.text,
                                          password: _password.text);

                                          setState(() {
                                            user = _userEmail.text;
                                            pass = _password.text;
                                          });
                                          await savePref();
                                      }
                                   
                                  },
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                  child: Text(
                                    "Sign In",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        color: Colors.white,
                                        letterSpacing: 0.168,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  color: Color(0xff07446C),
                                )
                                    : Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                              SizedBox(height: 40),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don\'t have an account ?",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                  child: Text(
                                    " Sign Up",
            style: TextStyle(
                color: Color.fromARGB(255, 206, 104, 20),
                fontSize: 13,
                fontWeight: FontWeight.w600),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,MaterialPageRoute(builder: (context) => Register()),
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
                  ),
                ),
              ],
            ),
          )
        ),
      )
   
    );
  }
}




