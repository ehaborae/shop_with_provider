import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_provider/models/product_model.dart';

import '../providers/app_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderRepo>(context, listen: true);

    return Container(
      height: 148,
      margin: const EdgeInsetsDirectional.only(
        top: 16,
        start: 16,
        end: 16,
      ),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 10,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: NetworkImage(product.imageUrl),
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : ${product.name}',
                            maxLines: 2,
                          ),
                          Text(
                            'Price : \$ ${product.price}',
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (provider.faveProducts.contains(product)) {
                          provider.removeFromFave(product);
                        } else {
                          provider.addToFave(product);
                        }
                      },
                      icon: Icon(provider.faveProducts.contains(product)
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded),
                      color: Colors.redAccent,
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      elevation: MaterialStateProperty.all<double>(0),
                    ),
                    onPressed: () {
                      if (provider.cartProducts.contains(product)) {
                        provider.removeFromCart(product);
                      } else {
                        provider.addToCart(product);
                      }
                    },
                    child: Text(provider.cartProducts.contains(product)
                        ? 'Remove from cart'
                        : 'Add to cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
