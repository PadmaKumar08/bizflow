import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../services/customer_service.dart';

class EditCustomerScreen extends StatefulWidget {
  final Customer customer;

  const EditCustomerScreen({
    super.key,
    required this.customer,
  });

  @override
  State<EditCustomerScreen> createState() =>
      _EditCustomerScreenState();
}

class _EditCustomerScreenState
    extends State<EditCustomerScreen> {

  final CustomerService customerService =
      CustomerService();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController companyController;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.customer.name);

    emailController =
        TextEditingController(text: widget.customer.email);

    phoneController =
        TextEditingController(text: widget.customer.phone);

    companyController =
        TextEditingController(text: widget.customer.company);
  }

  Future<void> updateCustomer() async {
    final updatedCustomer = Customer(
      id: widget.customer.id,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      company: companyController.text,
    );

    await customerService.updateCustomer(
      updatedCustomer,
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: companyController,
              decoration: const InputDecoration(
                labelText: 'Company',
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: updateCustomer,
                child: const Text(
                  'Update Customer',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}