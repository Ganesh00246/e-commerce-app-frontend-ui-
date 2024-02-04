import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:restroapp/button.dart';
import 'package:restroapp/screens/menu_page.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255,138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           const SizedBox(height: 25,),
            Text(
                "MOMO'S MAN",style: GoogleFonts.dmSerifDisplay(
                fontSize: 30,
                color: Colors.white,
              ),),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('assets/images/momoes.png'),
            ),
            Text('THE TASTE OF DELHI FOOD',style: GoogleFonts.dmSerifDisplay(
              fontSize: 44,
              color: Colors.white
            ),),
            const SizedBox(height: 6,),
            Text("Feel the taste of the most popular Delhi food from anywhere and anytime.",
            style: TextStyle(color: Colors.grey[300],height: 1.9,fontSize: 19),
            ),
            MyButton(
              text: 'Get Started',
              onTap: (){
                 Navigator.push(context,PageTransition(child:MenuPage(), type: PageTransitionType.bottomToTop) );
              },
            ),
          ],
        ),
      ),
    );
  }
}
