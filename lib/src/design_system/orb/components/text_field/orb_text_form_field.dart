import 'package:flutter/material.dart';

import '../../orb.dart';

class OrbTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final String? helperText;
  final bool? showCounterText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool readOnly;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final Color? fillColor;
  final Color? boarderColor;
  final OrbTextType? style;
  final EdgeInsets? contentPadding;

  const OrbTextField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.hintText,
    this.helperText,
    this.showCounterText = false,
    this.keyboardType,
    this.textInputAction,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.readOnly = false,
    this.autofocus = false,
    this.onSubmitted,
    this.onChanged,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.suffixIcon,
    this.focusNode,
    this.onTap,
    this.fillColor,
    this.boarderColor,
    this.style = OrbTextType.bodyMedium,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrbTextFieldState();
  }
}

class _OrbTextFieldState extends State<OrbTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final themeData = OrbThemeData.of(context);
    final palette = themeData.palette;
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      onTap: widget.onTap,
      style: switch (widget.style) {
        OrbTextType.titleLarge => themeData.textTheme.titleLarge,
        OrbTextType.titleMedium => themeData.textTheme.titleMedium,
        OrbTextType.titleSmall => themeData.textTheme.titleSmall,
        OrbTextType.bodyLarge => themeData.textTheme.bodyLarge,
        OrbTextType.bodyMedium => themeData.textTheme.bodyMedium,
        OrbTextType.bodySmall => themeData.textTheme.bodySmall,
        _ => themeData.textTheme.bodyMedium,
      },
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      maxLength: widget.maxLength,
      validator: widget.validator,
      maxLines: widget.maxLines,
      cursorColor: palette.primary,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        counterText: widget.showCounterText == true ? null : '',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: widget.hintText,
        helperText: widget.helperText,
        helperStyle: themeData.textTheme.bodySmall,
        hintStyle: switch (widget.style) {
          OrbTextType.titleLarge => themeData.textTheme.titleLarge.copyWith(
              color: palette.surface,
            ),
          OrbTextType.titleMedium => themeData.textTheme.titleMedium.copyWith(
              color: palette.surface,
            ),
          OrbTextType.titleSmall => themeData.textTheme.titleSmall.copyWith(
              color: palette.surface,
            ),
          OrbTextType.bodyLarge => themeData.textTheme.bodyLarge.copyWith(
              color: palette.surface,
            ),
          OrbTextType.bodyMedium => themeData.textTheme.bodyMedium.copyWith(
              color: palette.surface,
            ),
          OrbTextType.bodySmall => themeData.textTheme.bodySmall.copyWith(
              color: palette.surface,
            ),
          _ => themeData.textTheme.bodyMedium.copyWith(
              color: palette.surface,
            ),
        },
        errorStyle: themeData.textTheme.bodySmall.copyWith(
          color: palette.error,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: palette.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: palette.error,
          ),
        ),
        contentPadding: widget.contentPadding,
        filled: true,
        fillColor: widget.fillColor ?? palette.surfaceBright,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: widget.boarderColor ?? palette.surfaceBright,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: widget.boarderColor ?? palette.surfaceBright,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        suffixIcon: widget.obscureText
            ? InkWell(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: OrbIcon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
      ),
    );
  }
}
