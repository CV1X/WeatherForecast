import 'package:flutter/material.dart';
import 'package:flutter_1/BLocAPP/features/home/bloc/home_bloc_bloc.dart';
import 'package:flutter_1/BLocAPP/features/cart/ui/cart.dart';
import 'package:flutter_1/BLocAPP/features/home/ui/product_tile_widget.dart';
import 'package:flutter_1/BLocAPP/features/wishlist/ui/wishlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BLoCApp extends StatefulWidget {
  const BLoCApp({super.key});

  @override
  State<BLoCApp> createState() => _BLoCAppState();
}

class _BLoCAppState extends State<BLoCApp> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBlocBloc homeBloc = HomeBlocBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,

        // Listener : navigheaza intre pagini cand e apasat butonul

        listener: (context, state) {
          if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          } else if (state is HomeNavigateToWishlistPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Wishlist()));
          } else if (state is HomeProductItemCartedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Item moved to cart",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                backgroundColor: Colors.teal,
                duration: Duration(milliseconds: 800)));
          } else if (state is HomeProductItemWishlistedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Item moved to Wishlist",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              duration: Duration(milliseconds: 800),
              backgroundColor: Colors.teal,
            ));
          }
        },

        //Verificam starea state-ului si in functie de fiecare stare
        // afisez ceva

        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            case HomeLoadedActionSuccessState:
              final successState = state as HomeLoadedActionSuccessState;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text("Grocery App"),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                          homeBloc: homeBloc,
                          productDataModel: successState.products[index]);
                    }),
              );

            case HomeErrorState:
              return Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
              );

            default:
              return Scaffold(
                body: Center(
                  child: Text("Unknown state"),
                ),
              );
          }
        });
  }
}
