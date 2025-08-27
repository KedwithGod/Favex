import '../../../model/utilities/imports/shared.dart';

Widget customDialog(context, child,
    {Alignment? align,
    double? x,
    double? y,
    Color? color,
    double? borderRadius,
    double? padding,
    double? width,
    double? height}) {
  return Align(
    alignment: align ?? Alignment(x!, y!),
    // for y -1 to 1 (from top to bottom)
    // for x -1 to 1 (from left to right)
    child: S(
      h: height ?? 300,
      w: width ?? 300,
      child: Material(
        color: color ?? colorsBucket!.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                sS(context).cH(height: borderRadius ?? 10))),
        child: Padding(padding: EdgeInsets.all(padding ?? 20.0), child: child),
      ),
    ),
  );
}

loadingNoScheduleDialog(BuildContext context,
    {required String text, Color? color, required Function? onWillPop}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ViewModelBuilder<BaseModel>.reactive(
            viewModelBuilder: () => BaseModel(),
            onViewModelReady: (model) async {},
            disposeViewModel: false,
            // ignore: deprecated_member_use
            builder: (context, model, child) => WillPopScope(
              onWillPop: () async {
                if (onWillPop == null) {
                  return true;
                } else {
                  return onWillPop();
                }
              },
              child: Center(
                child: customDialog(context, Center(child: loading()),
                    align: Alignment.center, height: 150, width: 150),
              ),
            ),
          ));
}

// loading dialog
loadingDialog(BuildContext context,
    {required String text,
    Color? color,
    Function? onWillPop,
    int? height,
    int? width}) async {
  return SchedulerBinding.instance.addPostFrameCallback(
    (_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ViewModelBuilder<BaseModel>.reactive(
              viewModelBuilder: () => BaseModel(),
              onViewModelReady: (model) async {},
              disposeViewModel: false,
              builder: (context, model, child) => WillPopScope(
                onWillPop: () async {
                  if (onWillPop == null) {
                    return true;
                  } else {
                    return onWillPop();
                  }
                },
                child: Center(
                  child: customDialog(context, Center(child: loading()),
                      align: Alignment.center,
                      height: 150,
                      width: 150,
                      color: color ?? colorsBucket!.white),
                ),
              ),
            )),
  );
}

