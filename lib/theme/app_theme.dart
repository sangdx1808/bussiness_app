import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../index.dart';

const fontFamily = 'Sora';
ThemeData defaultTheme = ThemeData();

final ThemeData baseTheme = ThemeData(
  fontFamily: fontFamily,
  cardTheme: const CardTheme(
    elevation: 2,
    color: Colors.white,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  dialogTheme: DialogTheme(
    elevation: 3,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.r),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.primary),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColors.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    titleTextStyle: AppTextStyles.s16w600,
    backgroundColor: AppColors.white,
  ),
  textTheme: TextTheme(
    titleLarge: defaultTheme.textTheme.titleLarge!.copyWith(
      fontSize: AppDimens.largeXXXSizeSP,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: defaultTheme.textTheme.bodyMedium!.copyWith(
      fontSize: AppDimens.mediumSizeSP,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: defaultTheme.textTheme.bodySmall!.copyWith(
      fontSize: AppDimens.smallSizeSP,
      fontWeight: FontWeight.w400,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: fontFamily,
).copyWith(
  brightness: Brightness.dark,
  cardTheme: baseTheme.cardTheme,
  dialogTheme: baseTheme.dialogTheme,
  pageTransitionsTheme: baseTheme.pageTransitionsTheme,
  dividerColor: AppColors.grayF2,
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  splashColor: AppColors.grayF2,
  highlightColor: AppColors.grayF2,
  iconTheme: const IconThemeData(
    color: AppColors.gray7C,
  ),
  appBarTheme: AppBarTheme(
    color: AppColors.background,
    titleTextStyle: AppTextStyles.s16w600.copyWith(color: AppColors.black1F),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide.none,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primary,
  ),
  textTheme: TextTheme(
    titleLarge: baseTheme.textTheme.titleLarge!.copyWith(
      color: AppColors.black34,
    ),
    titleMedium: baseTheme.textTheme.titleLarge!.copyWith(
      color: AppColors.black34,
      fontSize: AppDimens.mediumSizeSP,
    ),
    bodyMedium: baseTheme.textTheme.bodyMedium!.copyWith(
      color: AppColors.primary,
    ),
    bodySmall: baseTheme.textTheme.bodySmall!.copyWith(
      color: AppColors.black70,
    ),
  ),
);

final ThemeData lightTheme = ThemeData(
  fontFamily: fontFamily,
).copyWith(
  brightness: Brightness.light,
  cardTheme: baseTheme.cardTheme,
  dialogTheme: baseTheme.dialogTheme,
  pageTransitionsTheme: baseTheme.pageTransitionsTheme,
  dividerColor: AppColors.grayF2,
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  splashColor: AppColors.primary,
  highlightColor: AppColors.grayF2,
  iconTheme: const IconThemeData(
    color: AppColors.gray7C,
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.background,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide.none,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primary,
  ),
  textTheme: TextTheme(
    titleLarge: baseTheme.textTheme.titleLarge!.copyWith(
      color: AppColors.black34,
    ),
    titleMedium: baseTheme.textTheme.titleLarge!.copyWith(
      color: AppColors.black34,
      fontSize: AppDimens.mediumSizeSP,
    ),
    bodyMedium: baseTheme.textTheme.bodyMedium!.copyWith(
      color: AppColors.primary,
    ),
    bodySmall: baseTheme.textTheme.bodySmall!.copyWith(
      color: AppColors.black70,
    ),
  ),
);
