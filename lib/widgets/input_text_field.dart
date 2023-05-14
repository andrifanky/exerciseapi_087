part of 'widget.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.hint,
    required this.textEditingController,
    required this.textInputType,
    required this.textInputAction,
    required this.validatorMessage,
    required this.minLength
  });

  final String label;
  final Icon icon;
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String validatorMessage;
  final int minLength;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: widget.icon
      ),
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      validator: (value) {
        if (value.toString().trim().isEmpty) {
          return widget.validatorMessage;
        }
        if (widget.textInputType == TextInputType.emailAddress) {
          if (!value.toString().contains('@')) {
            return 'Please enter a valid email';
          }
        }
        if (widget.minLength > 0) {
          if (value.toString().trim().length < widget.minLength) {
            return '${widget.label} must be at least ${widget.minLength} characters';
          }
        }
        return null;
      },
    );
  }
}
