import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restroapp/button.dart';
import 'package:restroapp/colors.dart';

import '../screens/shop.dart';
import 'food.dart';
class FoodDetailedPage extends StatefulWidget {
  final Food food;
  const FoodDetailedPage({super.key,required this.food});

  @override
  State<FoodDetailedPage> createState() => _FoodDetailedPageState();
}

class _FoodDetailedPageState extends State<FoodDetailedPage> {
   var quantityCount = 0;
   void decrementQuantity(){
     setState(() {
       if(quantityCount>0){
         quantityCount--;
       }else{
         quantityCount;
       }
     });
   }
   void incrementQuantity(){
     setState(() {
       quantityCount ++;
     });
   }
   void addToCart(){
     if(quantityCount>0){
       final shop= context.read<Shop>();
       shop.addTocart(widget.food, quantityCount);
       showDialog(
           barrierDismissible: false,
           context: context, builder:(context)=> AlertDialog(
         content: const Text('Successfully added to Cart',style: TextStyle(
           color: Colors.white,
         ),textAlign: TextAlign.center,
         ),
         backgroundColor: primaryColor,
         actions: [
           IconButton(onPressed: (){
             Navigator.pop(context);
             Navigator.pop(context);
       }, icon: const Icon(Icons.done,color: Colors.white,)
           ),
         ],
       ));
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.food.name,style: TextStyle(color: Colors.grey[900]),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        //see pop operation should happen here
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.grey[600],),
          ),
      ),
      body: Column(
        children: [
          // const SizedBox(height: 10,),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView(
                  children: [
                    Image.asset(widget.food.imagePath,height: 200,),
                    const SizedBox(height: 25,),
                    Row(
                      children: [
                        Icon(
                          Icons.star,color: Colors.yellow[800],
                          size: 30,
                        ),
                        const SizedBox(width: 5,),
                        Text(widget.food.rating,style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 19
                        ),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text(widget.food.name,style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,

                    ),),
                    const SizedBox(height: 10,),
                    Text('Description',style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize:19,
                    ),),
                    const SizedBox(height: 10,),
                    Text('Momo is a type of steamed filled dumpling in Tibetan and Nepali cuisine that is also popular in neighbouring Bhutan and India. Momo is usually served with a sauce known as achar influenced by the spices and herbs used within many South Asian cuisines.'
                    ,style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        height: 2,
                      ),
                    )
                  ],
                ),
              )
          ),
           Container(
             color: primaryColor,
             child: Padding(
               padding: const EdgeInsets.all(26.0),
               child: Column(

                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Text('₹'+widget.food.price,style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 19,
                       ),),
                       Row(
                         children: [
                           Container(
                             child: IconButton(
                               onPressed: decrementQuantity,
                               icon: Icon(Icons.remove),
                             ),
                             decoration: BoxDecoration(
                              color: Color.fromARGB(189, 140, 94, 91),
                               shape: BoxShape.circle,
                             ),
                           ),
                           SizedBox(
                             width: 40,
                             child: Center(
                               child: Text(quantityCount.toString(),
                               style:const TextStyle(
                                 color: Colors.white,
                                 fontSize: 19,
                                 fontWeight: FontWeight.bold
                               ),
                               ),
                             ),
                           ),
                           Container(
                             child: IconButton(
                               onPressed: incrementQuantity,
                               icon: Icon(Icons.add),
                             ),
                             decoration: BoxDecoration(
                               color: Color.fromARGB(189, 140, 94, 91),
                               shape: BoxShape.circle,
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
                   const SizedBox(height: 25,),
                   MyButton(text: 'Add to Cart', onTap:addToCart),
                 ],
               ),
             ),
           )
        ],
      ),

    );
  }
}
