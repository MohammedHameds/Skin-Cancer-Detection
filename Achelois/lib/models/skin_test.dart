import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Skin_Test extends StatefulWidget {
  const Skin_Test({ Key? key }) : super(key: key);

  @override
  State<Skin_Test> createState() => Skin__TestState();
}

class Skin__TestState extends State<Skin_Test> {
 deletePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.clear();
    });
    print('old data is cleared');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
          alignment: Alignment.center,
          child: Text('Test',style : TextStyle ( fontSize: 30))
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
                margin: EdgeInsets.all( 20),
                 child: Text('start test for skin cancer ?',style : TextStyle ( fontSize: 40))
                   
              ),

              Container(
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(

                   style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 6, 200, 248),
                    fixedSize: Size(250, 100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),

                  onPressed: () async {
                   deletePref();
                   Navigator.of(context).pushReplacementNamed('cancer');
                  },
                   child: Text('Let\'s go',style : TextStyle ( fontSize: 30,color: Colors.black))
                   ),
              ),
              Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                      Icon(Icons.warning_amber_sharp),
                      SizedBox(width: 3),
                      Text('work in progress',style : TextStyle ( fontSize:10,color: Colors.black)),
                    ],)
                    // child: Text('our algorithm is under construction ',style : TextStyle ( fontSize:10,color: Colors.black)),
                  ),

            ]),
          ),
        )

    );
  }
}