import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restroapp/button.dart';
import 'package:restroapp/colors.dart';
import 'package:restroapp/modules/food.dart';
import 'package:restroapp/screens/shop.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    void removeFromCart(Food food , BuildContext context){
     final shop = context.read<Shop>();
     shop.removeFromCart(food);
    }
    return Consumer<Shop>(builder: (context,value,child)=>Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: Text('Cart Page'),
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context,index){
               final Food food = value.cart[index];
               final String foodName = food.name;
               final String foodPrice = food.price;
               return Container(
                 decoration:  BoxDecoration(color: Color.fromARGB(189, 140, 94, 91),borderRadius: BorderRadius.circular(12)),
                 margin:const EdgeInsets.only(left: 20,right: 20,top: 20),
                 child: ListTile(
                   title:Text(foodName,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 19),) ,
                   subtitle: Text('₹$foodPrice',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),),
                   trailing: IconButton(
                     onPressed: (){
                       removeFromCart(food,context);
                     },
                     icon: Icon(Icons.delete,color: Colors.white,),
                   ),
                 ),
               );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyButton(text: 'Pay now', onTap: (){
              showDialog(
                barrierDismissible: false,
                  context: context, builder:(context)=>AlertDialog(
                title: Text("Haa muje pata tha tum yahi check karoge",style: TextStyle(color: Colors.white),),
                actions: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.done,color: Colors.white,))
                 ],
                content:const Text("Bhai mere tu bata tu kaha pay karega haa ",style: TextStyle(
                  color: Colors.white
                ),textAlign: TextAlign.center,),
                backgroundColor: primaryColor,
              ) );
            }),
          )
        ],
      ),
    )
    );
  }
}
