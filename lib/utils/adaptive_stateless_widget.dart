import 'package:flutter/material.dart';

abstract class AdaptiveStatelessWidget extends StatelessWidget {
  const AdaptiveStatelessWidget({super.key});

  Widget buidlMobile(BuildContext context);

  Widget buildWeb(BuildContext context);

  @override
  Widget build(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.android ||
              Theme.of(context).platform == TargetPlatform.iOS
          ? buidlMobile(context)
          : buildWeb(context);
}
