import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({ Key? key }) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  String image_path = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:Container(
          alignment: Alignment.center,
          child: Text('about us',style : TextStyle ( fontSize: 30))
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
      
        body:Container(
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Container(
              child: image_path == '' ?
              Container(
                width: 500,
              height: 250,
              decoration: const BoxDecoration( 
                 image: DecorationImage(
                 image: AssetImage("images/team.jpeg"),
                 fit: BoxFit.cover), 
                 ),
              ) 
              :  Container(
                width: 500,
              height: 250,
              child : Image.asset('$image_path', fit: BoxFit.cover)
              ) ,

//------------------------------------------------
            ),
             Container(
               margin: EdgeInsets.symmetric(vertical: 10,),
              width: 500,
              height: 298,
              color:Color.fromARGB(255, 255, 255, 255),
              child :Container(
                margin: EdgeInsets.all(5),
                child: Column(children: [
                  Row(children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          setState(()  {
                            image_path = 'images/basel.jpg';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 245, 118, 224),
                      fixedSize: Size(100, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ),
                         child: Text('Basel Ayman',style:TextStyle(color: Colors.black,fontSize:17))
                         ),
                      ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                           setState(()  {
                            image_path = 'images/augustus.jpg';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 245, 118, 224),
                      fixedSize: Size(100, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ),
                         child: Text('Mohammed Hamed',style:TextStyle(color: Colors.black,fontSize:17))
                         ),
                      ),
                  ]),
                  SizedBox(height: 10,),
                  Row(children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          setState(()  {
                            image_path = 'images/3bslam.gif';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 245, 118, 224),
                      fixedSize: Size(100, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ),
                         child: Text('Mohammed 3bslam',style:TextStyle(color: Colors.black,fontSize:17))
                         ),
                      ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          setState(()  {
                            image_path = 'images/mazen.jpg';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 245, 118, 224),
                      fixedSize: Size(100, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ),
                         child: Text('Mazen Tarek',style:TextStyle(color: Colors.black,fontSize:17))
                         ),
                      ),
                  ]),
                  SizedBox(height: 10,),
                  Row(children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          setState(()  {
                            image_path = 'images/not_found.jpg';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 245, 118, 224),
                      fixedSize: Size(100, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ),
                         child: Text('Zahwa Khaled',style:TextStyle(color: Colors.black,fontSize:17))
                         ),
                      ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          setState(()  {
                            image_path = 'images/not_found.jpg';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 245, 118, 224),
                      fixedSize: Size(100, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ),
                         child: Text('Nada Ahmed',style:TextStyle(color: Colors.black,fontSize:17))
                         ),
                      ),
                  ]),
                  SizedBox(height: 10,),
                  ElevatedButton(
                        onPressed: (){
                          setState(()  {
                            image_path = 'images/team.gif';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                      primary:Color.fromARGB(255, 245, 118, 224),
                      fixedSize: Size(500, 30),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ),
                         child: Text('Team work',style:TextStyle(color: Colors.black,fontSize:17))
                         ),
                      
                ]),
              )
            )
          ]),
        )
    );
  }
}