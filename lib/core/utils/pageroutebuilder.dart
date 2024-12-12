import "package:flutter/material.dart";
import "package:sample_app/presentation/animation/route_animation.dart";

Route createRoute(Widget page) => AnimationManager().fadeTransition(page);
