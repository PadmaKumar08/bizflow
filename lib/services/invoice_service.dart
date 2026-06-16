import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/invoice.dart';

class InvoiceService {
  final CollectionReference invoices =
      FirebaseFirestore.instance.collection(
    'invoices',
  );

  Future<void> addInvoice(
    Invoice invoice,
  ) async {
    await invoices.add(
      invoice.toMap(),
    );
  }

  Stream<List<Invoice>> getInvoices() {
    return invoices.snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return Invoice.fromMap(
              doc.data()
                  as Map<String, dynamic>,
              doc.id,
            );
          },
        ).toList();
      },
    );
  }
}