package com.example.navigator

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setLocale("ru_RU");
    MapKitFactory.setApiKey("a432989e-721c-431d-b7a1-663bf7791b70") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}
