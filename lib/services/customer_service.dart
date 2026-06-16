import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/customer.dart';

class CustomerService {
  final CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  Future<void> addCustomer(Customer customer) async {
    await customers.add(customer.toMap());
  }

  Stream<List<Customer>> getCustomers() {
    return customers.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) {
        return Customer.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList(),
    );
  }

    Future<void> updateCustomer(Customer customer) async {
    await customers.doc(customer.id).update(
        customer.toMap(),
    );
    }
    
    Future<void> deleteCustomer(String customerId) async {
    await customers.doc(customerId).delete();
    }

}