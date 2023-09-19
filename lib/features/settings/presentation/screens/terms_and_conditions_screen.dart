import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/custom_app_bar.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse(
          'https://smartfoxlabs.notion.site/Terms-Conditions-a155f24528804e7ca18eaf30902dea8d?pvs=4'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          ' Terms and Conditions',
          style: TextStyles.s14W600CBlack2,
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
