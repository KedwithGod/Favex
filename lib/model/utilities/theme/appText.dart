class AppTexts {
  // Common texts (don’t change across themes)
  static const String appName = 'Favex';
 


  // Theme-specific texts
  final String welcomeMessage;
  final String emailAddress;
  final String enterEmail;
  final String emailHint;
  final String password;
  final String enterPassword;
  final String forgotPassword;
  final String enterOtpEmail;
  final String resetIt;
  final String login;
  final String signInWith;
  final String welcomeMessageSubtitle;
  final String signUp;
  final String noAccount;
  final String enterPin;
  final String hi;
  final String iAmNot;
  final String scanFingerprint;
  final String authError;
  final String biometricNotAvailable;
  final String noBiometricsEnrolled;
  final String authorized;
  final String notAuthorized;
  final String biometricAuthentication;
  final String getOTP;


  final String verificationCode;
  final String enterOtp;
  final String enterOTPSubtitle;
  final String didntReceiveAnything;
  final String resendIn;
  final String continueText;
  final String resend;
  final String incorrectOTPAttempt;
  final String otpSentEmailSuccess;
  final String otpVerification;
  final String otpVerified;
  final String verificationCompletedPassword;
  final String createNewPassword;
  final String confirm;
  final String newPassword;
  final String newPasswordCreated;
  final String newPasswordCreationCompleted;
  final String logOut;
  final String step;
  final String of;
  final String createAccount;
  final String signUpEmailAddressForOTPVerification;
  final String continueAgreeingToFavex;
  final String and;
  final String privacyPolicy;
  final String TermsAndConditions;
  final String verificationCompletedNextStepButton;
  final String createAnAccount;
  final String correctDetailsFlag;
  final String howDoYouHearAboutUsOptional;
  final String createUsername;
  final String username;
  final String firstName;
  final String lastName;
  final String selectOption;
  final String referralTagOptional;
  final String enterReferralTag;
  final String phoneNumber;
  final String others;
  final String Influencer;
  final String createPassword;
  final String createPasswordForAccountAccessInSecureLocation;
  final String confirmPassword;
  final String createTransactionPin;
  final String setTransactionPin;
  final String transactionPinSecurityLevel;
  final String enterTransactionPinAgain;
  final String transactionPinCreated;
  final String pinCreatedSuccessfully;
  final String notRightNow;
  final String yesEnableBiometrics;
  final String signInInstantlyWithTouchFaceID;
  final String wouldLikeToUseTouchFaceIDToSignIntoFavex;
  final String pinNotMatchError;
  final String confirmTransactionPin;
  final String enableBiometric;
  const AppTexts( {
    required this.welcomeMessage,
    required this.emailAddress,
    required this.enterEmail,
    required this.password,
    required this.enterPassword,
    required this.forgotPassword,
    required this.resetIt,
    required this.login,
    required this.signInWith,
    required this.signUp,
    required this.welcomeMessageSubtitle,
    required this.noAccount,
    required this.enterPin, required this.hi, required this.iAmNot,
    required this.enterOtpEmail,

    required this.scanFingerprint ,
    required this.authError ,
    required this.biometricNotAvailable ,
    required this.noBiometricsEnrolled ,
    required this.authorized ,
    required this.notAuthorized ,
    required this.biometricAuthentication ,
    required this.emailHint,
    required this.getOTP,
 
    required this.verificationCode,
    required this.enterOtp,
    required this.enterOTPSubtitle,
    required this.didntReceiveAnything,
    required this.resendIn,
    required this.continueText,
    required this.resend,
    required this.incorrectOTPAttempt,
    required this.otpSentEmailSuccess,
    required this.otpVerification,
    required this.otpVerified,
    required this.verificationCompletedPassword,
    required this.createNewPassword,
    required this.confirm,
    required this.newPassword,
    required this.newPasswordCreated,
    required this.newPasswordCreationCompleted,
    required this.logOut,
    required this.step,
    required this.of,
    required this.createAccount,
    required this.signUpEmailAddressForOTPVerification,
    required this.continueAgreeingToFavex,
    required this.and,
    required this.privacyPolicy,
    required this.TermsAndConditions,
    required this.verificationCompletedNextStepButton,
    required this.createAnAccount,
    required this.correctDetailsFlag,
    required this.howDoYouHearAboutUsOptional,
    required this.createUsername,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.selectOption,
    required this.referralTagOptional,
    required this.enterReferralTag,
    required this.phoneNumber,
    required this.others,
    required this.Influencer,
    required this.createPassword,
    required this.createPasswordForAccountAccessInSecureLocation,
    required this.confirmPassword,
    required this.createTransactionPin,
    required this.setTransactionPin,
    required this.transactionPinSecurityLevel,
    required this.enterTransactionPinAgain,
    required this.transactionPinCreated,
    required this.pinCreatedSuccessfully,
    required this.notRightNow,
    required this.yesEnableBiometrics,
    required this.signInInstantlyWithTouchFaceID,
    required this.wouldLikeToUseTouchFaceIDToSignIntoFavex,
    required this.pinNotMatchError,
    required this.confirmTransactionPin,
    required this.enableBiometric,
  });

  // English Language
  static const AppTexts english = AppTexts(
    welcomeMessage: 'Welcome back!',
    welcomeMessageSubtitle:"Please sign in with email address and password to access your account",
    emailAddress: 'Email Address',
    enterEmail: 'Enter Email',
    password: 'Password',
    enterPassword: 'Enter Password',
    forgotPassword: 'Forgot password?',
    resetIt: 'Reset it',
    login: 'Login',
    signInWith: 'or sign in with',
    signUp: 'Sign up',
    noAccount:"Don’t have account?",
    enterPin:"Enter your security pin code to continue",
    hi:"Hi ",
    iAmNot:"I am not ",
    scanFingerprint: 'Scan your fingerprint (or face) to Login',
    authError: 'An error occurred while authenticating, try again.',
    biometricNotAvailable: 'Biometric authentication is not available on this device.',
    noBiometricsEnrolled: 'No biometric data is enrolled. Please set it up in your device settings.',
    authorized: 'Authorized',
    notAuthorized: 'Not Authorized',
    biometricAuthentication: 'Biometric Authentication',
    enterOtpEmail: "Enter your account email to receive verification OTP",
    emailHint:'yourmail@mail.com',
    getOTP: 'Get OTP',
    verificationCode: 'Verification code',
    enterOtp: 'Enter OTP code',
    enterOTPSubtitle: 'Enter the 6-digit code sent to your mail',
    didntReceiveAnything: "Didn’t receive anything?",
    resendIn: 'Resend in',
    continueText: 'Continue',
    resend: 'Resend',
    incorrectOTPAttempt: 'Incorrect OTP. Try again',
    otpSentEmailSuccess: 'OTP sent successfully to email',
    otpVerification: 'OTP Verification',
    otpVerified: 'OTP Verified',
    verificationCompletedPassword: 'Verification completed. Create a new password to access account',
    createNewPassword: 'Create new password',
    confirm: 'Confirm',
    newPassword: 'New Password',
    newPasswordCreated: 'New password created',
    newPasswordCreationCompleted: 'New password creation completed. Click logout and login with your new password',
    logOut: 'Log out',
    step: 'Step',
    of: 'of',
    createAccount: 'Create Account',
    signUpEmailAddressForOTPVerification: 'Sign up with your email address. You’ll receive 6-digit OTP for email verification.',
    continueAgreeingToFavex: 'By clicking on continue, I agree to Favex',
    and: 'and',
    privacyPolicy: 'Privacy Policy',
    TermsAndConditions: 'Terms & Conditions',
    verificationCompletedNextStepButton: 'Verification completed, click continue to go the next step of account creation',
    createAnAccount: 'Create an account',
    correctDetailsFlag: 'It’s free. Be sure to provide correct details',
    howDoYouHearAboutUsOptional: 'How do you hear about us (Optional)',
    createUsername: 'Create username',
    username: 'Username',
    firstName: 'First name',
    lastName: 'Last name',
    selectOption: 'Select Option',
    referralTagOptional: 'Referral tag (optional)',
    enterReferralTag: 'Enter referral tag',
    phoneNumber: 'Phone Number',
    others: 'Others',
    Influencer: 'Influencer',
    createPassword: 'Create Password',
    createPasswordForAccountAccessInSecureLocation: 'Kindly create your password to access account. Please ensure you are in a secure location.',
    confirmPassword: 'Confirm password',
    createTransactionPin: 'Create Transaction Pin',
    setTransactionPin: 'Set transaction PIN',
    transactionPinSecurityLevel: 'Transaction pin adds extra layer of security when using the favex app.',
    enterTransactionPinAgain: 'Enter transaction pin again.',
    transactionPinCreated: 'Transaction PIN Created',
    pinCreatedSuccessfully: 'Pin created successfully. Your PIN helps to add extra layer of security when using Favex',
    notRightNow: 'Not Right now',
    yesEnableBiometrics: 'Yes, Enable Biometrics',
    signInInstantlyWithTouchFaceID: 'Sign in Instantly with Touch / Face ID',
    wouldLikeToUseTouchFaceIDToSignIntoFavex: 'Would you like to use Touch/face ID to sign in to Favex?',
    pinNotMatchError: 'PIN not match, please try again.',
    confirmTransactionPin: 'Confirm Transaction Pin',
    enableBiometric: 'Enable Biometric',
  );

  // Spanish Language (example)
  static const AppTexts spanish = AppTexts(
    welcomeMessage: '¡Bienvenido de nuevo!',
    welcomeMessageSubtitle: 'Por favor, inicie sesión con su dirección de correo electrónico y contraseña para acceder a su cuenta',
    emailAddress: 'Dirección de correo electrónico',
    enterEmail: 'Introduce el correo electrónico',
    password: 'Contraseña',
    enterPassword: 'Introduce la contraseña',
    forgotPassword: '¿Olvidaste tu contraseña?',
    resetIt: 'Restablecerla',
    login: 'Iniciar sesión',
    signInWith: 'o inicia sesión con',
    signUp: 'Regístrate',
    noAccount: '¿No tienes una cuenta?',
    enterPin:"Ingrese su código PIN de seguridad para continuar.",
    hi:"Hola ",
    iAmNot:"No soy ",
    scanFingerprint:'Escanee su huella digital (o cara) para iniciar sesión',
    authError:'Ocurrió un error durante la autenticación, intente de nuevo.',
    biometricNotAvailable:'La autenticación biométrica no está disponible en este dispositivo.',
    noBiometricsEnrolled:'No hay datos biométricos registrados. Por favor, configúrelo en la configuración de su dispositivo.',
    authorized:'Autorizado',
    notAuthorized:'No Autorizado',
    biometricAuthentication:'Autenticación Biométrica',
    enterOtpEmail: 'Introduce el correo electrónico de tu cuenta para recibir el código OTP',
    emailHint:'tucorreo@mail.com',
    getOTP: 'Obtener OTP',
    verificationCode: 'Código de verificación',
    enterOtp: 'Introduce el código OTP',
    enterOTPSubtitle: 'Introduce el código de 6 dígitos enviado a tu correo',
    didntReceiveAnything: '¡No recibiste nada?',
    resendIn: 'Reactiva envío (en español)',
    continueText: 'Continuar (continua en español)',
    resend: 'Reenviar',
    incorrectOTPAttempt: '¡Código OTP incorrecto. Inténtalo de nuevo.',
    otpSentEmailSuccess: 'ÓTP enviado correctamente a tu correo electrónico',
    otpVerification: 'Verificación de OTP (One-Time Password)',
    otpVerified: 'ÓTTP verificado',
    verificationCompletedPassword: 'La verificación se ha completado. Crea una nueva contraseña para acceder a la cuenta.',
    createNewPassword: 'Crear una nueva contraseña',
    confirm: 'Confirmar',
    newPassword: 'Nueva contraseña',
    newPasswordCreated: 'Contraseña nueva creada (Spanish)',
    newPasswordCreationCompleted: '¡La creación de tu contraseña ha sido completada! Haz clic en "Cerrar sesión" e inicia sesión con tu nueva contraseña.',
    logOut: 'Cerrar sesión',
    step: 'Paso',
    of: 'de',
    createAccount: 'Crear Cuenta',
    signUpEmailAddressForOTPVerification: 'Regístrese con su dirección de correo electrónico. Recibirá un código OTP de seis dígitos para la verificación por correo electrónico.',
    continueAgreeingToFavex: 'Pulsa en continuar para aceptar Favex.',
    and: 'y en español: y',
    privacyPolicy: 'Política de Privacidad',
    TermsAndConditions: 'Términos y Condiciones del Servicio',
    verificationCompletedNextStepButton: 'La verificación se ha completado, haga clic en "Continuar" para pasar al siguiente paso de la creación de cuenta.',
    createAnAccount: 'Crear una cuenta',
    correctDetailsFlag: '¡Es gratuito. Asegúrate de proporcionar los detalles correctos.',
    howDoYouHearAboutUsOptional: '¿Cómo te enteraste de nosotros? (Opcional)',
    createUsername: 'Crear nombre de usuario (Crear un nombre de usuario)',
    username: 'Nombre de Usuario',
    firstName: 'Nombre de pila (primer nombre) o nombre corto (apodo)',
    lastName: 'Apellido (masculino) o Apellido materno (femenino): _______________',
    selectOption: 'Selecciona Opción',
    referralTagOptional: 'Etiqueta de referencia (opcional)',
    enterReferralTag: 'Introduzca la etiqueta de referido (o código promocional)',
    phoneNumber: 'Número de Teléfono',
    others: 'Otros (masculine plural) or Otras (feminine plural), depending on whether the word that follows is masculine or feminine in gender.',
    Influencer: 'Influenciador (influencer masculino) / Influenciana (influencer femenino)',
    createPassword: 'Crea contraseña',
    createPasswordForAccountAccessInSecureLocation: 'Por favor, cree su contraseña para acceder a la cuenta. Asegúrese de estar en un lugar seguro.',
    confirmPassword: 'Confirmar contraseña',
    createTransactionPin: 'Crear PIN de Transacción (Spanish)',
    setTransactionPin: 'Establecer PIN de transacción',
    transactionPinSecurityLevel: '¡La clave de transacción añade una capa adicional de seguridad al usar la aplicación Favex!',
    enterTransactionPinAgain: 'Introduce la clave de transacción nuevamente.',
    transactionPinCreated: 'Clave de Transacción creada',
    pinCreatedSuccessfully: '¡Clave creada correctamente! Tu clave ayuda a sumar una capa adicional de seguridad al usar Favex.',
    notRightNow: 'No ahora',
    yesEnableBiometrics: '¡Sí, Habilitar Biométrica',
    signInInstantlyWithTouchFaceID: 'Inicia sesión inmediatamente con Touch ID / Identificación Facial',
    wouldLikeToUseTouchFaceIDToSignIntoFavex: '¿Le gustaría utilizar la Identificación por Táctil/Identificación Facial para iniciar sesión en Favex?',
    pinNotMatchError: 'La clave de PIN no coincide, por favor inténtalo de nuevo.',
    confirmTransactionPin: 'Confirmar Transacción PIN: \\*Para confirmar la transacción, ingrese su PIN\\*.',
    enableBiometric: 'Habilitar Biométrica',
  );

  // Add more languages as needed
}

