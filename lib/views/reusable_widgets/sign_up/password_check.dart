
import '/model/utilities/imports/shared.dart';

Widget buildCriteria(String text, bool isValid) {
    return Row(
      children: [
        GeneralIconDisplay(
          Icons.check_circle,
           isValid ? colorsBucket!.primary : colorsBucket!.alertHard,UniqueKey(),16
        ),
        S(w: 8),
        InterText(text,textColor:isValid ? colorsBucket!.title : colorsBucket!.alertHard, textFontSize: 10,),
      ],
    );
  }
