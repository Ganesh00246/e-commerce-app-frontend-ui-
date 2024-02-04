import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  final String name;
  final String imgurl;
  final double price;
  final String offeres;
  final Function onTap;

  const ProductCard(
      {super.key, required this.name, required this.imgurl, required this.price, required this.offeres, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imgurl,
                width: double.maxFinite,
                height: 120,
                fit: BoxFit.fill,
              ), const SizedBox(height: 3,),
              Text(name, style: TextStyle(
                  fontSize: 14, overflow: TextOverflow.ellipsis),),
              const SizedBox(height: 3,),
              Text(price.toString(), style: TextStyle(
                  fontSize: 14, overflow: TextOverflow.ellipsis),),
              const SizedBox(height: 3),
              Container(
                height: 19,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(offeres),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
