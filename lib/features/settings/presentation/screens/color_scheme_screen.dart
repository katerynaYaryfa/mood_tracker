import 'package:flutter/material.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/custom_app_bar.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ColorSchemeScreen extends StatefulWidget {
  const ColorSchemeScreen({Key? key}) : super(key: key);

  @override
  State<ColorSchemeScreen> createState() => _ColorSchemeScreenState();
}

class _ColorSchemeScreenState extends State<ColorSchemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(
          title: const Text(
            'Color scheme',
            style: s14W600CBlack2,
          ),
        ),
      ),
      backgroundColor:
          context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyOpacity.withOpacity(0.03),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  Text(
                    'Select your Mood Pal',
                    style: s16W700CBlack,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            const SpaceH16(),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyOpacity.withOpacity(0.03),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Select color scheme',
                    style: s16W700CBlack,
                  ),
                  const SpaceH24(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Future.delayed(Duration.zero, () {
                            context
                                .read<ThemeProvider>()
                                .toggleTheme(ThemeType.greenTheme);
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppColors.brightGreen,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Future.delayed(Duration.zero, () {
                            context
                                .read<ThemeProvider>()
                                .toggleTheme(ThemeType.mainTheme);
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
