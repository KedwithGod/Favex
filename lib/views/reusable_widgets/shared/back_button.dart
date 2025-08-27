// this is a general back button for the pages


import '../../../model/utilities/imports/shared.dart';

Widget backButton(BuildContext context,
    {double top = 60,
    double left = 16,
    Color? color,
    Color? arrowColor,
    double? size,
    String? navigateTo,
    Function? navigator}) {
  return AdaptivePositioned(
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (navigator != null)
              ? () {
                  navigator();
                }
              : (navigateTo != null)
                  ? () {
                      context.goNamed(navigateTo);
                    }
                  : () {
                      Navigator.pop(context);
                    },
          child:  Icon(
           LineIcons.angleLeft,
            size: 24,
            color:  colorsBucket!.title,
          ),
        ),
      ],
    ),
    top: top,
    left: left,
  );
}

Widget backButtonNoPositioned(BuildContext context,
    {
    Color? color,
    Color? arrowColor,
    double? size,
    String? navigateTo,
    Function? navigator}) {
  return 
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (navigator != null)
              ? () {
                  navigator();
                }
              : (navigateTo != null)
                  ? () {
                      context.goNamed(navigateTo);
                    }
                  : () {
                      Navigator.pop(context);
                    },
          child:  Icon(
           LineIcons.angleLeft,
            size: 24,
            color:  colorsBucket!.title,
          ),
         
        ),
      ],
    );
}
