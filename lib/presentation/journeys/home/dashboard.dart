import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';
import 'package:agoris_admin/common/asset_constants.dart';

import 'package:agoris_admin/presentation/journeys/home/market_place.dart';
import 'package:agoris_admin/presentation/journeys/home/transactions.dart';
import 'package:agoris_admin/presentation/journeys/home/users.dart';
import 'package:agoris_admin/presentation/journeys/home/settings.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late int selectedIndex = 0;

  final List<Widget> pages = const [
    MarketPlace(),
    Transactions(),
    Users(),
    Settings(),
  ];

  final List<String> paths = [
    "/marketplace",
    "/transactions",
    "/users",
    "/settings",
  ];

  void setUrl(String path) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (html.window.location.pathname != path) {
        html.window.history.pushState(null, '', path);
      }
    });
  }

  void navigateTo(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
      setUrl(paths[newIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {

    bool isDesktop = MediaQuery.of(context).size.width >= Sizes.dimen_900;

    return Scaffold(
      drawer: !isDesktop ? Drawer(child: buildDrawer()) : null, // Show drawer on mobile/tablet
      body: Row(
        children: [
          if (isDesktop) buildSidebar(), // Sidebar only on larger screens
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                leading: isDesktop
                    ? IconButton(
                        iconSize: Sizes.dimen_32,
                        onPressed: (){},
                        icon: SvgPicture.asset(getIconFromIndex(selectedIndex), height: Sizes.dimen_24, width: Sizes.dimen_24, color: AppColors.appBlack,)
                      )
                    : Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                title: Text(getTitleFromIndex(selectedIndex)),
                backgroundColor: Colors.transparent,
                elevation: Sizes.dimen_0,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: pages[selectedIndex]),

                  SizedBox(
                    height: Sizes.dimen_50,
                    child: Center(
                      child: Text(
                        "Copyright ©${DateTime.now().year} Agoris. All rights reserved.",
                        style: const TextStyle(color: Colors.grey, fontSize: Sizes.dimen_12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSidebar() {
    return Container(
      width: Sizes.dimen_250,
      color: AppColors.appBlack,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_30),
              child: Image.asset(
                AssetConstants.appIcon,
                width: Sizes.dimen_80,
                height: Sizes.dimen_80,
              ),
            ),
          ),
          const SizedBox(height: Sizes.dimen_50,),

          Expanded(
            child: ListView(
              children: [
                buildNavItem("Marketplace", 0, AssetConstants.marketplace),
                buildNavItem("Transactions", 1, AssetConstants.transactions),
                buildNavItem("Users", 2, AssetConstants.users),
                buildNavItem("Settings", 3, AssetConstants.settings),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawer() {
    return Column(
      children: [
        DrawerHeader(
          child: Center(
            child: Image.asset(
              AssetConstants.appIcon,
              width: Sizes.dimen_80,
              height: Sizes.dimen_80,
            ),
          ),
        ),
        const SizedBox(height: Sizes.dimen_50,),

        buildNavItem("Marketplace", 0, AssetConstants.marketplace),
        buildNavItem("Transactions", 1, AssetConstants.transactions),
        buildNavItem("Users", 2, AssetConstants.users),
        buildNavItem("Settings", 3, AssetConstants.settings),
      ],
    );
  }

  Widget buildNavItem(String title, int itemIndex, String iconPath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.dimen_8, vertical: Sizes.dimen_8),
      decoration: BoxDecoration(
        color: selectedIndex == itemIndex ? AppColors.tealColor : AppColors.appBlack,
        borderRadius: selectedIndex == itemIndex ? BorderRadius.circular(Sizes.dimen_16) : BorderRadius.zero,
      ),
      child: ListTile(
        leading: SvgPicture.asset(iconPath),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        tileColor: selectedIndex == itemIndex ? Colors.red : Colors.transparent,
        onTap: () => navigateTo(itemIndex),
      ),
    );
  }

  String getTitleFromIndex(int index) {
    return ["Marketplace", "Transactions", "Users", "Settings"][index];
  }

  String getIconFromIndex(int index) {
    return [
      AssetConstants.marketplace,
      AssetConstants.transactions,
      AssetConstants.users,
      AssetConstants.settings
    ][index];
  }
}

// List<dynamic> pages = const [
  //   MarketPlace(),
  //   Transactions(),
  //   Users(),
  //   Settings(),
  // ];
  //
  // List<String> paths = ["marketplace", "transactions", "users", "settings"];
  //
  // void onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  //   // Update the browser URL
  //   // setUrlStrategy(PathUrlStrategy());
  //   // setUrl(paths[index]);
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: LayoutBuilder(
  //           builder: (context, constraints) {
  //             return Row(
  //               children: [
  //                 // Sidebar Navigation
  //                 Container(
  //                   width: constraints.maxWidth > 800 ? 250 : 80,
  //                   color: Colors.black,
  //                   child: Column(
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.symmetric(vertical: 20),
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(30),
  //                           child: Image.asset(
  //                             AssetConstants.appIcon,
  //                             width: 80,
  //                             height: 80,
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(height: 20),
  //                       Expanded(
  //                         child: ListView.builder(
  //                           itemCount: pages.length,
  //                           itemBuilder: (context, index) {
  //                             return ListTile(
  //                               leading: SvgPicture.asset(
  //                                   getIconFromIndex(index)),
  //                               title: constraints.maxWidth > 800
  //                                   ? Text(
  //                                 getTitleFromIndex(index),
  //                                 style: TextStyle(
  //                                   color: Colors.white,
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.w600,
  //                                 ),
  //                               )
  //                                   : null,
  //                               tileColor: selectedIndex == index
  //                                   ? Colors.red
  //                                   : null,
  //                               onTap: () => onItemTapped(index),
  //                             );
  //                           },
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //
  //                 //
  //                 // @override
  //                 // Widget build(BuildContext context) {
  //                 //   return Scaffold(
  //                 //     body: Row(
  //                 //       children: [
  //                 //         // Sticky Drawer
  //                 //         Container(
  //                 //           width: Sizes.dimen_250,
  //                 //           color: AppColors.appBlack,
  //                 //           child: Column(
  //                 //             children: [
  //                 //
  //                 //               Padding(
  //                 //                 padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_20),
  //                 //                 child: ClipRRect(
  //                 //                   borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_30)),
  //                 //                   child: Image.asset(
  //                 //                     AssetConstants.appIcon,
  //                 //                     width: Sizes.dimen_100,
  //                 //                     height: Sizes.dimen_100,
  //                 //                   ),
  //                 //                 ),
  //                 //               ),
  //                 //               const SizedBox(height: Sizes.dimen_40),
  //                 //
  //                 //               Expanded(
  //                 //                 child: Column(
  //                 //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 //                   children: [
  //                 //                     Column(
  //                 //                       children: [
  //                 //                         ListTile(
  //                 //                             leading: SvgPicture.asset(AssetConstants.marketplace,),
  //                 //                             title: const Text(
  //                 //                               'Marketplace',
  //                 //                               style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),
  //                 //                             ),
  //                 //                             onTap: ()=> setState(() => index = 0)
  //                 //                         ),
  //                 //
  //                 //                         ListTile(
  //                 //                             leading: SvgPicture.asset(AssetConstants.transactions,),
  //                 //                             title: const Text(
  //                 //                               'Transactions',
  //                 //                               style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),
  //                 //                             ),
  //                 //                             onTap: ()=> setState(() => index = 1)
  //                 //                         ),
  //                 //
  //                 //                         ListTile(
  //                 //                             leading: SvgPicture.asset(AssetConstants.users,),
  //                 //                             title: const Text(
  //                 //                               'Users',
  //                 //                               style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),
  //                 //                             ),
  //                 //                             onTap: ()=> setState(() => index = 2)
  //                 //                         ),
  //                 //
  //                 //                         ListTile(
  //                 //                             leading: SvgPicture.asset(AssetConstants.settings,),
  //                 //                             title: const Text(
  //                 //                               'Settings',
  //                 //                               style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),
  //                 //                             ),
  //                 //                             onTap: ()=> setState(() => index = 3)
  //                 //                         ),
  //                 //                       ],
  //                 //                     ),
  //                 //
  //                 //                     Padding(
  //                 //                       padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_20, horizontal: Sizes.dimen_16),
  //                 //                       child: Row(
  //                 //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                 //                         children: [
  //                 //                           Column(
  //                 //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                 //                             children: [
  //                 //                               Text(
  //                 //                                 'Administrator',
  //                 //                                 style: TextStyle(
  //                 //                                     color: AppColors.lightWhite,
  //                 //                                     fontWeight: FontWeight.w500,
  //                 //                                     fontSize: Sizes.dimen_14
  //                 //                                 ),
  //                 //                               ),
  //                 //                               Text(
  //                 //                                 'support@agorislisting.com',
  //                 //                                 style: TextStyle(
  //                 //                                     color: AppColors.lightWhite,
  //                 //                                     fontWeight: FontWeight.w400,
  //                 //                                     fontSize: Sizes.dimen_12
  //                 //                                 ),
  //                 //                               ),
  //                 //                             ],
  //                 //                           ),
  //                 //
  //                 //                           SvgPicture.asset(
  //                 //                             AssetConstants.logOut,
  //                 //                             color: AppColors.peach,
  //                 //                             height: Sizes.dimen_35,
  //                 //                             width: Sizes.dimen_35,
  //                 //                           )
  //                 //                         ],
  //                 //                       ),
  //                 //                     )
  //                 //                   ],
  //                 //                 ),
  //                 //               )
  //                 //             ],
  //                 //           ),
  //                 //         ),
  //
  //
  //                 //todo  Main Content Area
  //                 Expanded(
  //                   child: Scaffold(
  //                     appBar: AppBar(
  //                       leading: IconButton(
  //                         onPressed: (){},
  //                         iconSize: Sizes.dimen_32,
  //                         icon: SvgPicture.asset(
  //                           getIconFromIndex(selectedIndex),
  //                           // height: Sizes.dimen_2, width: Sizes.dimen_2,
  //                           color: AppColors.appBlack,
  //                         ),
  //                       ),
  //                       title: Text(
  //                         getTitleFromIndex(selectedIndex),
  //                         style: TextStyle(
  //                             color: AppColors.appBlack,
  //                             fontWeight: FontWeight.w600,
  //                             fontSize: Sizes.dimen_16
  //                         ),
  //                       ),
  //                       backgroundColor: Colors.transparent,
  //                     ),
  //                     body: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Expanded(
  //                               flex: 1,
  //                               child: pages[selectedIndex]
  //                           ),
  //
  //                           SizedBox(
  //                             height: Sizes.dimen_56,
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 Text(
  //                                   "Copyright ©${DateTime
  //                                       .now()
  //                                       .year} Agoris. All rights reserved.",
  //                                   style: const TextStyle(
  //                                       color: Color(0xFF545959),
  //                                       fontWeight: FontWeight.w600,
  //                                       fontSize: Sizes.dimen_12
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           )
  //                         ]
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             );
  //           }
  //           )
  //     );
  //   }
  // }

  // String getTitleFromIndex(int index) {
  //   switch(index){
  //     case 0:
  //       return "Marketplace";
  //     case 1:
  //       return "Transactions";
  //     case 2:
  //       return "Users";
  //     case 3:
  //       return "Settings";
  //     default:
  //       return "Marketplace";
  //   }
  // }
  //
  // dynamic getIconFromIndex(int index) {
  //   switch(index){
  //     case 0:
  //       return AssetConstants.marketplace;
  //     case 1:
  //       return AssetConstants.transactions;
  //     case 2:
  //       return AssetConstants.users;
  //     case 3:
  //       return AssetConstants.settings;
  //     default:
  //       return AssetConstants.marketplace;
  //   }
  // }