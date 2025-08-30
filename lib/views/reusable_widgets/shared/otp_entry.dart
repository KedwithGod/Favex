// Adjust this import according to your structure

import '../../../model/utilities/imports/shared.dart';

class PinEntryScreen extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;
  final bool errorTextActive;
  final String errortext, bottomSheetSubtitle;
  final int length;
  final VoidCallback resendFunction;
  final VoidCallback actionButtonFunction;

 const PinEntryScreen({
    Key? key,
    required this.onChanged,
    required this.onCompleted,
    required this.errorTextActive,
    required this.errortext,
    required this.resendFunction,
    required this.actionButtonFunction,
    this.length = 6, required this.bottomSheetSubtitle,
  }) : super(key: key);

  @override
  State<PinEntryScreen> createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  int _currentIndex = 0;
  int _start = 180;
  bool allFieldFilled = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _startTimer();
  }

  void _initializeControllers() {
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer!.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void reload() {
    // Reset the state
    _start = 30; // Reset timer
    _initializeControllers(); // Clear the text fields
    _startTimer(); // Restart the timer
    setState(() {}); // Trigger a rebuild
  }

  void _onChanged(String value, int index, BuildContext context) {
    if (value.length == 1) {
      _controllers[index].text = value;
      widget.onChanged(value);
      allFieldFilled = false;

      if (index < widget.length - 1) {
        FocusScope.of(context).nextFocus();
      } else {
        allFieldFilled = true;
        _onCompleted();
      }
    } else if (value.isEmpty && index > 0) {
      // Move to previous field when deleting
      setState(() {
        _currentIndex--;
      });
      FocusScope.of(context).previousFocus();
    }
  }

  void _onCompleted() {
    String pin = _controllers.map((controller) => controller.text).join();
    widget.onCompleted(pin);
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        S(
          h: 44,
          w: 290,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.length, (index) {
              return S(
                w: 40,
                h: 64,
                child: FormattedTextFields(
                  keyInputType: TextInputType.number,
                  textFieldController: _controllers[index],
                  textFieldHint: '',
                  onChangedFunction: (value) {
                    _onChanged(value, index, context);
                  },
                  width: 40,
                  height: 44,
                  textInputAction: TextInputAction.next,

                  focusNode: _focusNodes[index],
                  errorTextActive: widget.errorTextActive,
                  errorText: '',
                  containerColor: colorsBucket!.transparent,
                  borderRadius: 12,
                  contentPadding: EdgeInsets.fromLTRB(
                      sS(context).cW(width: 0),
                      sS(context).cH(height: 13),
                      sS(context).cW(width: 0),
                      sS(context).cH(height: 13)),

                  outLineBorderColor: widget.errorTextActive
                      ? colorsBucket!.alertHard
                      : (_controllers[index].text.isEmpty
                          ? colorsBucket!.disabled
                          : colorsBucket!.primary),
                  focusBorderColor: widget.errorTextActive
                      ? colorsBucket!.alertHard
                      : (_controllers[index].text.isEmpty
                          ? colorsBucket!.disabled
                          : colorsBucket!.primary),
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  filled: true,
                  noBorder: false,
                  fillColor: widget.errorTextActive
                      ? colorsBucket!.transparent
                      : (_controllers[index].text.isEmpty
                          ? colorsBucket!.backgroundMid
                          : colorsBucket!.primaryLemon), // Default fill color
                ),
              );
            }),
          ),
        ),
        S(h: 20),
        if (!widget.errorTextActive && !allFieldFilled) ...[
          InterText(
            '${textBucket!.resendIn}: 00:${_start.toString().padLeft(2, '0')}',
            textColor: colorsBucket!.alertHard,
          ),
        ],

        if (widget.errorTextActive) ...[
          InterText(widget.errortext,
              textColor: colorsBucket!.alertHard, textFontSize: 12),
        ],

        S(h: 28),
        // verify otp button

        buttonNoPositioned(context,
            text: textBucket!.continueText,
            textColor: allFieldFilled && widget.errorTextActive == false
                ? colorsBucket!.primarySoft
                : colorsBucket!.subtitle,
            buttonColor: allFieldFilled && widget.errorTextActive == false
                ? colorsBucket!.primary
                : colorsBucket!.disabled, navigator: () {
          if (allFieldFilled && widget.errorTextActive == false) {
            ConfirmationSheet.show(
              context,
              subtitle: widget.bottomSheetSubtitle,
              onPressed: () {
                // Navigator.pop(context); // Close sheet/dialog

                // Navigate or perform your action
                widget.actionButtonFunction();
              },
            );
          }
        }),

        S(h: 16),
        GestureDetector(
          onTap: () {
            widget.resendFunction();
            reload();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InterText(textBucket!.didntReceiveAnything),
              S(w: 5),
              ImageAvatar(
                image: 'resend',
                imageRadius: 7.5,
                backgroundColor: colorsBucket!.primaryLemon,
              ),
              S(w: 5),
              InterText(
                textBucket!.resend,
                textColor: colorsBucket!.primary,
              ),
            ],
          ),
        )
      ],
    );
  }
}
