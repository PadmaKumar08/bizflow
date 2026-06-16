import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../services/customer_service.dart';
import 'edit_customer_screen.dart';

class CustomerListScreen extends StatelessWidget {
  CustomerListScreen({super.key});

  final CustomerService customerService = CustomerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      body: StreamBuilder<List<Customer>>(
        stream: customerService.getCustomers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final customers = snapshot.data!;

          if (customers.isEmpty) {
            return const Center(
              child: Text('No Customers Found'),
            );
          }

          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];

              return ListTile(
                title: Text(customer.name),
                subtitle: Text(customer.company),
                leading: const Icon(Icons.person),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditCustomerScreen(
                        customer: customer,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}