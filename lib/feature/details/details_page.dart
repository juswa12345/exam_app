import 'package:exam_app/feature/widgets/custom_image.dart';
import 'package:exam_app/src/model/person.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exam_app/feature/details/address_details.dart';
import 'package:exam_app/feature/widgets/custom_text.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.person,
    super.key,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${person.firstname}\'s Details')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
              imageId: person.image,
              height: 200,
              width: 200,
            ),
            const Divider(height: 50),
            CustomText(
              content: '${person.firstname} ${person.lastname}',
              fontWeight: FontWeight.bold,
              size: 35,
            ),
            CustomText(content: DateFormat.yMMMMd().format(person.birthday)),
            CustomText(
              content: person.email,
              isLink: true,
            ),
            CustomText(content: person.phone),
            CustomText(content: person.gender),
            AddressDetails(address: person.address),
            CustomText(content: person.address.longitude.toString()),
            CustomText(content: person.address.latitude.toString()),
            CustomText(
              content: person.website,
              isLink: true,
            ),
          ],
        ),
      ),
    );
  }
}
