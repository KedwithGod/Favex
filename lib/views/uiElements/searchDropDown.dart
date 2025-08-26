// Generic Dropdown Widget
import '../../../model/utilities/imports/generalImport.dart';

class SearchDropdown<T> extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final List<T> itemList;
  final String hintText;
  final Function(T?) onSelected;
  final Color borderColor;
  final Color? backgroundColor;
  final double height;
  final bool? errorTextActive;
  final String? errorText;
  final double width;
  final String Function(T) labelBuilder; // Function to extract the label

  const SearchDropdown(
      {Key? key,
      required this.focusNode,
      required this.controller,
      required this.itemList,
      required this.hintText,
      required this.onSelected,
      required this.labelBuilder,
      this.borderColor = Colors.grey,
      this.backgroundColor,
      this.height = 52.0,
      this.width = 400.0,
      this.errorTextActive,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        S(
          h: height,
          w: width,
          child: DropdownMenu<T>(
            // focusNode: focusNode,
            controller: controller,
            hintText: hintText,
            width: sS(context).cW(width: width),
            requestFocusOnTap: true,
            enableFilter: true,
            textStyle: GoogleFonts.inter(
              textStyle: TextStyle(
                color: colorsBucket!.title,
                fontSize: sS(context).cH(height: 15),
                fontWeight: FontWeight.w500,
              ),
            ),
            menuHeight: sS(context).cH(height: 400),
            // menuStyle: const MenuStyle(
            //   backgroundColor: Colors. colorsBucket!.white,
            // ),
            inputDecorationTheme: InputDecorationTheme(
                focusColor: Colors.grey,
                contentPadding: EdgeInsets.fromLTRB(
                    sS(context).cW(width: 16), sS(context).cH(height: 2), 0, 0),
                constraints: BoxConstraints.tight(Size.fromHeight(
                  sS(context).cH(height: height),
                )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: borderColor),
                ),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: errorTextActive == true
                            ? colorsBucket!.alertHard
                            : colorsBucket!.borderDisabled,
                        width: 1.0,
                        style: BorderStyle.solid),
                    borderRadius:
                        BorderRadius.circular(sS(context).cW(width: 4))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: errorTextActive == true
                            ? colorsBucket!.alertHard
                            : colorsBucket!.borderMid,
                        width: 1.0,
                        style: BorderStyle.solid),
                    borderRadius:
                        BorderRadius.circular(sS(context).cW(width: 8))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: errorTextActive == true
                            ? colorsBucket!.alertHard
                            : colorsBucket!.borderBlack,
                        width: 1.0,
                        style: BorderStyle.solid),
                    borderRadius:
                        BorderRadius.circular(sS(context).cW(width: 8)))),
            onSelected: onSelected,
            dropdownMenuEntries: itemList.map<DropdownMenuEntry<T>>(
              (T item) {
                return DropdownMenuEntry<T>(
                  value: item,
                  label: labelBuilder(
                      item), // Use the labelBuilder to get the label
                );
              },
            ).toList(),
          ),
        ),

        // error text
        if (errorTextActive == true) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              S(h: 5),
              S(
                h: calculateErrorTextHeight(errorText!, context),
                w: 343,
                child: InterText(nvl(errorText),
                    textColor: colorsBucket!.alertHard,
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
