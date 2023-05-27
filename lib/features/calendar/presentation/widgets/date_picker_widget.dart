import 'package:flutter/cupertino.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({
    required this.dates,
    required this.onDatePicked,
    required this.intInitialItem,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  final List<String> dates;
  final void Function(int) onDatePicked;
  final int intInitialItem;
  int selectedIndex;
  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: widget.intInitialItem,
          ),
          selectionOverlay: const SizedBox(),
          itemExtent: 48,
          onSelectedItemChanged: (index) {
            widget.onDatePicked(index);
            setState(() {
              widget.selectedIndex = index;
            });
          },
          children: List<Widget>.generate(
            widget.dates.length,
            (index) {
              final isSelected = widget.selectedIndex == index;
              final weight = isSelected ? FontWeight.bold : FontWeight.normal;

              return Center(
                child: Text(
                  widget.dates[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: weight,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
