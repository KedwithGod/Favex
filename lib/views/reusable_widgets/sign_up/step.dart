import '/model/utilities/imports/shared.dart';

class StepTracker extends StatelessWidget {
  final int? totalStep;
  final int currentStep;
  const StepTracker({super.key, this.totalStep = 4, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return S(
      h: 16,
      w: 335,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InterText(
            "${textBucket!.step} 1 ${textBucket!.of} $totalStep",
            textFontSize: 12,
          ),
          Row(
            children: [
              for (int step
                  in List.generate(totalStep!, (index) => index + 1)) ...[
                GeneralContainer(
                  height: 5,
                  width: 22 * sS(context).removeWidthAdjustment(),
                  color: currentStep == step
                      ? colorsBucket!.primary
                      : colorsBucket!.disabled,
                  borderRadius: 100,
                ), S(w:4)
              ]
            ],
          )
        ],
      ),
    );
  }
}
