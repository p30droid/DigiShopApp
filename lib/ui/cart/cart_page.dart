import 'package:digi_shop_app/database/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/cart_model.dart';
import '../../utility/color_util.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<List<Cart>> cartList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartList = DBProvider.db.getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtil.appBar,
        title: Text(
          'سبد خرید',
          style: TextStyle(
              color: Colors.white, fontSize: 12.0, fontFamily: 'IranSans'),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 6,
                child: Container(
                  height: Get.height,
                  child: FutureBuilder<List<Cart>>(
                    future: cartList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length
                            ,itemBuilder: (context,index){

                           return  Container(
                             height: 100.0,
                             child: Card(
                               child:
                               Container(

                                 width: Get.width,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     Container(
                                       child: Text(
                                         '${snapshot.data![index].title}',
                                         style: TextStyle(
                                             color: Colors.grey,
                                             fontFamily: 'IranSans'),
                                       ),
                                     ),
                                     Container(
                                       child: Text(
                                         ': نام محصول',
                                         style: TextStyle(
                                             color: Colors.black,
                                             fontFamily: 'IranSans'),
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                             ),
                           );

                         });
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  width: Get.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () async {},
                          child: Text(
                            'پرداخت',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'IranSans'),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffef394e),
                              minimumSize: Size(100, 40)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Text(
                              ' }',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18.0,
                                  fontFamily: 'IranSans'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'قیمت',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'IranSans'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
