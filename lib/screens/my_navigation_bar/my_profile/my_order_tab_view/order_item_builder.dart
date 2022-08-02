import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/utils/my_app_colors.dart';

class OrderItemBuilder extends StatelessWidget {
  const OrderItemBuilder({
    Key? key,
    required this.totalPayment,
    required this.orderDate,
    required this.paymentMethod,
    required this.isCompleted,
    required this.isPending,
    required this.isCancelled,
    required this.isInProcess,
    required this.orderNo,
    required this.onTap,
  }) : super(key: key);

  final int orderNo;
  final double totalPayment;
  final String orderDate, paymentMethod;
  final bool isCompleted;
  final bool isPending;
  final bool isCancelled;
  final bool isInProcess;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              color: Colors.grey.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${orderNo.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Get.height * .01),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.grey.withOpacity(0.1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Order Date',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      orderDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      isPending
                          ? 'PENDING'
                          : isInProcess
                          ? 'IN-PROCESS'
                          : isCompleted
                          ? 'COMPLETED'
                          : isCancelled
                          ? 'CANCELLED'
                          : 'Error Loading!',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: isPending
                              ? MyAppColors.appPrimaryColor
                              : isInProcess
                              ? Colors.blue
                              : isCompleted
                              ? Colors.green
                              : isCancelled
                              ? Colors.orangeAccent
                              : Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      paymentMethod,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '\$${totalPayment.toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
