import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        'title': 'प्रतिष्ठान',
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
        'title': 'ग्रंथसंपदा',
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
        'title': 'ग्रंथ मिळण्याची ठिकाणे',
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
        'title': 'चित्रदालन',
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
        'title': 'ध्वनी व चित्रफिती',
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
        'title': 'संकेतस्थळे',
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
        'title': 'सेटिंग्ज',
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
                padding: const EdgeInsets.only(right: 20),
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
                          'श्री दासगणू \nमहाराज \nप्रतिष्ठान',
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
                      child: SvgPicture.asset(
                        height: 23,
                        'assets/svg/close.svg',
                        colorFilter: ColorFilter.mode(
                          Color(ColorCode.black),
                          BlendMode.srcIn,
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
) {
  ExpansibleController controller = ExpansibleController();
  final ValueNotifier<bool> isExpanded = ValueNotifier(false);

  final List<Map<String, dynamic>> expandableItems = [
    {'title': 'प्रतिष्ठान विषयी', 'route': AppRoutes.dasganuScreen},
    {'title': 'दिनक्रम', 'route': AppRoutes.dasganuScreen},
    {'title': 'उत्सव', 'route': AppRoutes.dasganuScreen},
    {'title': 'संजीवन', 'route': AppRoutes.dasganuScreen},
    {'title': 'ध्यानमंदिर', 'route': AppRoutes.dasganuScreen},
    {'title': 'विश्वस्त मंडळ', 'route': AppRoutes.dasganuScreen},
    {'title': 'परंंपरा रक्षण', 'route': AppRoutes.dasganuScreen},
    {'title': 'इतर विभाग', 'route': AppRoutes.dasganuScreen},
    {'title': 'कसे यावे', 'route': AppRoutes.dasganuScreen},
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

Widget buildExpandableListItem(String title, String routeName) {
  return InkWell(
    //onTap: () => Navigator.pushNamed(context, routeName),
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 20, top: 16, bottom: 15),
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
  );
}
