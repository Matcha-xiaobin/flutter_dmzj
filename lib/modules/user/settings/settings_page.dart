import 'package:flutter/material.dart';
import 'package:flutter_dmzj/app/app_color.dart';
import 'package:flutter_dmzj/app/app_style.dart';
import 'package:flutter_dmzj/app/controller/app_settings_controller.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class SettingsPage extends StatelessWidget {
  final int index;
  SettingsPage({required this.index, super.key});
  final settings = Get.find<AppSettingsController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: index,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 56),
            child: TabBar(
              isScrollable: true,
              labelPadding: AppStyle.edgeInsetsH24,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor:
                  Get.isDarkMode ? Colors.white70 : Colors.black87,
              tabs: const [
                Tab(text: "漫画阅读"),
                Tab(text: "小说阅读"),
                Tab(text: "下载设置"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildComicSettings(),
            buildNovelSettings(),
            const Text("2"),
          ],
        ),
      ),
    );
  }

  Widget buildComicSettings() {
    return Obx(
      () => ListView(
        padding: AppStyle.edgeInsetsA12,
        children: [
          ListTile(
            title: const Text("阅读方向"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildSelectedButton(
                  onTap: () {
                    settings.setComicReaderDirection(0);
                  },
                  selected: settings.comicReaderDirection.value == 0,
                  child: const Icon(Remix.arrow_right_line),
                ),
                AppStyle.hGap8,
                buildSelectedButton(
                  onTap: () {
                    settings.setComicReaderDirection(2);
                  },
                  selected: settings.comicReaderDirection.value == 2,
                  child: const Icon(Remix.arrow_left_line),
                ),
                AppStyle.hGap8,
                buildSelectedButton(
                  onTap: () {
                    settings.setComicReaderDirection(1);
                  },
                  selected: settings.comicReaderDirection.value == 1,
                  child: const Icon(Remix.arrow_down_line),
                )
              ],
            ),
          ),
          SwitchListTile(
            value: settings.comicReaderFullScreen.value,
            onChanged: (e) {
              settings.setComicReaderFullScreen(e);
            },
            title: const Text("全屏阅读"),
          ),
          SwitchListTile(
            value: settings.comicReaderShowStatus.value,
            onChanged: (e) {
              settings.setComicReaderShowStatus(e);
            },
            title: const Text("显示状态信息"),
          ),
          SwitchListTile(
            value: settings.comicReaderShowViewPoint.value,
            onChanged: (e) {
              settings.setComicReaderShowViewPoint(e);
            },
            title: const Text("显示观点/吐槽"),
          ),
        ],
      ),
    );
  }

  Widget buildNovelSettings() {
    return Obx(
      () => ListView(
        padding: AppStyle.edgeInsetsA12,
        children: [
          ListTile(
            title: const Text("阅读方向"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildSelectedButton(
                  onTap: () {
                    settings.setNovelReaderDirection(0);
                  },
                  selected: settings.novelReaderDirection.value == 0,
                  child: const Icon(Remix.arrow_right_line),
                ),
                AppStyle.hGap8,
                buildSelectedButton(
                  onTap: () {
                    settings.setNovelReaderDirection(2);
                  },
                  selected: settings.novelReaderDirection.value == 2,
                  child: const Icon(Remix.arrow_left_line),
                ),
                AppStyle.hGap8,
                buildSelectedButton(
                  onTap: () {
                    settings.setNovelReaderDirection(1);
                  },
                  selected: settings.novelReaderDirection.value == 1,
                  child: const Icon(Remix.arrow_down_line),
                )
              ],
            ),
          ),
          SwitchListTile(
            value: settings.comicReaderFullScreen.value,
            onChanged: (e) {
              settings.setComicReaderFullScreen(e);
            },
            title: const Text("全屏阅读"),
          ),
          SwitchListTile(
            value: settings.comicReaderShowStatus.value,
            onChanged: (e) {
              settings.setComicReaderShowStatus(e);
            },
            title: const Text("显示状态信息"),
          ),
          ListTile(
            title: const Text("字体大小"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: () {
                    settings.setComicReaderFontSize(
                      settings.novelReaderFontSize.value + 1,
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                ),
                AppStyle.hGap12,
                Text("${settings.novelReaderFontSize.value}"),
                AppStyle.hGap12,
                OutlinedButton(
                  onPressed: () {
                    settings.setComicReaderFontSize(
                      settings.novelReaderFontSize.value - 1,
                    );
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text("行距"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: () {
                    settings.setNovelReaderLineSpacing(
                      settings.novelReaderLineSpacing.value + 0.1,
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                ),
                AppStyle.hGap12,
                Text(
                    "${(settings.novelReaderLineSpacing.value).toStringAsFixed(1)}"),
                AppStyle.hGap12,
                OutlinedButton(
                  onPressed: () {
                    settings.setNovelReaderLineSpacing(
                      settings.novelReaderLineSpacing.value - 0.1,
                    );
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text("阅读主题"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: AppColor.novelThemes.keys
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        settings.setNovelReaderTheme(e);
                      },
                      child: Container(
                        margin: AppStyle.edgeInsetsL8,
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: AppColor.novelThemes[e]!.first,
                          borderRadius: AppStyle.radius24,
                        ),
                        child: Visibility(
                          visible:
                              AppColor.novelThemes.keys.toList().indexOf(e) ==
                                  settings.novelReaderTheme.value,
                          child: Icon(
                            Icons.check,
                            color: AppColor.novelThemes[e]!.last,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            margin: AppStyle.edgeInsetsV12,
            padding: AppStyle.edgeInsetsA8,
            decoration: BoxDecoration(
              borderRadius: AppStyle.radius4,
              color: AppColor.novelThemes[settings.novelReaderTheme]!.first,
            ),
            child: Text(
              """这是一段测试文字，可以预览上面的设置效果。

　　晋太元中，武陵人捕鱼为业。缘溪行，忘路之远近。忽逢桃花林，夹岸数百步，中无杂树，芳草鲜美，落英缤纷。渔人甚异之，复前行，欲穷其林。
　　林尽水源，便得一山，山有小口，仿佛若有光。便舍船，从口入。初极狭，才通人。复行数十步，豁然开朗。土地平旷，屋舍俨然，有良田、美池、桑竹之属。阡陌交通，鸡犬相闻。其中往来种作，男女衣着，悉如外人。黄发垂髫，并怡然自乐……""",
              style: TextStyle(
                fontSize: settings.novelReaderFontSize.value.toDouble(),
                height: settings.novelReaderLineSpacing.value,
                color: AppColor.novelThemes[settings.novelReaderTheme]!.last,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedButton(
      {required Widget child, bool selected = false, Function()? onTap}) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: selected ? Colors.blue : Colors.grey,
        side: BorderSide(
          color: selected ? Colors.blue : Colors.grey,
        ),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
