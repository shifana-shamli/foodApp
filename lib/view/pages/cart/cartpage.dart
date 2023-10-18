import 'package:flutter/material.dart';
import 'package:loginpage/utils/app_color.dart';
import 'package:loginpage/utils/app_constant.dart';

import '../../widgets/app_text_view.dart';
import 'cart_model.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  double calculateTotal() {
    double total = 0;
    for (int i = 0; i < cartList.length; i++) {
      total += double.parse(cartList[i].price) * cartList[i].quantity;
    }

    return total;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
      Container(
        padding: const EdgeInsets.all(30),
        height: 100,
        color: AppColor.greenAccent,
        child: Column(
          children: [
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("TOTAL",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.black),),
            Text("\$${calculateTotal().toStringAsFixed(2)}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.black),),

            ],
            ),

          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColor.black
        ),
        title:  appTextView(name: 'CART PAGE',fontSize: 17),
        centerTitle: true,
        backgroundColor: AppColor.greenAccent,
          ),
      body: SingleChildScrollView(
        primary: true,
        child:ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: cartList.length,
          itemBuilder: (BuildContext context, int index,) {
            void incrementQuantity() {
              setState(() {
               cartList[index].quantity++;
              });
            }
            void decrementQuantity() {
              if (cartList[index].quantity > 1) {
                setState(() {
                  cartList[index].quantity--;
                });
              }
            }


           return Container(
              padding: commonPaddingAll,
              margin: commonPaddingAll,
              decoration: BoxDecoration(
                  color: AppColor.greenAccent,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    child: Image.network(cartList[index].image,
                      height: 100,
                      width: 90,
                    ),),
                  Column(
                    children: [
                      appTextView(name: cartList[index].title,fontSize: 8),
                     dividerSw(),
                      appTextView(name: "Price :${cartList[index].price}",fontSize: 10),

                    ],
                  ),
                  IconButton(onPressed:decrementQuantity,
                      icon: const Icon(Icons.remove)),
                  appTextView(name: "${cartList[index].quantity}"),
                  IconButton(onPressed:incrementQuantity,
                      icon: const Icon(Icons.add)),

                  IconButton(onPressed: (){
                    setState(() {
                      cartList.removeAt(index);
                    });

                  }, icon: const Icon(Icons.delete)),
                ],
              ),
            );
          },)

      ),
    );

  }
}

