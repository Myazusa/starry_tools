import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../state/dashboard_state.dart';


class Dashboard extends ConsumerWidget{
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomNavigationRail()
    );
  }
}

class CustomNavigationRail extends ConsumerWidget  {

  const CustomNavigationRail({
    super.key,
  });

  void replaceRouter(BuildContext context,int i){
    switch (i) {
      case 0:
        context.replace('/json_editor');
        break;
      case 1:
        context.replace('/setting');
        break;
      case _:
        log("不存在的路由");
    }
  }

  void onTap(BuildContext context,int index,WidgetRef ref){
    // 设置索引值
    ref.read(selectedIndexProvider.notifier).set(index);
    // 跳转路由
    replaceRouter(context, index);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final items = [
      (Icons.code, "Json编辑器"),
      (Icons.settings, "设置"),
    ];
    return Container(
      color: Theme.of(context).colorScheme.surface,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(items.length, (index) {
          // 直接监听索引值，从而改变是否被选中状态
          final bool isSelected = index == ref.watch(selectedIndexProvider);
          final color = isSelected
              ? Theme.of(context).colorScheme.onSecondary
              : Theme.of(context).colorScheme.secondary;
          return InkWell(
            onTap: () => onTap(context,index,ref),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected ? Theme.of(context).colorScheme.tertiaryFixedDim : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(items[index].$1, color: color),
                  SizedBox(width: 4),
                  Text(
                    items[index].$2,
                    style: TextStyle(color: color, fontSize: 14),
                    textAlign: TextAlign.center,
                    // 超出显示...
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}