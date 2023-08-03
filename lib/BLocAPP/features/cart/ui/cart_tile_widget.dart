import 'package:flutter/material.dart';
import 'package:flutter_1/BLocAPP/features/cart/bloc/cart_bloc_bloc.dart';

import '../../home/models/home_product_model.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  final ProductDataModel productDataModel;
  final CartBlocBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal, width: 4),
        borderRadius: BorderRadiusDirectional.circular(15),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 2),
              image: DecorationImage(
                image: NetworkImage(productDataModel.imageUrl),
                fit: BoxFit.cover, // You can set the desired fit option here
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productDataModel.description),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.shade900),
                    margin: EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(
                            productDataModel: productDataModel));
                      },
                      icon: Icon(
                        Icons.delete_forever_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "\$ " + productDataModel.price.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
