plugins {
    id("com.android.application")
<<<<<<< HEAD
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
=======
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
>>>>>>> 93dd6314bedae2fd6adca1557bdc03353596613f
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.curnectgate"
<<<<<<< HEAD
    compileSdk = 35
    ndkVersion = "29.0.13113456"
=======
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion
>>>>>>> 93dd6314bedae2fd6adca1557bdc03353596613f

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
<<<<<<< HEAD
        isCoreLibraryDesugaringEnabled = true  // Correct property name for Kotlin DSL
=======
>>>>>>> 93dd6314bedae2fd6adca1557bdc03353596613f
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
<<<<<<< HEAD
        applicationId = "com.example.curnectgate"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion.toInt()
        versionCode = flutter.versionCode.toInt()
=======
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.curnectgate"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
>>>>>>> 93dd6314bedae2fd6adca1557bdc03353596613f
        versionName = flutter.versionName
    }

    buildTypes {
        release {
<<<<<<< HEAD
=======
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
>>>>>>> 93dd6314bedae2fd6adca1557bdc03353596613f
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

<<<<<<< HEAD
dependencies {
    // Correct syntax for Kotlin DSL
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.9.20")
}

flutter {
    source = "../.."
}




=======
flutter {
    source = "../.."
}
>>>>>>> 93dd6314bedae2fd6adca1557bdc03353596613f
