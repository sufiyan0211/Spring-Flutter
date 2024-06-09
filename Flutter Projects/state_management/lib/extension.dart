import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_provider_class.dart';
import 'second_provider_class.dart';

// extension to get provider like context.provider name from anywhere
extension Providers on BuildContext {
  MyProviderClass get myProvider => Provider.of<MyProviderClass>(this, listen: false);
  SecondProviderClass get secondProvider => Provider.of<SecondProviderClass>(this, listen: false);
}