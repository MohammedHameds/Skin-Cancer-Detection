import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite/tflite.dart';

class Cancer_Image extends StatefulWidget {
  const Cancer_Image({ Key? key }) : super(key: key);

  @override
  State<Cancer_Image> createState() => _Cancer_ImageState();
}

class _Cancer_ImageState extends State<Cancer_Image> {
  int image_loaded = 0;
  
   
  bool _loading = true;
  late File _image;
  late List _output;
  String label_output = '';
  String confidence_output = '';  
  final picker = ImagePicker(); //allows us to pick image from gallery or camera
 savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('label', label_output);
      prefs.setString('confidence', confidence_output);
      
      print('image analysis');
    });
  }

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
    var output = await Tflite.runModelOnImage(
  path: image.path,
  numResults: 1,
  //threshold: 0.05,
  imageMean: 127.5,

  imageStd: 127.5,  

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
    var image = await picker.pickImage(source: ImageSource.gallery,maxHeight: 224,maxWidth:244);
    if (image == null) return null;
     print(image);

    setState(() {
      _image = File(image.path);
      image_loaded = 1;
    });
    classifyImage(_image);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Container(
          alignment: Alignment.center,
          child: Text('image analysis',style : TextStyle ( fontSize: 30))
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('test');
            }, icon: Icon(Icons.arrow_back_outlined)
            ),
            actions: [
           IconButton(onPressed: (){
             Navigator.of(context).pushNamed('home');
           }, icon: Icon(Icons.cancel)),
            
        ],
      ),

      body: Container(
        color: Colors.white,
        child: Container(
          

          margin:EdgeInsets.only(top: 15),
          

          // alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                child: Center(
                  child: _loading == true
                      ? Container(
                        padding:EdgeInsets.all(10),
                        height :350,
                        width :370,
                        child: Image.asset('assets/c4.gif',fit: BoxFit.fill,),

                      ) 

                      :  Container(
                                padding:EdgeInsets.all(10),
                                height :350,
                                width :370,
                                // height: MediaQuery.of(context).size.width,
                                // width: MediaQuery.of(context).size.width ,
                                child: ClipRRect(
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ), 
                ),
              ),
                

              


              Container(
                width: 300,                
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 111, 0, 255),
                    fixedSize: Size(250, 100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                   try { 
                      setState(()  {
                        label_output = '${_output[0]['label']}';
                         confidence_output =  (double.parse(_output[0]["confidence"]. toString()) *100).toStringAsFixed(0)+'%';
                         print('${_output[0]['confidence']}');
                           
                      });

                    await savePref();
                   } 
                   
                   catch (e) {

                 AwesomeDialog(
                  context: context,
                   dialogType: DialogType.ERROR,
                    animType: AnimType.BOTTOMSLIDE,
                   title: 'Image Error',
                   desc: 'pls sir try to add a valid image',
                   btnCancelOnPress: () { },
                    btnOkOnPress: () {
                    pickGalleryImage();
                      },
                    )..show();
 
                     print('enter another image');
                     label_output = '';
                     confidence_output = '';
                   }

                   if (label_output == 'Not skin image'){
                    AwesomeDialog(
                  context: context,
                   dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                   title: 'Classification Image',
                   desc: 'pls sir try to add another image coz our algorithm doesn\'t think this is an image of huaman skin ',
                   btnCancelOnPress: () { },
                    btnOkOnPress: () {
                          //  pickGalleryImage();
                      },
                    )..show();
                   }

                   else if ( image_loaded == 0){
                     print('no image');
                   }
                   else{
                      Navigator.of(context).pushReplacementNamed('humanbody');
                   }
                  
                  },
                   child: Text('Classifiy',style : TextStyle ( fontSize: 30,color: Colors.white),)
                   ),
                   ),

       //----------------------------------------------------------------
                Container(
                width: 300,                
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 136, 13, 13),
                    fixedSize: Size(250, 100),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  onPressed: () async {
                    pickGalleryImage();
                   
                  },
                   child: Text('Pick From Gallery',style : TextStyle ( fontSize: 30,color: Colors.white),)
                   ),
          
                
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
