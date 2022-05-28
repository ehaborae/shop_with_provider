import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_provider/components/product_item.dart';
import 'package:shop_with_provider/providers/app_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderRepo>(context, listen: true);
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          ProductItem(product: provider.products[index]),
      itemCount: provider.products.length,
    );
  }
}
