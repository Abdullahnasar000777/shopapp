import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/controller/provider/product_provider.dart';
import 'package:shopapp/view/home/widget/productitem.dart';

class GridVieww extends StatelessWidget {
  final bool showOnly;
  const GridVieww({super.key, required this.showOnly});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final product = showOnly ? productData.favoriteItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: product.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: product[index],
          child: const ProductItem(),
        );
      },
    );
  }
}
