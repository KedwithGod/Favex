

import '../../../model/utilities/imports/generalImport.dart';

class DropDown extends StatelessWidget {
  final List<String>? itemList;
  final List<DropdownMenuItem<String>>? itemWidget;
  final bool? errorTextActive;
  final String? validatorText;
  final FocusNode? focusNode;
  final String? dropDown, hint, errorText;
  final double? elevation, width, height, fontsize;
  final Function onTap;
  final FontWeight? fontWeight;
  final Function(String) onChanged;
  final Color? containerColor,
      textColor,
      dropDownColor,
      focusColor,
      borderColor;

  const DropDown({
    super.key,
    this.itemList,
    this.itemWidget,
    this.validatorText,
    required this.dropDown,
    this.focusNode,
    required this.onChanged,
    this.containerColor,
    this.textColor,
    this.hint,
    required this.onTap,
    this.elevation,
    this.dropDownColor,
    this.borderColor,
    this.focusColor,
    this.width,
    this.height,
    this.fontsize,
    this.fontWeight,
    this.errorTextActive,
    this.errorText,
  }) : assert(
            (itemList != null && itemWidget == null) ||
                (itemList == null && itemWidget != null),
            'Provide either itemList or itemWidget, not both or neither');

  @override
  Widget build(BuildContext context) {
    // Generate dropdown items based on what's provided
    List<DropdownMenuItem<String>> dropdownItems;

    if (itemList != null) {
      // Use itemList to create simple text items
      dropdownItems = itemList!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: InterText(value,textColor: textColor ??  colorsBucket!.borderBlack,
              ),
        );
      }).toList();
    } else {
      // Use the provided custom itemWidget
      dropdownItems = itemWidget!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            height: sS(context).cH(height: height ?? 52),
            width: sS(context).cW(width: width ?? 400),
            padding: EdgeInsets.fromLTRB(
                sS(context).cW(width: 16), sS(context).cH(height: 2), 0, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
                  sS(context).cH(height: 8),
                )),
                border: Border.all(color: borderColor ??  colorsBucket!.borderMid),
                color: containerColor ??  colorsBucket!.white),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: InterText(
                    hint ?? '', textColor: colorsBucket!.borderMid,),
                icon: Padding(
                  padding: EdgeInsets.only(right: sS(context).cW(width: 16.41)),
                  child: GeneralIconDisplay(
                      LineIcons.angleDown,  colorsBucket!.title, UniqueKey(), 15),
                ),
                focusNode: focusNode,
                dropdownColor: dropDownColor ??  colorsBucket!.white,
                focusColor: focusColor ??  colorsBucket!.white,
                isExpanded: true,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontsize ?? 14,
                    fontWeight: fontWeight ?? FontWeight.w400),
                value: dropDown,
                items: dropdownItems,
                onChanged: (value) {
                  onChanged(value!);
                },
              ),
            ),
          ),
        ),

        // error text
        if (errorTextActive == true) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              S(h: 4),
              S(
                h: calculateErrorTextHeight(errorText!, context),
                w: 343,
                child: InterText(
                    errorText ?? '', textColor: colorsBucket!.alertHard,
                    noOfTextLine: 6,
                    textFontSize: 12,
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

// Helper class for creating custom dropdown items more easily
class DropDownHelper {
  // Create a custom dropdown item with icon
  static DropdownMenuItem<String> createItemWithIcon({
    required String value,
    required String text,
    required String icon
  ,
  }) {
    return DropdownMenuItem<String>(
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(icon,color: colorsBucket!.title,),
          S(w: 10),
          InterText(text, textColor:colorsBucket!.title, )
        ],
      ),
    );
  }

  // Create a custom dropdown item with leading widget
  static DropdownMenuItem<String> createItemWithLeading({
    required String value,
    required String text,
    required Widget leading,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return DropdownMenuItem<String>(
      value: value,
      child: Row(
        children: [
          leading,
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: textColor ?? colorsBucket!.title,
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight ?? FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Create a custom dropdown item with subtitle
  static DropdownMenuItem<String> createItemWithSubtitle({
    required String value,
    required String title,
    required String subtitle,
    Color? titleColor,
    Color? subtitleColor,
    double? titleSize,
    double? subtitleSize,
    FontWeight? titleWeight,
  }) {
    return DropdownMenuItem<String>(
      value: value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: titleColor ?? colorsBucket!.title,
              fontSize: titleSize ?? 14,
              fontWeight: titleWeight ?? FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(
              color: subtitleColor ?? Colors.grey[600],
              fontSize: subtitleSize ?? 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // Create a custom dropdown item with badge/tag
  static DropdownMenuItem<String> createItemWithBadge({
    required String value,
    required String text,
    required String badge,
    Color? textColor,
    Color? badgeColor,
    Color? badgeTextColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return DropdownMenuItem<String>(
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor ??  colorsBucket!.title,
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: badgeColor ?? colorsBucket!.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              badge,
              style: TextStyle(
                color: badgeTextColor ??  colorsBucket!.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
