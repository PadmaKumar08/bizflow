class Customer {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String company;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.company,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'company': company,
    };
  }

  factory Customer.fromMap(
    String id,
    Map<String, dynamic> data,
  ) {
    return Customer(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      company: data['company'] ?? '',
    );
  }
}