import 'package:agriculture/utils/enums/order.dart';
import 'package:agriculture/widgets/order_item_widget.dart';
import 'package:flutter/material.dart';

import '../data/orders.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = OrderStatus.values.map((e) => e.name).toList();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(tabs.length, (index) {
              return Tab(text: tabs[index]);
            }),
          ),
        ),
        body: TabBarView(
          children: List.generate(tabs.length, (index) {
            final fileOrders = orders
                .where((order) => order.status == OrderStatus.values[index])
                .toList();
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final order = fileOrders[index];
                return OrderItemWidget(order: order);
              },
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: fileOrders.length,
            );
          }),
        ),
      ),
    );
  }
}
