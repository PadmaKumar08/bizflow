class Invoice {
  String? id;
  String customerId;
  String customerName;
  double amount;
  String status;
  DateTime createdAt;

  Invoice({
    this.id,
    required this.customerId,
    required this.customerName,
    required this.amount,
    required this.status,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'amount': amount,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Invoice.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return Invoice(
      id: documentId,
      customerId: map['customerId'] ?? '',
      customerName: map['customerName'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      status: map['status'] ?? 'Pending',
      createdAt: DateTime.parse(
        map['createdAt'],
      ),
    );
  }
}