import '../../../model/utilities/imports/shared.dart';

Widget pageTab(BuildContext context, {double? top, required TabEnum tabEnum}) {
  return Positioned(
    bottom: sS(context).cH(height: 0),
    child: Container(
      height: sS(context).cH(height: 80),
      width: 375,
      color: colorsBucket!.white,
      child: Row(
        spacing: sS(context).cW(width: 20),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Dashboard page
          _buildTab(
            context,
            tabEnum: tabEnum,
            tab: TabEnum.home,
            image: tabEnum == TabEnum.home ? "home_colored" : "home",
            label: textBucket!.home,
          ),
          _buildTab(
            context,
            tabEnum: tabEnum,
            tab: TabEnum.history,
            image: tabEnum == TabEnum.history ? "history_colored" : "history",
            label: textBucket!.history,
          ),
          _buildTab(
            context,
            tabEnum: tabEnum,
            tab: TabEnum.card,
            image: tabEnum == TabEnum.card ? "card_colored" : "card",
            label: textBucket!.card,
          ),
          _buildTab(
            context,
            tabEnum: tabEnum,
            tab: TabEnum.rate,
            image: tabEnum == TabEnum.rate ? "rate_colored" : "rates",
            label: textBucket!.rates,
          ),
          _buildTab(
            context,
            tabEnum: tabEnum,
            tab: TabEnum.account,
            image: tabEnum == TabEnum.account ? "account_colored" : "account",
            label: textBucket!.account,
          ),
        ],
      ),
    ),
  );
}

Widget _buildTab(BuildContext context, {required TabEnum tabEnum, required TabEnum tab, required String image, required String label}) {
  bool isSelected = tabEnum == tab;

  return InkWell(
    onTap: () {
      if (!isSelected) {
        context.goNamed(tab.route); // Assuming each TabEnum has a route associated with it
      }
    },
    child: S(
      w: 55,
      h: 63,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPngImage(path: image, height: 24, width: 24),
          S(h: 5),
          InterText(
            label,
            textColor: isSelected ? colorsBucket!.primary : colorsBucket!.contentDisabled,
            textFontSize: 12,
            textFontWeight: FontWeight.w400,
          ),
        ],
      ),
    ),
  );
}