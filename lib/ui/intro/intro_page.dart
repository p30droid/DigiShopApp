
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) {

      Get.toNamed('/home');

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Image.asset('assets/images/splash.jpg' ,
        fit: BoxFit.fill,height: Get.height,width: Get.width,),

    );
  }
}
