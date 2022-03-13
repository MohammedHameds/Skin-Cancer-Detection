import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Condition1 extends StatefulWidget {
  const Condition1({ Key? key }) : super(key: key);

  @override
  State<Condition1> createState() => _Condition1State();
}

class _Condition1State extends State<Condition1> {
  var itch;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('itch', itch);
      print('itch is saved');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
         
          alignment: Alignment.center,
          child: Text('itch symptoms',style : TextStyle ( fontSize: 30))
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('cancer');
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
                margin: EdgeInsets.all( 20),
                 child: Text('Does it itch ?',style : TextStyle ( fontSize: 40))
                   
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
                    itch = 'Yes';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition2');
                  },
                   child: Text('Yes',style : TextStyle ( fontSize: 30,color: Colors.black),)
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
                    itch = 'No';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition2');
                  },
                   child: Text('No',style : TextStyle ( fontSize: 30,color:Colors.black))
                   ),
              ),

              

            ]),
          ),
        )

    );
  }
}