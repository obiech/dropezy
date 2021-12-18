package com.example.to_do;

import io.flutter.embedding.android.FlutterActivity;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.content.Context;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.SplashScreen;

public class MainActivity extends FlutterActivity {

      @Nullable
  @Override
  public SplashScreen provideSplashScreen() {
      return new MySplashScreen();
  }

}
