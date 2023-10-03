import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSwitchWidget extends StatefulWidget {
  const CardSwitchWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.colorShade,
  });

  final Icon icon;
  final String text;
  final List<Color> colorShade;

  @override
  State<CardSwitchWidget> createState() => _CardSwitchWidgetState();
}

class _CardSwitchWidgetState extends State<CardSwitchWidget> {
  bool goalVariable = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: Get.size.width,
        height: 80,
        decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: widget.colorShade,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Center(
                child: widget.icon,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Switch(
              value: goalVariable,
              onChanged: (active) {
                setState(() {
                  goalVariable = !goalVariable;
                });
              },
              trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.grey,
              inactiveThumbColor: Colors.white,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
