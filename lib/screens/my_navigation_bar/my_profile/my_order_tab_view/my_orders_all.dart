import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/demoData/orders_data.dart';
import 'my_order_detail_screen.dart';
import 'order_item_builder.dart';

class MyOrdersAll extends StatelessWidget {
  const MyOrdersAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            // color: Colors.grey.withOpacity(0.1),
            child: Text(
              'Total ${myOrdersDemoData.length} orders',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 14),
            ),
          ),
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: myOrdersDemoData.length,
            // reverse: true,
            itemBuilder: (_, index) {
              return OrderItemBuilder(
                totalPayment: myOrdersDemoData[index].totalPayment,
                orderDate: myOrdersDemoData[index].orderDate,
                paymentMethod: myOrdersDemoData[index].paymentMethod,
                isCompleted: myOrdersDemoData[index].isCompleted,
                isPending: myOrdersDemoData[index].isPending,
                isInProcess: myOrdersDemoData[index].isInProcess,
                isCancelled: myOrdersDemoData[index].isCancelled,
                orderNo: myOrdersDemoData[index].orderNo,
                onTap: () {
                  Get.to(MyOrderDetailScreen(index: index));
                },
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
