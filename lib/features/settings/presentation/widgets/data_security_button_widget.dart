import 'package:flutter/cupertino.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/theme/app_colors.dart';

class DataSecurityButton extends StatefulWidget {
  const DataSecurityButton({
    required this.title,
    required this.color,
    required this.value,
    required this.onChanged,
    required this.child,
    Key? key,
  }) : super(
          key: key,
        );

  final void Function(bool) onChanged;
  final bool value;
  final Color color;
  final String title;
  final Widget child;

  @override
  State<DataSecurityButton> createState() => _DataSecurityButtonState();
}

class _DataSecurityButtonState extends State<DataSecurityButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyOpacity.withOpacity(0.03),
                spreadRadius: 1,
                blurRadius: 15,
              ),
            ],
          ),
          child: widget.child,
        ),
        const SpaceW12(),
        Text(widget.title),
        const Spacer(),
        CupertinoSwitch(
          value: widget.value,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
