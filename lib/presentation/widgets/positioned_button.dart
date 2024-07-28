import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';
import 'package:meatz/configs/configs.dart';
import 'package:meatz/core/core.dart';

Widget positionedButton({
  required void Function()? onPressed,
}) {
  return Positioned(
    bottom: AppDimensions.normalize(8),
    right: AppDimensions.normalize(5),
    child: customElevatedButton(
        width: AppDimensions.normalize(45),
        height: AppDimensions.normalize(20),
        color: AppColors.deepRed,
        borderRadius: AppDimensions.normalize(10),
        textKey: 'skip',
        textStyle: AppText.h3!.copyWith(
          color: Colors.white,
        ),
        onPressed: onPressed),
  );
}
