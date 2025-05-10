
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:projet_ecommerce_meuble/Model/order_model.dart';
import 'package:projet_ecommerce_meuble/ViewModel/order_controller.dart';
import 'package:projet_ecommerce_meuble/Views/widgets/app_bar.dart';
import 'package:projet_ecommerce_meuble/utils/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;


class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  OrderController orderController = OrderController();
  List<Order> orders = [];
  bool fetching = true;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Order History',
      ),
      body: fetching
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : orders.isEmpty
              ? const Center(
                  child: Text('No Orders Found'),
                )
              : ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];

                    DateTime currentDate = DateTime.now();
                    Duration timeElapsed =
                        currentDate.difference(order.createdAt!);
                    String formattedTimeElapsed =
                        timeago.format(currentDate.subtract(timeElapsed));

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title:
                                Text('Order Status: ${order.shippingStatus}'),
                            subtitle: Text(
                              'Total Amount: \$${order.amount}',
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: order.productCard?.length,
                            itemBuilder: (context, index) {
                              final product = order.productCard![index];
                              return ListTile(
                                title: Text(product.name),
                                subtitle: Text(
                                    'Price: \$${product.price.toString()}'),
                                trailing: Text(
                                    'Quantity: ${product.quantity.toString()}'),
                              );
                            },
                          ),
                          ListTile(
                            subtitle: Text(formattedTimeElapsed),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
