import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:varadvani/l10n/app_localizations.dart';
import 'package:varadvani/routes/app_routes.dart';
import 'package:varadvani/theme/color_code.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> drawerItems = [
      {
        'icon': SvgPicture.asset(
          'assets/svg/pratishthan.svg',
          height: 20,
          colorFilter: ColorFilter.mode(
            Color(ColorCode.black),
            BlendMode.srcIn,
          ),
        ),
        'title': AppLocalizations.of(context)!.foundation,
        //'route': RouteNames.approvalsBodySwitcher
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/book.svg',
          //height: 20,
          colorFilter: ColorFilter.mode(
            Color(ColorCode.black),
            BlendMode.srcIn,
          ),
        ),
        'title': AppLocalizations.of(context)!.literary_works,
        //'route': RouteNames.approvalsBodySwitcher
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/map.svg',
          //height: 20,
          colorFilter: ColorFilter.mode(
            Color(ColorCode.black),
            BlendMode.srcIn,
          ),
        ),
        'title': AppLocalizations.of(context)!.book_availability,
        //'route': RouteNames.approvalsBodySwitcher
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/picture.svg',
          //height: 20,
          colorFilter: ColorFilter.mode(
            Color(ColorCode.black),
            BlendMode.srcIn,
          ),
        ),
        'title': AppLocalizations.of(context)!.photo_gallery,
        //'route': RouteNames.approvalsBodySwitcher
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/video.svg',
          //height: 20,
          colorFilter: ColorFilter.mode(
            Color(ColorCode.black),
            BlendMode.srcIn,
          ),
        ),
        'title': AppLocalizations.of(context)!.audio_video,
        //'route': RouteNames.approvalsBodySwitcher
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/link.svg',
          //height: 20,
          colorFilter: ColorFilter.mode(
            Color(ColorCode.black),
            BlendMode.srcIn,
          ),
        ),
        'title': AppLocalizations.of(context)!.related_websites,
        //'route': RouteNames.approvalsBodySwitcher
      },
      {
        'icon': SvgPicture.asset(
          'assets/svg/settings.svg',
          height: 20,
          colorFilter: ColorFilter.mode(
            Color(ColorCode.black),
            BlendMode.srcIn,
          ),
        ),
        'title': AppLocalizations.of(context)!.settings,
        //'route': RouteNames.approvalsBodySwitcher
      },
    ];

    return Drawer(
      backgroundColor: Color(ColorCode.scaffoldBackground),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 20),
          child: Column(
            spacing: 20,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40, // Controls the size — increase for bigger
                          backgroundImage: AssetImage(
                            'assets/image/dasganu.jpeg',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        Text(
                          AppLocalizations.of(context)!.dasganu_pratishthan,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Gotu',
                            fontWeight: FontWeight.bold,
                            color: Color(ColorCode.orange),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 7,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(ColorCode.orange),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: drawerItems.length,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? buildExpandableItem(
                            index,
                            drawerItems[index]['icon'],
                            drawerItems[index]['title'],
                            context,
                            // drawerItems[index].containsKey('route')
                            //     ? () => Navigator.pushNamed(
                            //           context,
                            //           drawerItems[index]['route'],
                            //           arguments: drawerItems[index]['args'],
                            //         )
                            //     : () => Fluttertoast.showToast(
                            //         msg: drawerItems[index]['toast']),
                          )
                        : buildListItem(
                            index,
                            drawerItems[index]['icon'],
                            drawerItems[index]['title'],
                            // drawerItems[index].containsKey('route')
                            //     ? () => Navigator.pushNamed(
                            //           context,
                            //           drawerItems[index]['route'],
                            //           arguments: drawerItems[index]['args'],
                            //         )
                            //     : () => Fluttertoast.showToast(
                            //         msg: drawerItems[index]['toast']),
                          );
                  },
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Divider(
                      thickness: 0.5,
                      color: Color(ColorCode.black).withValues(alpha: 0.2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListItem(int index, Widget icon, String title) {
  //, VoidCallback ontap) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 0),
    leading: CircleAvatar(
      radius: 15,
      backgroundColor: Color(ColorCode.black).withValues(alpha: 0.06),
      child: icon,
    ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'Mukta_medium',
        color: Color(ColorCode.black),
        letterSpacing: 0,
      ),
    ),
    //onTap: ontap,
    splashColor: Colors.transparent,
  );
}

Widget buildExpandableItem(
  int index,
  Widget icon,
  String title,
  //VoidCallback onTap,
  BuildContext context,
) {
  ExpansibleController controller = ExpansibleController();
  final ValueNotifier<bool> isExpanded = ValueNotifier(false);

  final List<Map<String, dynamic>> expandableItems = [
    {
      'title': AppLocalizations.of(context)!.about_foundation,
      'route': AppRoutes.aboutPratishthanScreen,
    },
    {
      'title': AppLocalizations.of(context)!.daily_schedule,
      'route': AppRoutes.dinkramScreen,
    },
    {
      'title': AppLocalizations.of(context)!.festivals,
      'route': AppRoutes.festivalsScreen,
    },
    {
      'title': AppLocalizations.of(context)!.sanjivan,
      'route': AppRoutes.sanjeevanScreen,
    },
    {
      'title': AppLocalizations.of(context)!.meditation_hall,
      'route': AppRoutes.dhyanMandirScreen,
    },
    {
      'title': AppLocalizations.of(context)!.board_of_trustees,
      'route': AppRoutes.vishwastaMandalScreen,
    },
    {
      'title': AppLocalizations.of(context)!.heritage_preservation,
      'route': AppRoutes.paramparaRakshanScreen,
    },
    {
      'title': AppLocalizations.of(context)!.other_departments,
      'route': AppRoutes.otherDepartmentsScreen,
    },
    {
      'title': AppLocalizations.of(context)!.how_to_reach,
      'route': AppRoutes.howToReachScreen,
    },
  ];

  return ExpansionTile(
    splashColor: Colors.transparent,
    controller: controller,
    onExpansionChanged: (expanded) => isExpanded.value = expanded,
    leading: ValueListenableBuilder<bool>(
      valueListenable: isExpanded,
      builder: (context, expanded, _) => CircleAvatar(
        radius: 15,
        backgroundColor: Color(ColorCode.black).withValues(alpha: 0.06),
        child: icon,
      ),
    ),
    title: ValueListenableBuilder<bool>(
      valueListenable: isExpanded,
      builder: (context, expanded, _) {
        return Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Mukta_medium',
            color: Color(ColorCode.black),
            letterSpacing: 0,
          ),
        );
      },
    ),
    trailing: ValueListenableBuilder<bool>(
      valueListenable: isExpanded,
      builder: (context, expanded, _) {
        return AnimatedRotation(
          turns: expanded ? 0.125 : 0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: SvgPicture.asset(
            'assets/svg/add.svg',
            colorFilter: ColorFilter.mode(
              Color(expanded ? ColorCode.orange : ColorCode.black),
              BlendMode.srcIn,
            ),
          ),
        );
      },
    ),
    tilePadding: EdgeInsets.only(right: 20),
    childrenPadding: const EdgeInsets.only(left: 16),
    collapsedBackgroundColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    shape: const Border(),
    collapsedShape: const Border(),
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(expandableItems.length, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildExpandableListItem(
                context,
                expandableItems[index]['title'],
                expandableItems[index]['route'],
              ),
              if (index != expandableItems.length - 1)
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 25),
                  child: Divider(
                    thickness: 0.5,
                    height: 1,
                    color: Color(ColorCode.black).withValues(alpha: 0.2),
                  ),
                ),
            ],
          );
        }),
      ),
    ],
  );
}

Widget buildExpandableListItem(
  BuildContext context,
  String title,
  String routeName,
) {
  return InkWell(
    onTap: () => Navigator.pushNamed(context, routeName),
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 20, top: 16, bottom: 15),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Mukta_medium',
            color: Color(ColorCode.black),
            letterSpacing: 0,
          ),
        ),
      ),
    ),
  );
}
