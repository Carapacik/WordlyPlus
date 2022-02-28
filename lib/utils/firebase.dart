import 'package:firebase_core/firebase_core.dart';
import 'package:wordle/utils/platform.dart';

Future<FirebaseApp> platformSpecificFirebase() async {
  // does not work on windows and mac
  return Firebase.initializeApp(
    options: PlatformType.currentPlatformType == PlatformTypeEnum.web
        ? const FirebaseOptions(
            apiKey: "EXAMPLE_FIREBASE_API_KEY_NOT_VALID",
            appId: "EXAMPLE_FIREBASE_APP_ID_NOT_VALID",
            messagingSenderId: "000000000000",
            projectId: "example-firebase-project",
            authDomain: "firebase.example.com",
            storageBucket: "storage.example.com",
            measurementId: "EXAMPLE_MEASUREMENT_ID_NOT_VALID",
          )
        : null,
  );
}
