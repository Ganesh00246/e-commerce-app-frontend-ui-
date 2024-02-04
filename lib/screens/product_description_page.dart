import 'package:flutter/material.dart';
class ProductDescripterPage extends StatelessWidget {
  const ProductDescripterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 340,
                width: double.infinity,
                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe7ZbQ92u1JD-JgD4Kkhkju83p_uvKelP5jw&usqp=CAU',
                fit: BoxFit.cover,
                ),
              ),
              Text('Puma Footware',style: TextStyle(fontSize: 19),),
              const SizedBox(height: 9,),
              Text('Description'),
              const SizedBox(height: 9,),
              Text('Rs:300',style: TextStyle(color: Colors.green,fontSize: 19),),
              const SizedBox(height: 9,),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter you Address',
                  label: Text("Enter Current Address"),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  ),
                    onPressed: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Buy Now',style: TextStyle(fontSize: 20),)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
