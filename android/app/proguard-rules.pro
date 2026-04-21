# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class com.google.firebase.** { *; }

# For Firebase Messaging / GMS
-keep class com.google.android.gms.** { *; }
-keep class com.google.firebase.** { *; }

# Keep filenames and line numbers for better crash reporting
-keepattributes SourceFile,LineNumberTable
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions

# Suppress missing Play Core split install classes (referenced by Flutter engine but not used)
-dontwarn com.google.android.play.core.splitcompat.**
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**

# Suppress missing javax.xml.stream (referenced by Apache Tika but not used on Android)
-dontwarn javax.xml.stream.**
