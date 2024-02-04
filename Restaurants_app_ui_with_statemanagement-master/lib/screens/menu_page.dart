import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restroapp/colors.dart';
import 'package:restroapp/modules/food.dart';
import 'package:restroapp/modules/food_detail_page.dart';
import 'package:restroapp/modules/food_tile.dart';
import 'package:restroapp/screens/shop.dart';

import '../button.dart';
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetailPage(int index){
    final shop = context.read<Shop>();
    final FoodMenu =shop.foodMenu;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodDetailedPage(
      food: FoodMenu[index],
    )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final FoodMenu =shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        foregroundColor: Colors.grey[800],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,

        ),
        centerTitle: true,
        title: Text("Momoes",style: TextStyle(

        ),),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.card_travel_rounded,))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
            decoration: BoxDecoration(
                color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Get 32% Promo',style: GoogleFonts.dmSerifDisplay(
                      fontSize:20,
                      color: Colors.white,
                    ),),
                    const SizedBox(height: 20,),
                    MyButton(
                      text: "Redeem",
                      onTap: (){},
                    ),
                  ],
                ),
                Image.asset('assets/images/momo1.png',height: 100,)
              ],
            ),
          ),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search momo...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white)
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Food Menu',style: TextStyle(color: Colors.grey[800],fontSize: 19,fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 10,),

          Expanded(child: ListView.builder(
            itemCount: FoodMenu.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>
                  FoodTile(food: FoodMenu[index],
                    onTap: ()=>navigateToFoodDetailPage(index),
                  ),
          )),
          const SizedBox(height: 25,),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25,right: 25,bottom: 25),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/momo1.png',height: 60,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Veg Momoes',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text('₹242',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
                Icon(Icons.favorite_border,color: Colors.black38,size: 30,)
              ],
            ),
          )
        ],
      ),

    );
  }
}
