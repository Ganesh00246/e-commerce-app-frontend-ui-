import 'package:ecoapp/controllers/home_controller.dart';
import 'package:ecoapp/screens/product_description_page.dart';
import 'package:ecoapp/widgets/drop_down_btn.dart';
import 'package:ecoapp/widgets/multi_selected_dropdown_btn.dart';
import 'package:ecoapp/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Footware Store", style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold
            ),),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.logout
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                height: 50,
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Chip(label: Text('chip widget')),
                  );
                }, scrollDirection: Axis.horizontal,
                  itemCount: 5,
                ),
              ),
              Row(
                children: [
                  Flexible(child: MultiSelectedDropBtn(
                      items: ['item1', 'item2', 'item3'],
                      onSelectedChanged: (selectedItems) {})),
                  Flexible(child: DropDownBtn(
                      list: ['Rs: Low to heigh', "Rs: Height to Low"],
                      selectedProductItems: 'Sort',
                      Onselected: (selected) {})),

                ],
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8
                    ), itemCount:ctrl.products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        name: ctrl.products[index].name ?? 'No name',
                        imgurl: ctrl.products[index].image ?? 'url',
                        price: ctrl.products[index].price ?? 00,
                        offeres: '30% off',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ProductDescripterPage()));
                        },
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
