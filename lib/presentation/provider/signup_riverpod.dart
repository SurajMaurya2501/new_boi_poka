import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final StateProvider<Locale> signupProvider = StateProvider<Locale>((ref) => const Locale("en",),);
