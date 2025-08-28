



import '/model/utilities/imports/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return BaseUi(
            children: [
              rowPositioned(
                  top: 0,
                  bottom: 20,
                  child: S(
                    h: 748,
                    w: 335,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // heading
                          ],
                      ),
                    ),

                  )),

                
            ],
            bottomNavigationBar: pageTab(context, tabEnum: TabEnum.home),
          );
        });
  }
}