// this textField is for otp textField

import '../../../model/utilities/imports/generalImport.dart';


class PinTextField extends StatelessWidget {
  final TextInputType keyInputType;
  final TextEditingController textFieldController;
  final int textFieldLineSpan;
  final String textFieldLabel;
  final String textFieldHint;
  final dynamic functionValue;
  final double height;
  final double width;
  final Color containerColor;
  final bool greyBackground;
  final FocusNode focus;
  final Function onFieldSubmitted;
  final int maxIndex;
  final bool? errorTextActive;

  const PinTextField(
      this.keyInputType,
      this.textFieldController,
      this.textFieldLabel,
      this.textFieldHint,
      this.functionValue,
      this.textFieldLineSpan,
      this.height,
      this.width,
      this.containerColor,
      this.greyBackground,
      this.focus,
      this.onFieldSubmitted,
      this.maxIndex,
      {super.key,
      this.errorTextActive});

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      height: sS(context).cH(height: height),
      width: sS(context).cW(width: width),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * (4 / 932)),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.center,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          cursorColor:  colorsBucket!.primary,
          keyboardType: keyInputType,
          controller: textFieldController,
          maxLines: textFieldLineSpan,
          focusNode: focus,
          textInputAction:
              maxIndex == 4 ? TextInputAction.done : TextInputAction.done,
          onChanged: (change) {
            onFieldSubmitted();
          },
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color:  colorsBucket!.title,
                  fontSize: orientation == Orientation.portrait
                      ? sS(context).cH(height: 30)
                      : dynamicSize.width * (16 / 932),
                  fontWeight: FontWeight.w500)),
          autocorrect: true,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: textFieldLabel,
              hintStyle: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * (30 / 932)
                          : dynamicSize.width * (16 / 932),
                      color:  colorsBucket!.subtitle,
                      fontWeight: FontWeight.w500)),
              hintText: textFieldHint,
              labelStyle: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * (15 / 932)
                          : dynamicSize.width * (16 / 800),
                      color: const Color.fromRGBO(186, 186, 186, 1.0),
                      fontWeight: FontWeight.w500)),
              contentPadding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * (15 / 390),
                  MediaQuery.of(context).size.height * (5 / 844),
                  MediaQuery.of(context).size.width * (2 / 390),
                  MediaQuery.of(context).size.height * (5 / 932)),
              enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                      color: colorsBucket!.borderMid, width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(
                    orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * (4 / 932)
                        : dynamicSize.width * (4 / 800),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorTextActive == true ? colorsBucket!.alertHard :  colorsBucket!.borderBlack,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(
                    orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * (4 / 932)
                        : dynamicSize.width * (4 / 932),
                  ))),
        ),
      ),
    );
  }
}

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
      outLineBorderColor,
      focusBorderColor;
  final bool? noBorder, autoFocus, obscureText, readOnly;
  final Function(dynamic)? onChangedFunction;
  final Function? onTap, onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final bool errorTextActive;
  final String? errorText;
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
    this.errorText,
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
                cursorColor: cursorColor ??  colorsBucket!.borderBlack,
                textInputAction: textInputAction ?? TextInputAction.done,
                keyboardType: keyInputType?? TextInputType.text,
                obscureText: obscureText ?? false,
                obscuringCharacter: '*',
                controller: textFieldController,
                textAlign: textAlign ?? TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
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
                            sS(context).cH(height: 18),  sS(context).cH(height: 14), sS(context).cH(height: 18)),
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
                                : focusBorderColor ??  colorsBucket!.borderBlack,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(
                            sS(context).cH(height: borderRadius ?? 16)))),
              ),
            );
          },
        ),

        if (errorTextActive == true) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              S(h: 5),
              S(
                h: calculateErrorTextHeight(errorText!, context),
                w: 343,
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
