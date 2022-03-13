import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var label;
  var confidence;
  var itch  ;
  var fever  ;
  var affected_area  ;
  var site  ;
  var Timing  ;

  List mydata = [];


  deletePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.clear();
      mydata = [];

    });
    print('Data is cleared');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(
           
        // centerTitle: true,
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('assets/b1.jpg'),
        //           fit: BoxFit.fill
        //       ))),

        //   title: Text('Home',style : TextStyle ( fontSize: 30))
            
        // ),
        // drawer: Drawer(),
          
          body: Container(
             decoration: const BoxDecoration( 
                  image: DecorationImage(
                 image: AssetImage("assets/b1.jpg"),
                 fit: BoxFit.cover),),


            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                Container(
                  margin:EdgeInsets.symmetric(vertical:10),                
                  child: ElevatedButton(
      
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed('test');
                    },
                    style: ElevatedButton.styleFrom(
                      primary:Colors.red,
                      fixedSize: Size(250, 100),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                     child: Text('Make Test',style : TextStyle ( fontSize: 40))
                     ),
                ),

                Container(
                  margin:EdgeInsets.symmetric(vertical:10),                
                  child: ElevatedButton(
                    onPressed: () async {

                      Navigator.of(context).pushReplacementNamed('mydata');

                    },
                    style: ElevatedButton.styleFrom(
                      primary:Colors.green,
                      fixedSize: Size(250, 100),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                    ),
                     child: Text('show data',style : TextStyle ( fontSize: 40))
                     ),
                ),

                

                  Container(
                  margin:EdgeInsets.symmetric(vertical:10),                
                  child: ElevatedButton(
                    onPressed: () async {
                      await deletePref();
                      print('data was cleared successfully');
                      

                      
                    },
                    style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 43, 132, 235),
                      fixedSize: Size(250, 100),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                    ),
                     child: Text('delete data',style : TextStyle ( fontSize: 40))
                     ),
                ),


                  
              ]),
            ),
          )

      ),
    );
  }
}