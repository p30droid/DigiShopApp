

import 'package:carousel_slider/carousel_slider.dart';
import 'package:digi_shop_app/database/database.dart';
import 'package:digi_shop_app/model/cart_model.dart';
import 'package:digi_shop_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../utility/color_util.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {


  late Product product;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product= Get.arguments;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor:  ColorUtil.appBar,
        title: Text(product.title!, style:  TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontFamily: 'IranSans'),),
      ),

      body: Container(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Column(

              children: [

                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  items: product.gallery?.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                  NetworkImage('${i.img}'))),
                        );
                      },
                    );
                  }).toList(),
                ),
                Text(product.shortDescription!, style:  TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontFamily: 'IranSans'),),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    width: Get.width,
                    child:
                    Card(

                      elevation: 8.0,
                      child:   Center(child:  Text(product.garanti!, style:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontFamily: 'IranSans'),),),

                    ),
                  ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  width: Get.width,
                  child:
                  Card(

                    elevation: 8.0,
                    child:   Center(child:  Text(' برند ${product.brand!}', style:  TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontFamily: 'IranSans'),),),

                  ),
                ),
                Container(
                  child: RatingBar.builder(
                    initialRating: double.parse(product.rate!),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 10 , right: 10),
                  child:   ElevatedButton(onPressed: (){

                    Get.defaultDialog(title: '',content: Text('${product.shortDescription}' ,
                      style:TextStyle(
                          color: Colors.black,

                          fontFamily: 'IranSans') ,) );

                  }, child: Text('توضیحات کامل' ,
                    style:TextStyle(
                        color: Colors.white,

                        fontFamily: 'IranSans') ,) ,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffef394e),
                        minimumSize: Size(100, 40)
                    ),),
                ),

              ],

            ),

            Container(
              color: Colors.white,
              width: Get.width,
              height: 80,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                Container(
                  margin: EdgeInsets.only(left: 10 , right: 10),
                  child:   ElevatedButton(onPressed: ()async{

                    Cart cart= Cart(product.id,product.catId,product.catName,product.title,
                    product.icon,product.price,product.rate);
                  var result = await DBProvider.db.insertTodo(cart);

                  if(result>0){
                    SnackBar snack= SnackBar(content: Text('محصول با موفقیت به سبد خرید اضافه شد' ,
                    style: TextStyle(
                      fontFamily:  'IranSans'
                    ),),
                    backgroundColor: Colors.green,);

                    ScaffoldMessenger.of(context).showSnackBar(snack);

                  }


                  }, child: Text('افزودن' ,
                    style:TextStyle(
                        color: Colors.white,

                        fontFamily: 'IranSans') ,) ,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffef394e),
                      minimumSize: Size(100, 40)
                    ),),
                ),

                  Container(
                    margin: EdgeInsets.only(right: 10),

                    child: Row(

                      children: [

                        Text('${product.price}' ,
                          style:TextStyle(
                              color: Colors.green,
                              fontSize: 18.0,
                              fontFamily: 'IranSans') ,),
                        SizedBox(width: 20,),

                        Text('قیمت' ,
                          style:TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'IranSans') ,),



                      ],

                    ),

                  )

                ],


              ),
            )



          ],

        ),

      ),


    );
  }
}
