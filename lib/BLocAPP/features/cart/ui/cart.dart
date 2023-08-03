import 'package:flutter/material.dart';
import 'package:flutter_1/BLocAPP/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:flutter_1/BLocAPP/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBlocBloc cartBloc = CartBlocBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),
        centerTitle: true,
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartBloc,
        listenWhen: (previos, current) => current is CartActionState,
        buildWhen: (previos, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccesState:
              final successState = state as CartSuccesState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    cartBloc: cartBloc,
                    productDataModel: successState.cartItems[index],
                  );
                },
              );

            default:
              // Return a default widget or an empty container when other states are encountered
              return Container();
          }
        },
      ),
    );
  }
}
