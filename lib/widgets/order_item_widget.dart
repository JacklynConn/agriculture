import 'package:agriculture/models/order.dart';
import 'package:agriculture/widgets/order_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalPrice = order.products.fold(0.0, (acc, e) => acc + e.price);
    final products = order.products.take(2).toList();
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  " ${order.id}",
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '(${order.products.length} items)',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(width: 5),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...List.generate(products.length, (index) {
              return OrderProductWidget(
                order: order,
                product: products[index],
              );
            }),
            const SizedBox(height: 10),
            if (order.products.length > 1) const SizedBox(height: 10),
            if (order.products.length > 1)
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(14),
                            itemCount: order.products.length,
                            itemBuilder: (context, index) {
                              return OrderProductWidget(
                                order: order,
                                product: order.products[index],
                              );
                            }),
                      );
                    },
                  );
                },
                label: const Text("View all"),
                icon: const Icon(IconlyBold.arrowRight),
              ),
          ],
        ),
      ),
    );
  }
}
