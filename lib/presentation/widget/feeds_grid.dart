import 'package:flutter/material.dart';

import '../../data/model/products_models.dart';
import 'feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productsModel})
      : super(key: key);
  final List<ProductsModel> productsModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productsModel.isNotEmpty ? 2 : 0, //productsModel.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (ctx, index) {
        return FeedsWidget(productModel: productsModel[index]);
      },
    );
  }
}
