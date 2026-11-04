


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class WalletHistoryData extends ConsumerWidget {
//   const WalletHistoryData({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return RefreshIndicator(
//         color: AppColors.instance.yellow500,
//         onRefresh:
//             () => ref
//                 .read(userProfileProvider.notifier)
//                 .refreshProfile(context, ref),
//         child: SingleChildScrollView(
//           physics: const AlwaysScrollableScrollPhysics(),
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               profileAsync.when(
//                 data: (profile) {
//                   try {
//                     final user = profile?.data;
//                     return user != null
//                         ? Profilecard(
//                           userProfileUrl: user.mediaUrl,
//                           role: user.role,
//                           username: user.fullName,
//                           estateName: user.estateName,
//                           memberId: user.memberCode,
//                         )
//                         : EmptyBodys(message: "No profile data?");
//                   } catch (e) {
//                     return Builderroul(
//                       error: e.toString(),
//                       onTap:
//                           () => ref
//                               .read(userProfileProvider.notifier)
//                               .refreshProfile(context, ref),
//                       firstMessae: "Faile to load profile?",
//                     );
//                   }
//                 },
//                 loading: () {
//                   try {
//                     final cachedProfile = ref.read(userProfileProvider).value;
//                     return cachedProfile != null
//                         ? Profilecard(
//                           userProfileUrl: cachedProfile.data.mediaUrl,
//                           role: cachedProfile.data.role,
//                           username: cachedProfile.data.fullName,
//                           estateName: cachedProfile.data.estateName,
//                           memberId: cachedProfile.data.memberCode,
//                         )
//                         : Loadingstates();
//                   } catch (e) {
//                     return Builderroul(
//                       error: e.toString(),
//                       onTap:
//                           () => ref
//                               .read(userProfileProvider.notifier)
//                               .refreshProfile(context, ref),
//                       firstMessae: "Faile to load profile?",
//                     );
//                   }
//                 },
//                 error: (error, stack) {
//                   try {
//                     // Handle session expiration
//                     if (error.toString().contains("Unauthenticated")) {
//                       WidgetsBinding.instance.addPostFrameCallback((_) {
//                         ref
//                             .read(authProvider.notifier)
//                             .seassionExpire(context, ref);
//                       });
//                       return Expiresessionbody();
//                     }

//                     // Try to show cached data
//                     final cachedProfile = ref.read(userProfileProvider).value;
//                     if (cachedProfile != null) {
//                       return Column(
//                         children: [
//                           Profilecard(
//                             userProfileUrl: cachedProfile.data.mediaUrl,
//                             role: cachedProfile.data.role,
//                             username: cachedProfile.data.fullName,
//                             estateName: cachedProfile.data.estateName,
//                             memberId: cachedProfile.data.memberCode,
//                           ),
//                           // Emmergencybody(error: error.toString()),
//                         ],
//                       );
//                     }

//                     // No cached data available
//                     return Builderroul(
//                       error: error.toString(),
//                       onTap:
//                           () => ref
//                               .read(userProfileProvider.notifier)
//                               .refreshProfile(context, ref),
//                       firstMessae: "Faile to load profile?",
//                     );
//                   } catch (e) {
//                     return Builderroul(
//                       error: e.toString(),
//                       onTap:
//                           () => ref
//                               .read(userProfileProvider.notifier)
//                               .refreshProfile(context, ref),
//                       firstMessae: "Faile to load profile?",
//                     );
//                   }
//                 },
//               ),
//   }
// }