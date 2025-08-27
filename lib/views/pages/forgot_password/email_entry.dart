// page to collect user email and send user otp


import '../../../model/utilities/imports/shared.dart';

class EmailEntryPage extends StatelessWidget {
  const EmailEntryPage({super.key});

  @override
 Widget build(BuildContext context) {
    return ViewModelBuilder<LockScreenViewModel>.reactive(
        viewModelBuilder: () => LockScreenViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return S();
          })
          ;
        
  }
}