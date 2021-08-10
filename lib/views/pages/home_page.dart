import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopingx/controllers/product_controller.dart';
import 'package:shopingx/views/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  static const String id = 'HomePage';
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopingX',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.view_list_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.grid_view),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                      product: productController.productList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
            }),
          ),
        ],
      ),
    );
  }
}
