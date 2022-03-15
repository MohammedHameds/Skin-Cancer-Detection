import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Condition2 extends StatefulWidget {
  const Condition2({ Key? key }) : super(key: key);

  @override
  State<Condition2> createState() => _Condition2State();
}

class _Condition2State extends State<Condition2> {
  var fever;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('fever', fever);
      print('fever is saved');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
          alignment: Alignment.center,
          child: Text('fever symptoms',style : TextStyle ( fontSize: 30))
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('condition1');
            }, icon: Icon(Icons.arrow_back_outlined)
            ),
            actions: [
           IconButton(onPressed: (){
             Navigator.of(context).pushNamed('home');
           }, icon: Icon(Icons.cancel)),
            
        ],
      ),
        
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                alignment: Alignment.center,
                width:400,
                margin: EdgeInsets.all( 50),
                 child: Text('Does you have a fever ?',style : TextStyle ( fontSize: 40))
                   
              ),

              Container(
                width: 300,                
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    fever = 'Yes';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition5');
                  },
                   child: Text('Yes',style : TextStyle ( fontSize: 30,color: Colors.black))
                   ),
              ),

              Container(
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    fever = 'No';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition5');
                  },
                   child: Text('No',style : TextStyle ( fontSize: 30,color: Colors.black))
                   ),
              ),
              
            ]),
          ),
        )

    );
  }
}