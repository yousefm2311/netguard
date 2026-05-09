import 'package:flutter/material.dart';

class NgTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final String? Function(String?)? validator;
  final bool readOnly;

  const NgTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.prefix,
    this.suffix,
    this.obscure = false,
    this.validator,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          validator: validator,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
