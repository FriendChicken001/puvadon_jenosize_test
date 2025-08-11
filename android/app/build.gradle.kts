plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.puvadon_jenosize"
    compileSdk = 35

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.puvadon_jenosize"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    productFlavors {
        flavorDimensions("production")
        production {
            resValue "string", "app_name", "Puvadon Jenosize"
        }
        flavorDimensions("developer")
        developer {
            resValue "string", "app_name", "Puvadon Jenosize Dev"
            applicationIdSuffix ".dev"
        }
    }

    buildFeatures {
        buildConfig = true
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(platform("org.jetbrains.kotlin:kotlin-bom:1.9.25"))
}

apply(from = project(":flutter_config").file("dotenv.gradle"))

