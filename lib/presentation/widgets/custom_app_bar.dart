import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/theme/color_code.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isFromHome = false,
    this.isShowLeading = false,
  });

  final String title;
  final bool? isFromHome;
  final bool? isShowLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(ColorCode.scaffoldBackground),
      centerTitle: true,
      leadingWidth: isFromHome! ? 50 : 50,
      title: Text(
        title,
        style: TextStyle(
          fontSize: isFromHome! ? 24 : 20,
          fontFamily: 'Gotu',
          fontWeight: FontWeight.bold,
          color: isFromHome! ? Color(ColorCode.orange) : Color(ColorCode.black),
        ),
      ),
      leading: isShowLeading!
          ? Builder(
              builder: (context) => InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SvgPicture.asset(
                    'assets/svg/menu.svg',
                    colorFilter: ColorFilter.mode(
                      Color(ColorCode.black),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            )
          : InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: SvgPicture.asset(
                    'assets/svg/arrow.svg',
                    colorFilter: ColorFilter.mode(
                      Color(ColorCode.black),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
