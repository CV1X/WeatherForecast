import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_1/BLocAPP/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartSuccesState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartBlocState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccesState(cartItems: cartItems));
  }
}
