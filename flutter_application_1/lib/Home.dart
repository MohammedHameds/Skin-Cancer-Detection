import 'package:flutter/material.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String error = 'Please try again';
  bool _loading = true;
  late File _image;
  late List _output;
  String label_output = '';
  String confidence_output = '';  
  final picker = ImagePicker(); //allows us to pick image from gallery or camera

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
  path: image.path,
  numResults: 1,
  //threshold: 0.05,
  imageMean:127.5,

  imageStd: 127.5,   //127.5,

    );
    setState(() {
      _output = output!;
      _loading = false;
    });
  }




  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );
  }

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    try {
      classifyImage(_image);

     
      
    } catch (e) {
      print('image classification error');
      label_output = '';
      confidence_output = '';

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Colors.yellow,

        title:Container(
          alignment:Alignment.center,
          child: Text('Skin Cancer',style:TextStyle(fontSize:30,color:Colors.black),),),),
      body: Container(
        color: Colors.white,

        child: Container(
          alignment: Alignment.center,


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
         Container(
           color: Colors.red,
                width : 300,
                height : 50,
                padding:EdgeInsets.all( 10),
                child: Text('$label_output',style:TextStyle(fontSize:25,color:Colors.white),textAlign:TextAlign.center),
                ),

         
         Container(
           color: Colors.white,
                width : 300,
                height : 60,
                padding:EdgeInsets.all( 10),
                child: Text('$confidence_output',style:TextStyle(fontSize:30,color:Colors.black),textAlign:TextAlign.center),
                ),

     
              
              Container(
                child: Center(
                  child: _loading == true
                      ? Container(
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.7,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset('assets/1.jpg'
                                    ,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ) //show nothing if no picture selected
                      : Container(
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.7,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                ),
              ),
              Container(
                width : 200,
                height : 100,
                padding:EdgeInsets.only(top:10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(

                  ),
                  child: Text("classify",style: TextStyle(fontSize:30),),
                  onPressed:(){
                   
                      
                      setState(() {
                        // label_output = '${_output[0]['label']}';
                        // confidence_output = (double.parse(_output[0]["confidence"]. toString()) *100).toStringAsFixed(0)+'%';
                       try {
                          if (_output == []){
                               print('output is empy');
                        }
                        else {
                          if (_output[0]['confidence'] > 0.50 )
                                {
                        //  label_output = '${_output[0]['label']}';
                         label_output = 'Malignant - Dangerous';
                        confidence_output = 'Accuracy :'+ (double.parse(_output[0]["confidence"]. toString()) *100).toStringAsFixed(0)+'%';
                         
                                }
                               else {
                         label_output = 'Benign - No Danger ';
                         confidence_output = 'Accuracy :'+  double.parse('${100-_output[0]['confidence'] *100}').toStringAsFixed(0)+'%';
                        // confidence_output = '${100-_output[0]['confidence'] *100}';
                        // confidence_output = 'accuracy :'+ (double.parse(_output[0]["confidence"]. toString()) *100).toStringAsFixed(0)+'%';

                               } 

                          
                          // print('${_output[0]['confidence']}');

                        }
                       } catch (e) {
                         print('*******************************');
                         label_output = error;
                         confidence_output = 'Image is failed';
                         print(_output);

                       }
                        
                                
                      });
                    
                   
                                               
                  } ),
              ),
              Container(
                width : 200,
                height : 100,
                padding:EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(

                  ),
                  child: Text("Pick Image",style: TextStyle(fontSize:30),),
                  onPressed: 
                     pickGalleryImage
                     
                     )),
            
            ],
          ),
        ),
      ),
      
    );
  }
}
