import 'package:carousel_slider/carousel_slider.dart';
import 'package:digi_shop_app/api/rest_client.dart';
import 'package:digi_shop_app/config/app_setting.dart';
import 'package:digi_shop_app/model/base_model.dart';
import 'package:digi_shop_app/utility/color_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio dio = Dio();
  late RestClient restClient;
  late Future<BaseModel> getHomeData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    restClient = RestClient(dio);
    getHomeData = restClient.home();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('دیجی شاپ',style:  TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: 'IranSans')),

          ],

        ),
        backgroundColor:  ColorUtil.appBar,
      ),
      endDrawer: Drawer(

        child: ListView(

          children: [

            UserAccountsDrawerHeader(accountName: Text(''),
                accountEmail: Text('') ,
            decoration: BoxDecoration(
              color: ColorUtil.appBar
            ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('خانه' ,
                  style:TextStyle(
                      color: Colors.grey,

                      fontFamily: 'IranSans') ,),

                IconButton(onPressed: (){},
                    icon: Icon(Icons.home) ,
                color: Colors.grey,),


              ],

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('لیست دسته بندی ها' ,
                  style:TextStyle(
                      color: Colors.grey,

                      fontFamily: 'IranSans') ,),

                IconButton(onPressed: (){},
                  icon: Icon(Icons.category) ,
                  color: Colors.grey,),


              ],

            ),
            Divider(height: 5,),
           GestureDetector(

             onTap: ()async{

               bool state = await AppSetting.isUserLogged();
               if(state){

                 print('cart');
                 Get.toNamed('/cart');

               }else {
                 Get.toNamed('/login');
               }



             },
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text('سبد خرید' ,
                   style:TextStyle(
                       color: Colors.grey,

                       fontFamily: 'IranSans') ,),

                 IconButton(onPressed: (){},
                   icon: Icon(Icons.add_shopping_cart) ,
                   color: Colors.grey,),


               ],

             ),

           ),
            Divider(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('تنظیمات' ,
                  style:TextStyle(
                      color: Colors.grey,

                      fontFamily: 'IranSans') ,),

                IconButton(onPressed: (){},
                  icon: Icon(Icons.settings) ,
                  color: Colors.grey,),


              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('سوالات متداول' ,
                  style:TextStyle(
                      color: Colors.grey,

                      fontFamily: 'IranSans') ,),

                IconButton(onPressed: (){},
                  icon: Icon(Icons.settings) ,
                  color: Colors.grey,),


              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('درباره ما' ,
                  style:TextStyle(
                      color: Colors.grey,

                      fontFamily: 'IranSans') ,),

                IconButton(onPressed: (){},
                  icon: Icon(Icons.settings) ,
                  color: Colors.grey,),


              ],

            ),

          ],

        ),


      ),
      body: SingleChildScrollView(

        child: Container(

          width: Get.width,
          child:FutureBuilder<BaseModel>(future: getHomeData,builder: (context, snapshot){

            if(snapshot.hasData){
              return Container(

                width: Get.width,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [

                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                      ),
                      items: snapshot.data!.news?.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                      NetworkImage('${i.icon}'))),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,right: 10),
                      child: Text('موبایل های بروز' , style: TextStyle(
                          fontFamily: 'IranSans'
                      ),),
                    ),
                    Container(
                      width: Get.width,
                      height:  260.0,
                      child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.mobile!.length,
                          itemBuilder: (context, index) {
                            return
                              GestureDetector(
                                onTap: (){
                                  /*Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  VideoPlayerPage(videoModel: snapshot.data!.mobile![index])));*/
                                  Get.toNamed('/product_detail', arguments: snapshot.data!.mobile![index] );
                                },
                                child: Card(
                                  elevation: 8.0,
                                  child:  Container(

                                    height: 220.0,
                                    width: 160.0,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          '${snapshot.data!.mobile![index].icon}',
                                          height: 180,width: 160,fit: BoxFit.fill,),
                                        Text(
                                          '${snapshot.data!.mobile![index].title}',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'IranSans'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,right: 10),
                      child: Text('برترین های آرایشی و بهداشتی' , style: TextStyle(
                          fontFamily: 'IranSans'
                      ),),
                    ),

                    Container(
                      width: Get.width,
                      height:  260.0,
                      child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.makeup!.length,
                          itemBuilder: (context, index) {
                            return
                              GestureDetector(
                                onTap: (){
                                  /*Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  VideoPlayerPage(videoModel: snapshot.data!.mobile![index])));*/
                                  Get.toNamed('/product_detail', arguments: snapshot.data!.makeup![index] );
                                },
                                child: Card(
                                  elevation: 8.0,
                                  child:  Container(

                                    height: 220.0,
                                    width: 160.0,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          '${snapshot.data!.makeup![index].icon}',
                                          height: 180,width: 160,fit: BoxFit.fill,),
                                        Text(
                                          '${snapshot.data!.makeup![index].title}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'IranSans'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                          }),
                    ),


                    Container(
                      margin: EdgeInsets.only(top: 10,right: 10),
                      child: Text('تخفیفان' , style: TextStyle(
                          fontFamily: 'IranSans'
                      ),),
                    ),

                    Container(
                      width: Get.width,
                      height:  260.0,
                      child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.discount!.length,
                          itemBuilder: (context, index) {
                            return
                              GestureDetector(
                                onTap: (){
                                  /*Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  VideoPlayerPage(videoModel: snapshot.data!.mobile![index])));*/
                                  Get.toNamed('/product_detail', arguments: snapshot.data!.discount![index] );
                                },
                                child: Card(
                                  elevation: 8.0,
                                  child:  Container(

                                    height: 220.0,
                                    width: 160.0,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          '${snapshot.data!.discount![index].icon}',
                                          height: 180,width: 160,fit: BoxFit.fill,),
                                        Text(
                                          '${snapshot.data!.discount![index].title}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'IranSans'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                          }),
                    ),


                    Container(
                      margin: EdgeInsets.only(top: 10,right: 10),
                      child: Text('پیشنهادات شگفت انگیز' , style: TextStyle(
                          fontFamily: 'IranSans'
                      ),),
                    ),

                    Container(
                      width: Get.width,
                      height:  260.0,
                      child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.AmazingOffer!.length,
                          itemBuilder: (context, index) {
                            return
                              GestureDetector(
                                onTap: (){
                                  /*Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  VideoPlayerPage(videoModel: snapshot.data!.mobile![index])));*/

                                  Get.toNamed('/product_detail', arguments: snapshot.data!.AmazingOffer![index] );
                                },
                                child: Card(
                                  elevation: 8.0,
                                  child:  Container(

                                    height: 220.0,
                                    width: 160.0,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          '${snapshot.data!.AmazingOffer![index].icon}',
                                          height: 180,width: 160,fit: BoxFit.fill,),
                                        Text(
                                          '${snapshot.data!.AmazingOffer![index].title}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'IranSans'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                          }),
                    ),

                  ],

                ),

              );

            }else if(snapshot.hasError){
              return Text('Error');
            }
            else {
              return Container(
                height: Get.height,
                width: Get.width,
                child: Center(child: CircularProgressIndicator(),),

              );
            }

          }),

        ),

      ),
    );
  }
}
