import 'package:agriculture/data/product.dart';
import 'package:agriculture/models/order.dart';
import '../utils/enums/order.dart';

List<Order> orders = [
  Order(
    id: "2022w4fm",
    products: products.reversed.skip(3).toList(),
    orderingDate: DateTime.utc(2022, 2, 5),
    deliveryDate: DateTime.utc(2022, 3, 1),
    status: OrderStatus.processing,
  ),
  Order(
    id: "203104jx",
    products: products.reversed.skip(3).toList(),
    orderingDate: DateTime.utc(2022, 1, 1),
    deliveryDate: DateTime.utc(2022, 2, 5),
    status: OrderStatus.processing,
  ),
  Order(
    id: "112204bm",
    products: products.reversed.skip(3).take(2).toList(),
    orderingDate: DateTime.utc(2021, 1, 1),
    deliveryDate: DateTime.utc(2022, 2, 1),
    status: OrderStatus.picking,
  ),
  Order(
    id: "2022w4fm",
    products: products.reversed.skip(3).take(2).toList(),
    orderingDate: DateTime.utc(2022, 3, 1),
    deliveryDate: DateTime.utc(2022, 4, 1),
    status: OrderStatus.shipping,
  ),
  Order(
    id: "2022w4fm",
    products: products.reversed.skip(3).take(2).toList(),
    orderingDate: DateTime.utc(2022, 4, 1),
    deliveryDate: DateTime.utc(2022, 5, 1),
    status: OrderStatus.delivered,
  ),
];
