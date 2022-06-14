# Installation

## From [pub.dev](https://pub.dev/packages/flutter\_map\_tile\_caching)

This is the recommended method of installing this package as it ensures you only receive stable versions, and you can be sure pub.dev is reliable. It also keeps the size of your pubspec.yaml small.

Just import the package as you would normally, from the command line:

```
> flutter pub add flutter_map_tile_caching
```

{% hint style="success" %}
This should automatically import the latest version of the package and create an entry for it in your pubspec.yaml. Otherwise follow the old method and add the latest version of the 'flutter\_map' dependency to the pubspec.yaml manually.
{% endhint %}

## From [github.com](https://github.com/JaffaKetchup/flutter\_map\_tile\_caching)

If you urgently need the latest version, a specific branch, or a specific fork, you can use this method.

{% hint style="warning" %}
Any bugs that get to the 'main' branch will get through to you immediately. Therefore, only use this method if you have no alternative
{% endhint %}

Add the following lines to your pubspec.yaml file under the 'dependencies\_override' section:

{% code title="pubspec.yaml" %}
```yaml
dependency_overrides:
    flutter_map:
        git:
            url: https://github.com/jaffaketchup/flutter_map_tile_caching.git
            # ref: main 
```
{% endcode %}
