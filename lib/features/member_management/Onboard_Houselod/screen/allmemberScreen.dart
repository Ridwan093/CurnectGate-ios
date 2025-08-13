import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/operations/notifications/screen/notification_permission.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/provider/getHouseHold_provider.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/screen/add_member.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/widget/BuildHouseHold_Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AllMemberListScreen extends ConsumerWidget {
  const AllMemberListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: _buildBody(size, ref, context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: InkWell(
        onTap: () {
          context.goNamed(AppRoutes.dashbord);
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
      title: Text(
        "Add a member",
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          fontSize: 14,
          fontWeight: FontFamilies.bold,
          color: AppColors.instance.black600,
        ),
      ),
    );
  }

  Widget _buildBody(Size size, WidgetRef ref, BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.goNamed(AppRoutes.dashbord);
        return false; // Prevent default back behavior
      },
      child: Column(
        children: [
          _buildAddMemberButton(size, context),
          const SizedBox(height: 30),
          Expanded(child: _buildContent(size, context, ref)),
        ],
      ),
    );
  }

  Widget _buildAddMemberButton(Size size, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddNewMember()),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: AppColors.instance.black600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Add Member +",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.grey200,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Size size, BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Members",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 20,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Add or remove people who can use your family profile",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              fontWeight: FontFamilies.medium,
              color: AppColors.instance.black300,
            ),
          ),
          const SizedBox(height: 23),
          _buildListHeader(context, ref),
          const SizedBox(height: 10),
          Expanded(child: HouseholdDatas()),
        ],
      ),
    );
  }

  Widget _buildListHeader(BuildContext context, WidgetRef ref) {
    final householdData = ref.watch(houseProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "First, last",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 10,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black500,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationPermissionScreen(),
              ),
            );
          },
          child: Row(
            children: [
              const Icon(Icons.person_2_outlined, size: 16),
              const SizedBox(width: 5),
              householdData.when(
                data: (data) {
                  if (data?.data?.householdMembers != null) {
                    return Text(
                      "${data?.data?.householdMembers?.length.toString() ?? 0}",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 10,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black500,
                      ),
                    );
                  } else {
                    return Text(
                      "0",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 10,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black500,
                      ),
                    );
                  }
                },
                error: (error, stack) {
                  Text(
                    "0",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 10,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black500,
                    ),
                  );
                  final householdData = ref.read(houseProvider).value;
                  final data = householdData?.data;

                  // Try to show cached data

                  if (data!.householdMembers!.isNotEmpty) {
                    return Text(
                      data.householdMembers!.length.toString(),
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 10,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black500,
                      ),
                    );
                  } else {
                    return Text(
                      "0",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 10,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black500,
                      ),
                    );
                  }
                },
                loading: () {
                  return Text(
                    "0",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 10,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black500,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
