import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mydata extends StatefulWidget {
  const Mydata({ Key? key }) : super(key: key);

  @override
  State<Mydata> createState() => _MydataState();
}

class _MydataState extends State<Mydata> {
  var label;
  var confidence;
  var itch  ;
  var fever  ;
  var affected_area  ;
  var site  ;
  var Timing  ;

  List mydata = [];

getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mydata = [];
      label = prefs.getString('label');
      confidence = prefs.getString('confidence');
      itch = prefs.getString('itch');
      fever = prefs.getString('fever');
      affected_area = prefs.getString('affected_area');
      site = prefs.getString('site');
      Timing = prefs.getString('Timing');


      mydata.add(['label',label]);
      mydata.add(['confidence',confidence]);
      mydata.add(['itch',itch]);
      mydata.add(['fever',fever]);
      mydata.add(['affected_area',affected_area]);
      mydata.add(['site',site]);
      mydata.add(['Timing',Timing]);

    });

    // if (mydata[0][1] == null) {
    //   mydata = [];
    // }
    print('Data is saved');
  }

  
@override
void initState() {
  super.initState();
  getPref();
  
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title:Container(
          alignment: Alignment.center,
          child: Text('mydata',style : TextStyle ( fontSize: 30))
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('home');
            }, icon: Icon(Icons.arrow_back_outlined)
            ),
            actions: [
           IconButton(onPressed: (){
             Navigator.of(context).pushNamed('home');
           }, icon: Icon(Icons.cancel)),
            
        ],
      ),
        
        
        body: Container(
          
          margin:EdgeInsets.only(top: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width:400,
                  height:470,
                  child: GridView.builder(
             
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 1,childAspectRatio: 6),
            itemCount : mydata.length,
            itemBuilder: (context,i){
              return Container(
                alignment: Alignment.center,
                color: Color.fromARGB(255, 238, 237, 237),
                margin:EdgeInsets.all(3),
                child : ListTile(
                  title : Text('${mydata[i][0]}'+ ' :'+'${mydata[i][1]}',style: TextStyle(fontSize: 20,color: Colors.black),),
                  
                ), 
              );
            },
         ),
                ),
              

              Container(
                margin:EdgeInsets.symmetric(vertical:10),                
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushReplacementNamed('test');

                  },
                  style: ElevatedButton.styleFrom(
                    primary:Colors.green,
                    fixedSize: Size(300, 100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                  ),
                   child: Text('Try new test',style : TextStyle ( fontSize: 30))
                   ),
              ),

              

                
            ]),
          ),
        

    );
  }
}