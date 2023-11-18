import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wealth_wizard/bottom/bottombar.dart';
import 'package:wealth_wizard/main.dart';

final usernameController = TextEditingController();

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();

  File? file;
  ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    getStoredImage();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login icon.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken))),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      child: ClipOval(
                        child: file == null
                            ? Container(
                                width: 100,
                                height: 100,
                                color: Colors.grey,
                                child: Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )
                            : Image.file(
                                file!,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      getcam();
                    },
                    color: Color.fromARGB(255, 59, 95, 112),
                    child: Text(
                      'Take From Camera',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          getgall();
                        },
                        color: Color.fromARGB(255, 59, 95, 112),
                        child: Text(
                          'Take From Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Form(
                key: _formKey,
                child: SizedBox(
                  height: screenHeight * .08,
                  width: screenWidth * .8,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    controller: usernameController,
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    checkLogin(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 59, 95, 112),
                    ),
                    width: size.height * 0.18,
                    height: size.width * 0.12,
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontFamily: 'f',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async {
    final username = usernameController.text;
    final sharedpref = await SharedPreferences.getInstance();
    final usernameBox = await Hive.openBox('username_box');
    await usernameBox.put('username', username);

    if (file != null) {
      final imageBox = await Hive.openBox('image_box');
      imageBox.put('imagePath', file!.path);
    }
    await sharedpref.setBool(saveKeyName, true);
    await sharedpref.setString('username', username);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => BottomBar(
          username: usernameController.text,
          file: file!.path,
        ),
      ),
    );
  }

  getcam() async {
    var img = await imagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      setState(() {
        file = File(img.path);
      });
    }
  }

  getgall() async {
    var img = await imagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        file = File(img.path);
      });
    }
  }

  getStoredImage() async {
    final sharedpref = await SharedPreferences.getInstance();
    final imagePath = sharedpref.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        file = File(imagePath);
      });
    }
  }
}
