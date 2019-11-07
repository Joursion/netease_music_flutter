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