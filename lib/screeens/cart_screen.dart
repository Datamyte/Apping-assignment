// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:apping/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalQuantity = 0;
  double totalPrice = 0;

  @override
  initState() {
    super.initState();
    allproducts.forEach((element) {
      setState(() {
        totalQuantity += element.quantity;
        totalPrice += (element.quantity * element.price);
      });
    });
  }
  // if (itemQuantity < maxquantity) {
  //     setState(() {
  //       itemQuantity += 1;
  //     });
  //   }
  // }

  // void decreaseQuantity() {
  //   while (itemQuantity > 1) {
  //     setState(() {
  //       itemQuantity -= 1;
  //     });
  //   }
  // }

  updatePrice() {
    //update total price and quantity when product quantity chnages
  }

  List<Product> allproducts = [
    Product(
        "Maine Beach-organic ligurian\nhoney hand & body wash\n有機利古里亞蜂蜜手部及身\n體沐浴乳",
        240.00,
        'assets/images/bottleone.jpg',
        1),
    Product(
        "Maine Beach-organic ligurian\nhoney hand & body wash\n有機利古里亞蜂蜜手部及身\n體沐浴乳",
        240.00,
        'assets/images/bottletwo.jpg',
        2)
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(color: Colors.yellow.shade100
        //     // image: DecorationImage(
        //     //     image: AssetImage('assets/images/pattern2.jpg'),
        //     //     fit: BoxFit.cover)
        //     ),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome To Your Cart',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff572D2F),
                )),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 30),
              height: size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffC6ACAD),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Review Order",
                      style: TextStyle(
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text('Adress'),
                    const Text('Confirm Order'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Container(
              // decoration: BoxDecoration(color: Colors.deepPurple.shade300),
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Row(
                  children: [
                    const Text(
                      'Product',
                      style: TextStyle(
                          color: Color(0xff572D2F),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: size.width * 0.318),
                    const Text(
                      'Price',
                      style: TextStyle(
                          color: Color(0xff572D2F),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: size.width * 0.11),
                    const Text(
                      'Qunatity',
                      style: TextStyle(
                          color: Color(0xff572D2F),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: size.width * 0.1),
                    const Text(
                      'Subtotal',
                      style: TextStyle(
                          color: Color(0xff572D2F),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: size.width * 0.1),
                  ],
                ),
              ),
            ),
            const Divider(),

          ///////////////////////////////////////////////////////////////////////  Listviewbuilder
             
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  var tempItem = allproducts[index];
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.05,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                height: size.height * 0.2,
                                width: size.width * 0.05,
                                child: Image(
                                  image: AssetImage(tempItem.productImageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              tempItem.name,
                              style: const TextStyle(
                                color: Color(0xff825C5D),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(width: size.width * 0.15),

                        Text(tempItem.price.toString(),
                            style: const TextStyle(
                              color: Color(0xff825C5D),
                            )),
                        SizedBox(width: size.width * 0.1),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              color: const Color(0xff825C5D),
                              padding: const EdgeInsets.only(bottom: 30),
                              onPressed: tempItem.quantity > 0
                                  ? () {
                                      setState(() {
                                        totalPrice =
                                            totalPrice - tempItem.price;
                                        if (totalQuantity >= 1) {
                                          tempItem.quantity -= 1;
                                          totalQuantity = totalQuantity - 1;
                                        }
                                      });
                                    }
                                  : null,
                              icon: const FaIcon(
                                FontAwesomeIcons.minus,
                                size: 14,
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  tempItem.quantity.toString().padLeft(2, '0'),
                                )),
                            IconButton(
                              color: const Color(0xff825C5D),
                              padding: const EdgeInsets.only(bottom: 30),
                              onPressed: () {
                                setState(() {
                                  tempItem.quantity += 1;
                                  totalPrice = totalPrice + tempItem.price;
                                  totalQuantity = totalQuantity + 1;
                                });
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.plus,
                                size: 14,
                              ),
                            )
                          ],
                        ),
                        //can use NumberFormat from import 'package:intl/intl.dart'; // or add if condition to check wheather number less thar 10 and then add padleft
                        SizedBox(width: size.width * 0.1),
                        SizedBox(
                          width: size.width * 0.05,
                          child: Text(
                              (tempItem.price * tempItem.quantity).toString(),
                              style: const TextStyle(
                                color: Color(0xff825C5D),
                              )),
                        ),
                        SizedBox(width: size.width * 0.1),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          width: MediaQuery.of(context).size.width * 0.07,
                          height: MediaQuery.of(context).size.height * 0.05,
                          margin: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff825C5D),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(16.0),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(fontSize: 10),
                                  ),
                                  onPressed: null,
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Remove',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.delete_outline,
                                        size: 19,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: allproducts.length,
              ), ///////////////////////////////////////////end of listview builder
            ),
            const Divider(),
            SizedBox(
                child: Row(
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                      color: Color(0xff572D2F), fontWeight: FontWeight.bold),
                ),
                SizedBox(width: size.width * 0.47),
                Text(
                  '${totalQuantity.toString()} items',
                  style: const TextStyle(
                    color: Color(0xff572D2F),
                  ),
                ),
                SizedBox(width: size.width * 0.13),
                Text(
                  totalPrice.toString(),
                  style: const TextStyle(
                    color: Color(0xff572D2F),
                  ),
                ),
                SizedBox(width: size.width * 0.125),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  width: MediaQuery.of(context).size.width * 0.07,
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                              color: Color(0xff825C5D),
                            ),
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 10),
                            ),
                            onPressed: null,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Next',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
