import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Condition5 extends StatefulWidget {
  const Condition5({ Key? key }) : super(key: key);

  @override
  State<Condition5> createState() => _Condition5State();
}

class _Condition5State extends State<Condition5> {
  var Timing;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('Timing', Timing);
      print('Timing is saved');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
          alignment: Alignment.center,
          child: Text('Timing',style : TextStyle ( fontSize: 30))
          ),
          leading: IconButton(
            onPressed: (){

              Navigator.of(context).pushReplacementNamed('condtion4');
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
                 child: Text('How long have you had this conditions ?',style : TextStyle ( fontSize: 40))
                   
              ),

              Container(
                width: 300,                
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 70),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    Timing = 'Minutes to Hours';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('home');
                  },
                   child: Text('Minutes to Hours',style : TextStyle ( fontSize: 30,color: Colors.black))
                   ),
              ),

              Container(
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 70),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    Timing = 'Days to Weeks';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('home');
                  },
                   child: Text('Days to Weeks',style : TextStyle ( fontSize: 30,color: Colors.black))
                   ),
              ),

              Container(
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 70),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    Timing = 'Weeks to Months';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('home');
                  },
                   child: Text('Weeks to Months',style : TextStyle ( fontSize: 30,color: Colors.black))
                   ),
              ),

              Container(
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 70),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    Timing = 'Months to Years';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('home');
                  },
                   child: Text('Months to Years',style : TextStyle ( fontSize: 30,color: Colors.black))
                   ),
              ),

              Container(
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 255, 208, 0),
                    fixedSize: Size(250, 70),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    Timing = 'Recurring Episodes';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('home');
                  },
                   child: Text('Recurring Episodes',style : TextStyle ( fontSize: 30,color: Colors.black))
                   ),
              ),

            ]),
          ),
        )

    );
  }
}