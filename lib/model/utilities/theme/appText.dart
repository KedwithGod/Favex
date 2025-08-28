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
  );

  // Add more languages as needed
}

