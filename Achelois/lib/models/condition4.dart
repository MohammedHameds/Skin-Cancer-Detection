// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Condition4 extends StatefulWidget {
//   const Condition4({ Key? key }) : super(key: key);

//   @override
//   State<Condition4> createState() => _Condition4State();
// }

// class _Condition4State extends State<Condition4> {
//   var itch;

//   savePref() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       prefs.setString('site', itch);
//       print('site is saved');
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Container(
//           alignment: Alignment.center,
//           child: Text('site',style : TextStyle ( fontSize: 30))
//           ),
//           leading: IconButton(
//             onPressed: (){
//               Navigator.of(context).pushReplacementNamed('condition3');
//             }, icon: Icon(Icons.arrow_back_outlined)
//             ),
//             actions: [
//            IconButton(onPressed: (){
//              Navigator.of(context).pushNamed('home');
//            }, icon: Icon(Icons.cancel)),
            
//         ],
//       ),
        
//         body: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                 alignment: Alignment.center,
//                 width:400,
//                 margin: EdgeInsets.all( 20),
//                  child: Text('Affected area ?',style : TextStyle ( fontSize: 40))
                   
//               ),

//               Container(
//                 width: 300,                
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary:Color.fromARGB(255, 255, 208, 0),
//                     fixedSize: Size(250, 70),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                   ),
//                   onPressed: () async {
//                     itch = 'Head';
//                    await savePref();
//                    Navigator.of(context).pushReplacementNamed('condition5');
//                   },
//                    child: Text('Head',style : TextStyle ( fontSize: 30,color: Colors.black))
//                    ),
//               ),

//               Container(
//                 width: 300,                
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 child: ElevatedButton(

//                   style: ElevatedButton.styleFrom(
//                     primary:Color.fromARGB(255, 255, 208, 0),
//                     fixedSize: Size(250, 70),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                   ),
//                   onPressed: () async {
//                     itch = 'Neck';
//                    await savePref();
//                    Navigator.of(context).pushReplacementNamed('condition5');
//                   },
//                    child: Text('Neck',style : TextStyle ( fontSize: 30,color: Colors.black))
//                    ),
//               ),

//               Container(
//                 width: 300,                
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 child: ElevatedButton(
                  
//                   style: ElevatedButton.styleFrom(
//                     primary:Color.fromARGB(255, 255, 208, 0),
//                     fixedSize: Size(250, 70),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                   ),
//                   onPressed: () async {
//                     itch = 'Upper extremity';
//                    await savePref();
//                    Navigator.of(context).pushReplacementNamed('condition5');
//                   },
//                    child: Text('Upper extremity',style : TextStyle ( fontSize: 30,color: Colors.black))
//                    ),
//               ),

//               Container(
//                 width: 300,                
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 child: ElevatedButton(
                  
//                   style: ElevatedButton.styleFrom(
//                     primary:Color.fromARGB(255, 255, 208, 0),
//                     fixedSize: Size(250, 70),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                   ),
//                   onPressed: () async {
//                     itch = 'Lower extremity';
//                    await savePref();
//                    Navigator.of(context).pushReplacementNamed('condition5');
//                   },
//                    child: Text('Lower extremity',style : TextStyle ( fontSize: 30,color: Colors.black))
//                    ),
//               ),

//               Container(
//                 width: 300,                
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 child: ElevatedButton(

//                   style: ElevatedButton.styleFrom(
//                     primary:Color.fromARGB(255, 255, 208, 0),
//                     fixedSize: Size(250, 70),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                   ),
//                   onPressed: () async {
//                     itch = 'Torso';
//                    await savePref();
//                    Navigator.of(context).pushReplacementNamed('condition5');
//                   },
//                    child: Text('Torso',style : TextStyle ( fontSize: 30,color: Colors.black))
//                    ),
//               ),
             
//               Container(
//                 width: 300,                
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 child: ElevatedButton(

//                   style: ElevatedButton.styleFrom(
//                     primary:Color.fromARGB(255, 255, 208, 0),
//                     fixedSize: Size(250, 70),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                   ),
//                   onPressed: () async {
//                     itch = 'Palms';
//                    await savePref();
//                    Navigator.of(context).pushReplacementNamed('condition5');
//                   },
//                    child: Text('Palms',style : TextStyle ( fontSize: 30,color: Colors.black))
//                    ),
//               ),
   
              

//             ]),
//           ),
//         )

//     );
//   }
// }