// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocState {}

abstract class CartActionState extends CartBlocState {}

class CartInitial extends CartBlocState {}

class CartSuccesState extends CartBlocState {
  final List<ProductDataModel> cartItems;
  CartSuccesState({
    required this.cartItems,
  });
}
