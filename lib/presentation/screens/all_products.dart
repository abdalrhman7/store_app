import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/get_products_cubit/get_products_cubit.dart';
import '../../data/model/products_models.dart';
import '../widget/feeds_widget.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  int offset = 0;
  List<ProductsModel> products = [];

  final _scrollController = ScrollController();

  void setupScrollController(context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          BlocProvider.of<GetProductsCubit>(context)
              .getAllProducts(offset: offset += 10);
        }
      }
    });
  }

  @override
  void initState() {
    BlocProvider.of<GetProductsCubit>(context).getAllProducts();
    setupScrollController(context);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: productsList(),
    );
  }

  Widget productsList() {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
      if (state is GetProductsError) {
        return Center(
          child: Text(state.errMessage),
        );
      } else if (state is GetAllProductSuccess) {
        products.addAll(state.products);
        return GridView.builder(
          itemCount: products.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.7,
          ),
          controller: _scrollController,
          itemBuilder: (context, index) {
            return FeedsWidget(
              productModel: products[index],
            );
          },
        );
      } else {
        return _loadingIndicator();
      }
    });
  }

  Widget _loadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }
}
