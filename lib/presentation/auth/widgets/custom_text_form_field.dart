part of '../index.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.title,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction ?? TextInputAction.next,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: title,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.0),
        ),
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
