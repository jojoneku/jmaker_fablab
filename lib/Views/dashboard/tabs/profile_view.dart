import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jmaker_fablab/Controller/auth_controller.dart';
import 'package:jmaker_fablab/Model/maker_model.dart';
import 'package:jmaker_fablab/Model/student_model.dart';
import 'package:jmaker_fablab/Views/internet_connection_checker.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:ionicons/ionicons.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return InternetConnectionChecker(
      child: (isOfflineMode) {
        return Scaffold(
          body: ValueListenableBuilder(
            valueListenable: Hive.box('userData').listenable(),
            builder: (context, value, child) {
              if (value.isEmpty || !value.isOpen) {
                return const SizedBox.shrink();
              }

              final userData = value.values.first;

              return ListView(
                padding: EdgeInsets.fromLTRB(16, !isOfflineMode ? 16 + MediaQuery.of(context).viewPadding.top : 16, 16, 16),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/JMAKER png-03.png',
                        height: 24,
                      ),
                      IconButton(
                        onPressed: () {
                          if (isOfflineMode) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog.adaptive(
                                  title: const Text('Offline Mode'),
                                  content: const Text('Edit Profile requires internet access'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            if (userData is StudentModel) {
                              context.router.push(StudentAccountRoute(userData: userData));
                            } else {
                              context.router.push(MakerAccountRoute(userData: userData));
                            }
                          }
                        },
                        icon: const Icon(Ionicons.create_outline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: mainYellow),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: whiteBG,
                          child: Icon(
                            Ionicons.person,
                            size: 50,
                            color: blackGreen,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        userData is StudentModel
                            ? userData.fullName
                            : userData is MakerModel
                                ? userData.fullName
                                : '',
                        style: CustomTextStyle.boldHeader,
                      ),
                      Text(
                        userData is StudentModel ? 'Student' : 'Maker',
                        style: CustomTextStyle.biggerBlack,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Info',
                        style: CustomTextStyle.boldHeader,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: secondGrey),
                        ),
                        child: Column(
                          children: [
                            _UserInfoWidget(
                              iconData: Ionicons.call_outline,
                              text: userData is StudentModel
                                  ? userData.contactNumber
                                  : userData is MakerModel
                                      ? userData.contactNumber
                                      : '',
                            ),
                            const Divider(),
                            _UserInfoWidget(
                              iconData: Ionicons.mail_outline,
                              text: userData is StudentModel
                                  ? userData.universityEmail
                                  : userData is MakerModel
                                      ? userData.email
                                      : '',
                            ),
                            const Divider(),
                            _UserInfoWidget(
                              iconData: Ionicons.card_outline,
                              text: userData is StudentModel
                                  ? userData.studentId
                                  : userData is MakerModel
                                      ? userData.companyName
                                      : '',
                            ),
                            const Divider(),
                            _UserInfoWidget(
                              iconData: Ionicons.link,
                              text: userData is StudentModel
                                  ? userData.academe
                                  : userData is MakerModel
                                      ? userData.affiliation
                                      : '',
                            ),
                            const Divider(),
                            _UserInfoWidget(
                              iconData: Ionicons.help_outline,
                              text: userData is StudentModel
                                  ? userData.academicProgram
                                  : userData is MakerModel
                                      ? userData.userType
                                      : '',
                            ),
                            const Divider(),
                            _UserInfoWidget(
                              iconData: userData is StudentModel
                                  ? (userData.gender.toLowerCase() == 'male'
                                      ? Ionicons.male
                                      : userData.gender.toLowerCase() == 'female'
                                          ? Ionicons.female
                                          : userData.gender.contains('LGBTQ')
                                              ? Ionicons.transgender
                                              : Ionicons.help_outline)
                                  : (userData.gender.toLowerCase() == 'male'
                                      ? Ionicons.male
                                      : userData.gender.toLowerCase() == 'female'
                                          ? Ionicons.female
                                          : userData.gender.contains('LGBTQ')
                                              ? Ionicons.transgender
                                              : Ionicons.help_outline),
                              text: userData is StudentModel
                                  ? userData.gender
                                  : userData is MakerModel
                                      ? userData.gender
                                      : 'Prefer not to say',
                            ),
                            const Divider(),
                            _UserInfoWidget(
                              iconData: Ionicons.analytics,
                              text: userData is StudentModel
                                  ? userData.minority
                                  : userData is MakerModel
                                      ? userData.minority
                                      : '',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            showDragHandle: true,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Are you sure you really want to logout?',
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyle.boldHeader,
                                    ),
                                    const SizedBox(height: 24),
                                    ElevatedButton(
                                      style: logout,
                                      onPressed: () => AuthController().logout(
                                        context,
                                        isOfflineMode: isOfflineMode,
                                      ),
                                      child: Text(
                                        'Logout',
                                        style: CustomTextStyle.biggerWhite,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    OutlinedButton(
                                      onPressed: context.router.maybePop,
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: secondGrey),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Ionicons.log_out_outline,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Logout',
                                style: CustomTextStyle.biggerBlack.copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({
    required this.text,
    required this.iconData,
  });

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: blackGreen,
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: CustomTextStyle.biggerBlack,
        ),
      ],
    );
  }
}
