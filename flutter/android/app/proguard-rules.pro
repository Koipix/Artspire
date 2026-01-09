# Flutter Stripe ProGuard Rules
# Keep Stripe push provisioning classes that may be missing
-dontwarn com.stripe.android.pushProvisioning.**
-keep class com.stripe.android.pushProvisioning.** { *; }

# React Native Stripe SDK push provisioning (referenced by flutter_stripe)
-dontwarn com.reactnativestripesdk.pushprovisioning.**
-keep class com.reactnativestripesdk.pushprovisioning.** { *; }

# Keep Stripe SDK classes
-keep class com.stripe.android.** { *; }
-dontwarn com.stripe.android.**
