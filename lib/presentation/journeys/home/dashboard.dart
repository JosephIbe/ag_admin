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

  late int index = 0;
  List<dynamic> pages = const [
    MarketPlace(),
    Transactions(),
    Users(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sticky Drawer
          Container(
            width: Sizes.dimen_250,
            color: AppColors.appBlack,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_20),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_30)),
                    child: Image.asset(
                      AssetConstants.appIcon,
                      width: Sizes.dimen_100,
                      height: Sizes.dimen_100,
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.dimen_40),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ListTile(
                              leading: SvgPicture.asset(AssetConstants.marketplace,),
                              title: const Text(
                                'Marketplace',
                                style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),
                              ),
                              onTap: ()=> setState(() => index = 0)
                          ),

                          ListTile(
                              leading: SvgPicture.asset(AssetConstants.transactions,),
                              title: const Text(
                                'Transactions',
                                style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),
                              ),
                              onTap: ()=> setState(() => index = 1)
                          ),

                          ListTile(
                              leading: SvgPicture.asset(AssetConstants.users,),
                              title: const Text(
                                'Users',
                                style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),
                              ),
                              onTap: ()=> setState(() => index = 2)
                          ),

                          ListTile(
                              leading: SvgPicture.asset(AssetConstants.settings,),
                              title: const Text(
                                'Settings',
                                style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),
                              ),
                              onTap: ()=> setState(() => index = 3)
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_20, horizontal: Sizes.dimen_16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Administrator',
                                  style: TextStyle(
                                      color: AppColors.lightWhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: Sizes.dimen_14
                                  ),
                                ),
                                Text(
                                  'support@agorislisting.com',
                                  style: TextStyle(
                                      color: AppColors.lightWhite,
                                      fontWeight: FontWeight.w400,
                                      fontSize: Sizes.dimen_12
                                  ),
                                ),
                              ],
                            ),

                            SvgPicture.asset(
                              AssetConstants.logOut,
                              color: AppColors.peach,
                              height: Sizes.dimen_35,
                              width: Sizes.dimen_35,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                leading: SvgPicture.asset(
                  getIconFromIndex(index),
                  height: Sizes.dimen_2, width: Sizes.dimen_2,
                ),
                title: Text(
                  getTitleFromIndex(index),
                  style: TextStyle(
                    color: AppColors.lightWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.dimen_16
                  ),
                ),
                backgroundColor: AppColors.appBlack,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: pages[index]
                  ),

                  SizedBox(
                    height: Sizes.dimen_56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Copyright ©${DateTime.now().year} Agoris. All rights reserved.",
                          style: const TextStyle(
                            color: Color(0xFF545959),
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.dimen_12
                          ),
                        ),
                      ],
                    ),
                  )
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getTitleFromIndex(int index) {
    switch(index){
      case 0:
        return "Marketplace";
      case 1:
        return "Transactions";
      case 2:
        return "Users";
      case 3:
        return "Settings";
      default:
        return "Marketplace";
    }
  }

  dynamic getIconFromIndex(int index) {
    switch(index){
      case 0:
        return AssetConstants.marketplace;
      case 1:
        return AssetConstants.transactions;
      case 2:
        return AssetConstants.users;
      case 3:
        return AssetConstants.settings;
      default:
        return AssetConstants.marketplace;
    }
  }

}