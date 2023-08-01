import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/get_products_cubit/get_products_cubit.dart';
import '../../data/model/products_models.dart';
import '../widget/build_product_by_id_details.dart';

class ProductDetails extends StatefulWidget {
  final int id;

  const ProductDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductsModel? productsModel;

  @override
  void initState() {
    BlocProvider.of<GetProductsCubit>(context).getProductById(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsError) {
              return Center(child: Text(state.errMessage));
            } else if (state is ProductByIdSuccess) {
              productsModel = state.product;
              return BuildProductByIdDetails(productsModel: state.product);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
