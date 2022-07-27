import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/settings_screen/data_security_screen.dart';

import '../bottom_navigation_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    bool switchValue;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFF6FAFB),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: Color(0xFFF6FAFB),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DataSecurityScreen();
                        },
                      ),
                    );
                  },
                  child: SettingsButtons(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFB1D199),
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF738C93).withOpacity(0.03),
                                spreadRadius: 1,
                                blurRadius: 15,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          'Data security',
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        CupertinoSwitch(
                          value: switchValue = true,
                          onChanged: (bool value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SettingsButtons(
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF63B4FF),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF738C93).withOpacity(0.03),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text('Language'),
                      Expanded(
                        child: Container(),
                      ),
                      SvgPicture.asset(
                        'images/arrowRight.svg',
                        color: Color(0xFFD1D4DE),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SettingsButtons(
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF7562),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF738C93).withOpacity(0.03),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Color scheme',
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      SvgPicture.asset(
                        'images/arrowRight.svg',
                        color: Color(0xFFD1D4DE),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SettingsButtons(
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8AA4C),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF738C93).withOpacity(0.03),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Start of the week',
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      SvgPicture.asset(
                        'images/arrowRight.svg',
                        color: Color(0xFFD1D4DE),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SettingsButtons(
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFB1D199),
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF738C93).withOpacity(0.03),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Reminders',
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      CupertinoSwitch(
                        value: switchValue = true,
                        onChanged: (bool value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 180,
                ),
                CustomNavigationBar(
                  size: size,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 72,
      width: 328,
      child: child,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFE),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF738C93).withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}
