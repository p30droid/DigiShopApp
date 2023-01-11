import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/cart_model.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static late Database _database;

  Future<Database> get database async {
    _database = await initDb();
    return _database;
  }

  initDb() async {
    return await openDatabase(join(await getDatabasesPath(), "cart.db"),
        onCreate: (db, version) async {
      await db.execute(
          'create table tbl_cart(cartId Integer PRIMARY KEY AUTOINCREMENT , '
          'id varchar(50) , catId Text , catName varchar(50) , title varchar(50) '
              ', icon varchar(50), price varchar(50), rate varchar(50))');
    }, version: 1);
  }

  Future<int> insertTodo(Cart note) async {
    final db = await database;

    var response = await db.rawInsert(
        'insert into tbl_cart(id,catId,catName,title,icon,price,rate)'
        'values(?,?,?,?,?,?,?)',
        [note.id, note.catId, note.catName, note.title, note.icon, note.price, note.rate]);

    return response;
  }

  Future<List<Cart>> getCartList() async {
    final db = await database;

    var response = await db.rawQuery('select * from tbl_cart');
    List<Cart> cartList = [];
    response.forEach((element) {
      Map map = element;

      String id = map['id'];
      String catId = map['catId'];
      String catName = map['catName'];
      String title = map['title'];
      String icon = map['icon'];
      String price = map['price'];
      String rate = map['rate'];

      Cart cartModel =  Cart(id, catId, catName, title, icon, price, rate);
      cartList.add(cartModel);
    });

    return cartList;
  }

  Future<int> deleteCart(int cartId) async {
    final db = await database;

    var result =
        await db.rawDelete('delete from tbl_cart '
            'where id=?', [cartId]);

    return result;
  }



}
