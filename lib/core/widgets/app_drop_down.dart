import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.options,
    this.value,
    this.onChanged,
  });
  final List<String> options;
  final String? value;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF7F7F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
      ),
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
