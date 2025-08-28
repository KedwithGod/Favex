import 'package:favex/model/utilities/imports/shared.dart';


class PinCodeFields extends StatefulWidget {
  final int length;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;
  final bool errorTextActive;
  final String errortext;

  const PinCodeFields({
    super.key,
    this.length = 4,
    required this.onChanged,
    required this.onCompleted,
    required this.errorTextActive,
    required this.errortext,
  });

  @override
  State<PinCodeFields> createState() => _PinCodeFieldsState();
}

class _PinCodeFieldsState extends State<PinCodeFields> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value, context) {
    String code = _controllers.map((e) => e.text).join();
    widget.onChanged(code);

    // Move to next field if typed
    if (value.isNotEmpty && index < widget.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }

    // Move to previous if backspace
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    // Completed PIN
    if (code.length == widget.length &&
        !_controllers.any((c) => c.text.isEmpty)) {
      widget.onCompleted(code);
    }
  }

  void _addNumber(BuildContext context, number) {
    // Return 0 if the number pressed is 11
    if (number == 11) {
      number = 0;
    }
    for (int i = 0; i < widget.length; i++) {
      if (_controllers[i].text.isEmpty) {
        _controllers[i].text = number.toString();
        _onChanged(i, number.toString(), context);
        return;
      }
    }
  }

  void _deleteLast(
    BuildContext context,
  ) {
    for (int i = widget.length - 1; i >= 0; i--) {
      if (_controllers[i].text.isNotEmpty) {
        _controllers[i].clear();
        _onChanged(i, '', context);
        return;
      }
    }
  }

  _openBiometric(BuildContext context) {
    openBiometric(context,action: () {
      print('action called');
      // Navigate to another page or perform another action
      context.goNamed(dashboardPageRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: widget.errorTextActive ? 0 : 40,
      children: [
        S(
          w: 230,
          h: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.length, (index) {
              return GeneralContainer(
                width: 50,
                height: 55,
                color: widget.errorTextActive
                    ? colorsBucket!.transparent
                    : (_controllers[index].text.isEmpty
                        ? colorsBucket!.white
                        : colorsBucket!.primaryLemon),
                borderRadius: 12,
                borderColor: widget.errorTextActive
                    ? colorsBucket!.alertHard
                    : (_controllers[index].text.isEmpty
                        ? colorsBucket!.disabled
                        : colorsBucket!.primary),
                child: Center(
                    child: _controllers[index].text.isEmpty
                        ? const InterText(
                            '',
                          )
                        : CircleAvatar(
                            radius: sS(context).cH(height: 7), // Adjust the size of the circle here
                            backgroundColor:  widget.errorTextActive
                    ? colorsBucket!.alertHard
                    : 
                        colorsBucket!.primary,
                          )),
              );
            }),
          ),
        ),
        if (widget.errorTextActive) ...[
          S(h: 8),
          InterText(widget.errortext,
              textColor: colorsBucket!.alertHard, textFontSize: 12),
          S(h: 16),
        ],
        S(
          w: 249,
          h: 312,
          child: Wrap(
            runSpacing: sS(context).cH(height: 20),
            alignment: WrapAlignment.spaceBetween,
            children: [
              for (int number in List.generate(12, (index) => index + 1))
                GestureDetector(
                  onTap: () => number == 12
                      ? _deleteLast(context)
                      : number == 10
                          ? _openBiometric(context)
                          : _addNumber(context, number),
                  child: GeneralContainer(
                    height: 63,
                    width: 63,
                    color: colorsBucket!.backgroundMid,
                    borderRadius: 20,
                    borderColor: colorsBucket!.transparent,
                    child: Center(
                      child: number == 12
                          ? const SvgPngImage(
                              path: 'delete', height: 22, width: 10)
                          : number == 10
                              ? const SvgPngImage(
                                  path: 'finger_check', height: 22, width: 10)
                              : number == 11
                                  ? const InterText('0', textFontSize: 22)
                                  : InterText(number.toString(),
                                      textFontSize: 22),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
