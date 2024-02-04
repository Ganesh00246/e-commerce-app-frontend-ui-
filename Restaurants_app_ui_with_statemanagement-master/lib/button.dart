import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MyButton({super.key,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(109, 140, 94, 91),
          borderRadius: BorderRadius.circular(40)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style:const TextStyle(color: Colors.white,fontSize: 19),
            ),
            const SizedBox(width: 8,),
            const Icon(Icons.arrow_forward ,color: Colors.white,size: 25,),
          ],
        ),
      ),
    );
  }
}
