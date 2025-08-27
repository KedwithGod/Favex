
import 'model/utilities/imports/shared.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        onViewModelReady: (model) {
          model.setAppColors(context);
        },
        builder: (context, model, child) => MaterialApp.router(
      title: 'Favex',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    
    ));
  }
  }
