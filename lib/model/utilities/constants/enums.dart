// enums acting like state

// page tab enum
enum TabEnum { dashboard, inventory, payments, statistics }

enum ObscureTextEnum { confirmPassword, password }

enum ActivityEnum { all, savings, credit, vas, account }

enum PlanStatus { ongoing, pending, completed }

enum TargetStatus { ongoing, completed, paused }

//vas tab enums
enum AirtimeTopUpEnum {
  onetime,
  auto,
}

enum DataTopUpEnum {
  onetime,
  auto,
}

enum ElectricityTopUpEnum {
  onetime,
  auto,
}

enum CableTopUpEnum {
  onetime,
  auto,
}

enum TargetUserType { owner, partner, sponsor }

// title subtitle enum
enum BothPosition { left, right, center }

// image type
enum ImageTypeEnum { png, svg }

//card type
enum CardTypeEnum {
  masterCard,
  visa,
  verve,
  americanExpress,
  discover,
  others,
  invalid
}

// rtsMenuoptions enum
enum RtsMenuOptionEnum {
  contributionHistory,
  requestSwap,
  disallowPayment,
  rtsExit
}

// targetMenuoptions enum
enum TargetSavingsMenuOptionEnum {
  editPlan,
  transactionHistory,
  pauseSavings,
  resumeSavings,
  terminateSavings,
  leavePlan
}

//rts status
enum RtsStatusEnum { completed, pending, ongoing }

//notification type
enum NotificationType {
  newMember,
  swapRequest,
  disallowPayment,
  planParameter,
}

//credit eligibility enum
enum CreditEligibleEnum {
  isEligible,
  lowCreditScore,
  lowAccount,
}

// transaction status

enum TransactionStatusEnum { complete, failed, mixed }

// customer care bottom sheet
enum CustomerCareBottomSheetEnum { natureOfIssue, channels }
