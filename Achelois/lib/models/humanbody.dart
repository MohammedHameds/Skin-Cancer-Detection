import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HumanBody extends StatefulWidget {
  const HumanBody({ Key? key }) : super(key: key);

  @override
  State<HumanBody> createState() => _HumanBodyState();
}

class _HumanBodyState extends State<HumanBody> {
  int temp = 0;
  var itch;

  savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('site', itch);
      print('site is saved');
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title:Container(
          alignment: Alignment.center,
          child: Text('site',style : TextStyle ( fontSize: 30))
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
      body: temp == 0 ? 
      Container(
         
        margin:EdgeInsets.only( top : 40,left:50, right:50, bottom:100),
        width: double.infinity,
        height: double.infinity,
       decoration: const BoxDecoration( 
          image: DecorationImage(
         image: AssetImage("images/a2.jpg"),
         fit: BoxFit.cover),
          ),
       child: Stack(children: [
         ElevatedButton(onPressed: (){
           setState(()  {           
             temp = 1;
             print(temp);
           });
         }, child: Text('back')),

           
         Positioned(
           
           left: 100,
           child: ElevatedButton(
           onPressed: () async {
                   itch = 'Head';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
           },
            child: Text('0',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           left: 10,
           top : 200,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Upper extremity';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('1',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           right: 10,
           top : 200,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Upper extremity';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('2',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           left: 65,
           bottom: 150,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Lower extremity';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('3',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           right: 65,
           bottom: 150,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Lower extremity';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('4',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           right: 100,
           bottom: 350,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Torso';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('5',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
               


       ]),
      ) : Container(
        margin:EdgeInsets.only( top : 40,left:50, right:50, bottom:100),
        width: double.infinity,
        height: double.infinity,
       decoration: const BoxDecoration( 
          image: DecorationImage(
         image: AssetImage("images/a3.jpg"),
         fit: BoxFit.cover),
          ),
       child: Stack(children: [
         ElevatedButton(onPressed: (){
           setState(()  {
             
             temp = 0;
             print(temp);
           });
         }, child: Text('front')),

         Positioned(
           left: 100,
           child: ElevatedButton(
           onPressed: () async {
                   itch = 'Head';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
           },
            child: Text('0',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           left: 10,
           top : 200,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Upper extremity';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('1',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           right: 10,
           top : 200,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Upper extremity';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('2',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           left: 65,
           bottom: 150,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Lower extremity';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('3',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           right: 65,
           bottom: 150,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Lower extremity';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('4',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),
//----------------------------------------------------------------
           Positioned(
           right: 100,
           bottom: 350,
           child: ElevatedButton(
           onPressed: () async {
                    itch = 'Torso';
                   await savePref();
                   Navigator.of(context).pushReplacementNamed('condition3');
                  },
            child: Text('5',style:TextStyle(color:Colors.red,fontSize:20,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
            )   ),
           ),                   

       ]),
      )
    );
  }
}