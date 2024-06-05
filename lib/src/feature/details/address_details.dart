import 'package:flutter/material.dart';
import 'package:exam_app/src/model/adress.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({
    required this.address,
    super.key,
  });

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        style: const TextStyle(fontSize: 20.0),
        text: address.buildingNumber,
        children: <InlineSpan>[
          TextSpan(text: address.street),
          TextSpan(text: address.streetName),
          TextSpan(text: address.city),
          TextSpan(text: address.country),
          TextSpan(text: ' | ZIP: ${address.zipcode}'),
          TextSpan(text: ' CR: ${address.countyCode}'),
        ],
      ),
    );
  }
}
