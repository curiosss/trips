import 'package:flutter/material.dart';

class KTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;

  const KTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Обязательное поле';
        }
        return null;
      },
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.only(left: Dimens.margin12),
        filled: true,
        // fillColor: widget.fillColor ?? Theme.of(context).colorScheme.surface,
        // suffixIcon: Material(
        //   color: Colors.transparent,
        //   child: IconButton(
        //     onPressed: clear,
        //     icon: const Icon(
        //       Icons.close,
        //       color: AppColors.textGrey,
        //     ),
        //   ),
        // ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        alignLabelWithHint: true,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
