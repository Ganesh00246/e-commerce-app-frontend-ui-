import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food.dart';
class FoodTile extends StatelessWidget {
  final Food food;
  final VoidCallback onTap;
  const FoodTile({super.key,required this.food,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin:const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(food.imagePath,height: 140,),
            const SizedBox(height: 20,),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20),
            ),
            SizedBox(width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₹'+food.price,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                ),),
                Row(

                  children: [
                    Icon(Icons.star,color: Colors.yellow[800],),
                    Text(food.rating,style: TextStyle(color: Colors.grey),),
                  ],
                )
              ],
            ),
            ),

          ],
        ),
      ),
    );
  }
}
