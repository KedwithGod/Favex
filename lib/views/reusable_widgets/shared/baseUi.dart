

import '../../../model/utilities/imports/shared.dart';


class BaseUi extends StatelessWidget {
  final List<Widget> children;
  final FloatingActionButton? floatingActionButton;
  final AppBar? appBar;
  final bool? allowBackButton;
  final bool? safeTop, safeBottom;
  final Function? onRefreshFunction;
  final bool refreshedEnabled;
  final Color? containerColor;
  final Widget? bottomNavigationBar;

  const BaseUi(
      {Key? key,
      this.allowBackButton,
      required this.children,
      this.floatingActionButton,
      this.appBar,
      this.safeTop,
      this.safeBottom,
      this.refreshedEnabled = true,
      this.onRefreshFunction,
      this.containerColor, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        onViewModelReady: (model) async {
       
        },
        onDispose: (model) {},
        disposeViewModel: false,
        builder: (context, model, child) {
          return WillPopScope(
              onWillPop: () async {
                return allowBackButton ?? true;
              },
              child:RefreshIndicator(
                      displacement: 100,
                      backgroundColor:  colorsBucket!.primary,
                      color:  colorsBucket!.white,
                      strokeWidth: 3,
                      triggerMode: RefreshIndicatorTriggerMode.onEdge,
                      onRefresh: () async {
                        if (onRefreshFunction != null) {
                          return onRefreshFunction!();
                        }
                      },
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                        value:
                             SystemUiOverlayStyle(statusBarColor:  colorsBucket!.white),
                        child: Scaffold(
                          appBar: appBar,
                          body: SafeArea(
                            bottom: safeBottom ?? true,
                            top: safeTop ?? true,
                            child: GestureDetector(
                              onHorizontalDragEnd: (details) {
                                final double horizontalVelocity =
                                    details.primaryVelocity ?? 0;
                                if (horizontalVelocity > 0) {
                                  if (backButtonRedirectBucket != null) {
                                    router.goNamed(backButtonRedirectBucket!);
                                  }
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: containerColor ??  colorsBucket!.white,
                                child: Stack(
                                  children: children,
                                ),
                              ),
                            ),
                          ),
                          floatingActionButton: floatingActionButton,
                          bottomNavigationBar:bottomNavigationBar,
                        ),
                      ),
                    ));
        });
  }
}
