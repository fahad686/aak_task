import 'package:akk_task/core/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const route='/HomeScreen';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Consumer(builder: (context,ref,_){
        var provider=ref.watch(authProvider);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            Text(provider.responseModel?.userActiveStatus??''),
            Text(provider.responseModel?.userType??''),
            Text(provider.responseModel?.username??''),
            Text(provider.responseModel?.firstName??''),
            Text(provider.responseModel?.lastName??''),
            Text(provider.responseModel?.email??''),
          ],);
      }),
    );
  }
}
