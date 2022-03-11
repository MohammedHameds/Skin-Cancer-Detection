import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Condition3 extends StatefulWidget {
  const Condition3({ Key? key }) : super(key: key);

  @override
  State<Condition3> createState() => _Condition3State();
}

class _Condition3State extends State<Condition3> {
  var affected_area;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('affected_area', affected_area);
      print('affected_area is saved');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
          alignment: Alignment.center,
          child: Text('size of affected body',style : TextStyle ( fontSize: 30))
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('condition2');
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
                 child: Text('How much of the body is affected?',style : TextStyle ( fontSize: 40))
              ),

              Container(
              padding: EdgeInsets.all(5), 
              margin: EdgeInsets.all(5), 
                width:400,
                height:120, 
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                 
                  onPressed: () async {
                    affected_area = 'Single Lesion';
                    await savePref();
                    Navigator.of(context).pushReplacementNamed('condition4');
                  
                  },
                  child:Row(
                    
                     children: [
                     CircleAvatar(
                            backgroundImage: AssetImage('assets/Single_esion.jpg'),
                            radius: 50,
                    ),
                    SizedBox(width:10),
                   Text('Single Lesion',style : TextStyle ( fontSize: 30,color: Colors.black))
                    ],
                )
                )
              ),
  //----------------------------------------------------------------
              Container(
              padding: EdgeInsets.all(5), 
              margin: EdgeInsets.all(5), 
                width:400,
                height:120, 
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    affected_area = 'Limited Area';
                    await savePref();
                    Navigator.of(context).pushReplacementNamed('condition4');
                  },
                  child:Row(
                    
                     children: [
                     CircleAvatar(
                            backgroundImage: AssetImage('assets/Limited_area.jpg'),
                            radius: 50,
                    ),
                    SizedBox(width:10),
                   Text('Limited Area',style : TextStyle ( fontSize: 30,color: Colors.black))
                    ],
                )
                )
              ),
//----------------------------------------------------------------
              Container(
              padding: EdgeInsets.all(5), 
              margin: EdgeInsets.all(5), 
                width:400,
                height:120,
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    affected_area = 'Widespread';
                    await savePref();
                    Navigator.of(context).pushReplacementNamed('condition4');
                  },
                  child:Row(
                    
                     children: [
                     CircleAvatar(
                            backgroundImage: AssetImage('assets/Widespread.jpg'),
                            radius: 50,
                    ),
                    SizedBox(width:10),
                   Text('Widespread',style : TextStyle ( fontSize: 30,color: Colors.black))
                    ],
                )
                )
              ),
              

            ],
          ),
        )
          )
    );
  }
}