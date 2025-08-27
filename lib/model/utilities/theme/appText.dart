class AppTexts {
  // Common texts (don’t change across themes)
  static const String appName = 'Favex';
 


  // Theme-specific texts
  final String welcomeMessage;
  final String emailAddress;
  final String enterEmail;
  final String password;
  final String enterPassword;
  final String forgotPassword;
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

    required this.scanFingerprint ,
    required this.authError ,
    required this.biometricNotAvailable ,
    required this.noBiometricsEnrolled ,
    required this.authorized ,
    required this.notAuthorized ,
    required this.biometricAuthentication ,
 
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
  );

  // Add more languages as needed
}

