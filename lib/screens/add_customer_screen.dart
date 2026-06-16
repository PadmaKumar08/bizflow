import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../services/customer_service.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final CustomerService _customerService = CustomerService();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final companyController = TextEditingController();

  bool loading = false;

  Future<void> saveCustomer() async {
    setState(() {
      loading = true;
    });

    final customer = Customer(
      id: '',
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      company: companyController.text.trim(),
    );

    await _customerService.addCustomer(customer);

    setState(() {
      loading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Customer Added Successfully'),
      ),
    );

    nameController.clear();
    emailController.clear();
    phoneController.clear();
    companyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Customer Name',
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: companyController,
                decoration: const InputDecoration(
                  labelText: 'Company',
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : saveCustomer,
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text('Save Customer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}