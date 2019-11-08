### 介绍

一直想接触一下 `Flutter` ，用 `Flutter` 写一个网易云，直到看到了掘金上的文章，就开始跟(抄)着学习了一下。

有些 `Copy` ，也有些自己学着模仿

学习的掘金地址 : [Flutter实战 | 从 0 搭建「网易云音乐」APP](https://juejin.im/post/5d9de9a2e51d4578282ce25a)

学习的 `GitHub` 地址 : [NeteaseClouldMusic](https://github.com/wanglu1209/NeteaseClouldMusic)

另外参考的有：
1.  [Flutter 实战](https://book.flutterchina.club/) 作者杜文（网名wendux）
2.  [Flutter实战视频-移动电商](https://jspang.com/posts/2019/03/01/flutter-shop.html) 技术胖


### 使用 json_serializable 

1. 在 `pubspec.yaml` 中配置

```yaml
dependencies:
  json_annotation: ^3.0.0

dev_dependencies:
  build_runner: ^1.0.0
  json_serializable: ^3.2.0
```
2. 新建 `build.yaml`

```yaml
targets:
  $default:
    builders:
      json_serializable:
        options:
          # Options configure how source code is generated for every
          # `@JsonSerializable`-annotated class in the package.
          #
          # The default value for each is listed.
          any_map: false
          checked: false
          create_factory: true
          create_to_json: true
          disallow_unrecognized_keys: false
          explicit_to_json: false
          field_rename: none
          ignore_unannotated: false
          include_if_null: true
          nullable: true
```

3. 构建
```shell
flutter packages pub run build_runner build
```

> 然后在对应目录下查看既可以v