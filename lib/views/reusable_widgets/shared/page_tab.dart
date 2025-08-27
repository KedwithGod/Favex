// page tab

import '../../../model/utilities/imports/shared.dart';

Widget pageTab(BuildContext context, {double? top, TabEnum? tabEnum}) {
  return Positioned(
    bottom: sS(context).cH(height: 0),
    child: Container(
      width: sS(context).w,
      height: sS(context).cH(height: 78),
      decoration: BoxDecoration(
        color: colorsBucket!.white,
        boxShadow: [
          BoxShadow(
            color: Color(int.parse('0x3F000000')),
            blurRadius: 20,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      padding: EdgeInsets.only(top: sS(context).cH(height: 9.5)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // dashboard page
          // tabWidget(context,
          //     image: tabEnum == TabEnum.dashboard
          //         ? "dashboardSelected"
          //         : "dashboardUnselected",
          //     isSelected: tabEnum == TabEnum.dashboard ? true : false,
          //     left: 26,
          //     label: "Dashboard",
          //     navigation: tabEnum == TabEnum.dashboard
          //         ? () {}
          //         : () {
          //             context.goNamed(dashboardPageRoute);
          //           }),
          // inventory page
        
        ],
      ),
    ),
  );
}

Widget tabWidget(context,
    {required String image,
    required String label,
    required bool isSelected,
    double? left,
    double? right,
    Function? navigation}) {
  return InkWell(
    onTap: () {
      navigation!();
    },
    child: Column(
      //mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // dashboard page
        SvgPicture.asset("assets/svg/$image.svg",
            height: sS(context).cH(height: 22)),
        S(h: 10),
        //label
        InterText(label,textColor:  isSelected ?  colorsBucket!.primary :  colorsBucket!.disabled,
            textFontWeight:  FontWeight.w500, ),
        // indicator
      ],
    ),
  );
}
