class OrdersData {
  const OrdersData(
    this.paymentMethod,
    this.orderDate,
    this.totalPayment,
    this.isPending,
    this.isInProcess,
    this.isCompleted,
    this.isCancelled,
    this.orderNo,
  );

  final String paymentMethod, orderDate;
  final int orderNo;
  final double totalPayment;
  final bool isCompleted;
  final bool isCancelled;
  final bool isPending;
  final bool isInProcess;
}

List<OrdersData> myOrdersDemoData = [
  const OrdersData(
      'Cash on delivery', '06/06/2022', 340.4, true, false, false, false, 6951),
  const OrdersData(
      'By Card online', '09/01/2022', 402.1, false, true, false, false, 6092),
  const OrdersData(
      'Cash on delivery', '09/12/2021', 549, false, false, true, false, 6091),
  const OrdersData(
      'Cash on delivery', '21/11/2021', 653.4, false, false, false, true, 6081),
  const OrdersData(
      'By Card Online', '14/09/2021', 124.6, false, false, false, false, 5067),
];
