import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({super.key, required this.options});
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: options.isNotEmpty ? options[0] : null,
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
      onChanged: (String? newValue) {
        // Handle dropdown value change
      },
    );
  }
}
