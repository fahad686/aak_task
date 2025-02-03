

// declare all provider global

import 'package:akk_task/view_model/auth_vm/auth_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider=ChangeNotifierProvider<AuthVM>((ref)=>AuthVM());