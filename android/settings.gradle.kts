pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"

    // Core Android Gradle Plugin
    id("com.android.application") version "8.3.2" apply false

    // Firebase services (Google Services plugin)
    id("com.google.gms.google-services") version "4.3.15" apply false

    // Kotlin for Android
    id("org.jetbrains.kotlin.android") version "2.2.21" apply false

    // Flutter plugin loader (ensure not applied at root)
    id("dev.flutter.flutter-gradle-plugin") version "1.0.0" apply false


   
}

// Include app module
include(":app")
