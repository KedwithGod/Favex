// this textField is for otp textField

import '../../../model/utilities/imports/shared.dart';



class FormattedTextFields extends StatelessWidget {
  final TextInputType? keyInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? textFieldController;
  final int? textFieldMinLineSpan, textFieldLineSpan, maxLength;
  final String? textFieldHint;
  final double? height, width, textFont, hintFont, labelFont, borderRadius;
  final Color? containerColor,
      cursorColor,
      hintColor,
      labelColor,
      outLineBorderColor,fillColor,
      focusBorderColor;
  final bool? noBorder, autoFocus, obscureText, readOnly,filled;
  final Function(dynamic)? onChangedFunction;
  final Function? onTap, onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final bool errorTextActive;
  final String? errorText,obscuringCharacter;
  final FocusNode? focusNode;
  final Widget? prefixIcon, suffixIcon,suffix;
  final Widget? prefix;
  final FontWeight? textFontWeight, hintFontWeight, labelFontWeight;
  final FloatingLabelBehavior? labelBehaviour;
  final bool? enableInteractiveSelection;
  final Alignment? align;
  final double? cursorHeight;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;

  const FormattedTextFields({
    Key? key,
    this.keyInputType,
    required this.textFieldController,
    required this.textFieldHint,
    this.textFieldLineSpan,
    this.height,
    this.width,
    this.textFieldMinLineSpan,
    this.containerColor,
    this.enableInteractiveSelection,
    this.noBorder = true,
    this.autoFocus,
    this.textInputAction,
    this.inputFormatters,
    required this.onChangedFunction,
    required this.errorTextActive,
    required this.focusNode,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.textFont,
    this.hintFont,
    this.labelFont,
    this.cursorHeight,
    this.borderRadius,
    this.cursorColor,
    this.hintColor,
    this.labelColor,
    this.outLineBorderColor,
    this.focusBorderColor,
    this.textFontWeight,
    this.hintFontWeight,
    this.labelFontWeight,
    this.obscureText,
    this.labelBehaviour,
    this.maxLength,
    this.align,
    this.onTap,
    this.readOnly,
    this.textAlign,
    this.contentPadding,
    this.onEditingComplete,
    this.errorText, this.fillColor, this.filled, this.obscuringCharacter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // import dart:math as math at top via generalImport? If not, rely on prefixed usage.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // text field
        LayoutBuilder(
          builder: (context, boxConstraints) {
            final double desiredHeight = sS(context).cH(height: height ?? 56);
            final bool hasTightMaxHeight = boxConstraints.maxHeight.isFinite &&
                boxConstraints.maxHeight > 0;
            final double effectiveHeight = hasTightMaxHeight
                ? min(desiredHeight, boxConstraints.maxHeight)
                : desiredHeight;
            return Container(
              height: effectiveHeight,
              width: sS(context).cW(width: width ?? 335),

              decoration: BoxDecoration(
                color: containerColor ??  colorsBucket!.backgroundMid,
            
                
                borderRadius: BorderRadius.circular(
                   sS(context).cH(height: borderRadius ?? 16)),
              ),
              alignment: align ?? Alignment.center,
              child: TextFormField(
                focusNode: focusNode,
                onTap: () {
                  if (onTap != null) onTap!();
                },
                
                onChanged: onChangedFunction!, // this function to validate the

                // text field as the user types in it
                autofocus: autoFocus ?? false,
                enabled: readOnly ?? true,
                cursorHeight: cursorHeight,
                cursorColor: cursorColor ?? (textFieldController!.text.isEmpty? colorsBucket!.primary: colorsBucket!.borderBlack),
                textInputAction: textInputAction ?? TextInputAction.done,
                keyboardType: keyInputType?? TextInputType.text,
                obscureText: obscureText ?? false,
                
                
                obscuringCharacter: obscuringCharacter??'*',
                controller: textFieldController,
                textAlign: textAlign ?? TextAlign.start,
                textAlignVertical: TextAlignVertical.center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ,
                enableInteractiveSelection: enableInteractiveSelection,
                minLines: textFieldMinLineSpan,
                maxLines: textFieldLineSpan ?? 1,
                inputFormatters: inputFormatters??[],
                onEditingComplete: () {
                  if (onEditingComplete != null) onEditingComplete!();
                },

                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color:  colorsBucket!.title,
                        fontSize: sS(context).tsf.scale((textFont??14)*0.8),
                        height: 1.5,
                        fontWeight: textFontWeight ?? FontWeight.w400)),
                decoration: InputDecoration(
                    prefixIcon: prefixIcon,
                    filled: filled??false,
                    fillColor: fillColor??colorsBucket!.transparent,
                    suffix:suffix,
                    suffixIcon: suffixIcon,
                    prefix: prefix,
                    hintStyle: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: sS(context).tsf.scale((hintFont??14)*0.8) ,
                            color: hintColor ??  colorsBucket!.subtitle,
                            fontWeight: hintFontWeight ?? FontWeight.normal)),
                    hintText: textFieldHint,
                    prefixIconConstraints:
                        const BoxConstraints(minWidth: 0, minHeight: 0),
                    contentPadding: contentPadding ??
                        EdgeInsets.fromLTRB(sS(context).cW(width: 14),
                            sS(context).cH(height: 18),  sS(context).cW(width: 14), sS(context).cH(height: 18)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: noBorder == true
                            ? BorderSide.none
                            : BorderSide(
                                color: outLineBorderColor ??  colorsBucket!.borderDisabled,
                                width: 1.0,
                                style: noBorder == true
                                    ? BorderStyle.none
                                    : BorderStyle.solid),
                        borderRadius: BorderRadius.circular(
                           sS(context).cH(height: borderRadius ?? 16))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: noBorder == true
                            ? BorderSide.none
                            : BorderSide(
                                color: outLineBorderColor ??  colorsBucket!.borderMid,
                                width: 1.0,
                                style: noBorder == true
                                    ? BorderStyle.none
                                    : BorderStyle.solid),
                        borderRadius: BorderRadius.circular(
                           sS(context).cH(height: borderRadius ?? 16))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          
                            color: errorTextActive == true
                                ? colorsBucket!.alertHard
                                : focusBorderColor ?? ( textFieldController!.text.isEmpty? colorsBucket!.primary:  colorsBucket!.borderBlack),
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(
                            sS(context).cH(height: borderRadius ?? 16)))),
              ),
            );
          },
        ),

        if (errorTextActive == true && errorText!= '') ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              S(h: 5),
              S(
                h: calculateErrorTextHeight(errorText??'', context),
                w:  width ?? 335,
                child: InterText(
                    errorText ?? '', textColor:  colorsBucket!.alertHard, 
                    noOfTextLine: 6, textFontSize: 12,
                    textAlign: TextAlign.left),
              ),
              S(h: 4),
            ],
          )
        ]
        // for showing error text under text fields
      ],
    );
  }
}




class PhoneNumberTextField extends StatefulWidget {
  final TextEditingController textFieldController;
  final FocusNode focusNode;
  final Function(PhoneNumber)? onChangedFunction;
  final bool errorTextActive;
  final String? errorText;

  // Style props
  final double? height, width, borderRadius, cursorHeight, textFont, hintFont;
  final Color? containerColor, cursorColor, hintColor, outLineBorderColor, focusBorderColor, fillColor;
  final bool? filled, noBorder;
  final Widget? prefix, suffix, suffixIcon;
  final EdgeInsets? contentPadding;

  const PhoneNumberTextField({
    super.key,
    required this.textFieldController,
    required this.focusNode,
    required this.onChangedFunction,
    required this.errorTextActive,
    this.errorText,
    this.height,
    this.width,
    this.borderRadius,
    this.cursorHeight,
    this.textFont,
    this.hintFont,
    this.containerColor,
    this.cursorColor,
    this.hintColor,
    this.outLineBorderColor,
    this.focusBorderColor,
    this.fillColor,
    this.filled,
    this.noBorder,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.contentPadding,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: sS(context).cH(height: widget.height ?? 56),
          width: sS(context).cW(width: widget.width?? 335),
          decoration: BoxDecoration(
            color: widget.containerColor ?? colorsBucket!.backgroundMid,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
          ),
          alignment: Alignment.center,
          child: InternationalPhoneNumberInput(
            focusNode: widget.focusNode,
            textFieldController: widget.textFieldController,
            initialValue: _phoneNumber,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
              setSelectorButtonAsPrefixIcon: true,
              leadingPadding: 8,
            ),
            onInputChanged: (phone) {
              setState(() => _phoneNumber = phone); // ✅ updates dropdown
              if (widget.onChangedFunction != null) {
                widget.onChangedFunction!(phone);
              }
            },
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              filled: widget.filled ?? false,
              fillColor: widget.fillColor ?? colorsBucket!.transparent,
              suffixIcon: widget.suffixIcon,
              suffix: widget.suffix,
              prefix: widget.prefix,
              hintText: "8000000000",
              hintStyle: GoogleFonts.inter(
                fontSize: widget.hintFont ?? 14,
                color: widget.hintColor ?? colorsBucket!.subtitle,
              ),
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            ),
            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
            cursorColor: widget.cursorColor ?? colorsBucket!.primary,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: GoogleFonts.inter(
              fontSize: widget.textFont ?? 14,
              color: colorsBucket!.borderBlack,
            ),
          ),
        ),
         if (widget.errorTextActive == true && widget.errorText!= '') ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              S(h: 5),
              S(
                h: calculateErrorTextHeight(widget.errorText??'', context),
                w:  widget.width ?? 335,
                child: InterText(
                    widget.errorText ?? '', textColor:  colorsBucket!.alertHard, 
                    noOfTextLine: 6, textFontSize: 12,
                    textAlign: TextAlign.left),
              ),
              S(h: 4),
            ],
          )
        ]
      ],
    );
  }
}
