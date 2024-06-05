import 'package:flutter/material.dart';
import 'package:exam_app/feature/homepage_mobile.dart';
import 'package:exam_app/feature/homepage_web.dart';
import 'package:exam_app/utils/adaptive_stateless_widget.dart';

class Homepage extends AdaptiveStatelessWidget {
  const Homepage({super.key});

  @override
  Widget buidlMobile(BuildContext context) => const HomepageMobile();

  @override
  Widget buildWeb(BuildContext context) => const HomepageWeb();
}
