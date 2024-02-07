import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:hero_games_case/presentation/utils/custom_colors.dart';

class BirthDatePicker extends StatefulWidget {
  final Function(DateTime birtDate)? selectDate;
  const BirthDatePicker({super.key, required this.selectDate});

  @override
  _BirthDatePickerState createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  DateTime selectedDate = DateTime.now();
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
            child: GestureDetector(
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime.now(),
                  onConfirm: (date) {
                    setState(() {
                      selectedDate = date;
                      widget.selectDate!(date);
                    });
                  },
                  currentTime: selectedDate,
                );
              },
              child: Row(
                children: [
                  const Text(
                    'Doğum Tarihi:     ',
                    style: TextStyle(
                      color: CustomColors.nileBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    style: const TextStyle(
                      color: CustomColors.nileBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
