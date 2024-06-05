import 'package:flutter/material.dart';
import 'package:exam_app/feature/widgets/custom_text.dart';
import 'package:exam_app/feature/widgets/custom_image.dart';
import 'package:exam_app/src/model/person.dart';

class CustomPersonTile extends StatelessWidget {
  const CustomPersonTile({
    required this.person,
    required this.onTap,
    super.key,
  });

  final Person person;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            CustomImage(imageId: person.id.toString()),
            const SizedBox(width: 20),
            Expanded(
              child: Card(
                child: ListTile(
                  isThreeLine: true,
                  title: CustomText(
                    content: '${person.firstname} ${person.lastname}',
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(content: person.email),
                      CustomText(content: person.image),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
