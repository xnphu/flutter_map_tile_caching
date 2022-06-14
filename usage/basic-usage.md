# Basic Usage

The main basis of this package is the `FlutterMapTileCaching` object. There are other high level objects, but they are usually for more advanced usage, and can be explored in more detail through the API documentation.

{% hint style="success" %}
`FMTC` is a shorthand type alias for `FlutterMapTileCaching`, and works in exactly the same way. Often, documentation will use the shortened version to save space, and you should do so in your code as well.
{% endhint %}

This singleton must first be initialised, usually in the `main` (asynchronous) function at the start of your app, like this: `FMTC.initialise()`. The function takes a `rootDir` argument, usually `await RootDirectory.normalCache`, and custom global `settings`, which is optional.

Once initialised, it is safe to use `FMTC.instance.` At this point, most functionality is accessed through chaining.

{% hint style="danger" %}
You must call `initialise()` before trying to use `instance.`Failure to do so will throw a `StateError`.
{% endhint %}

For example:

```dart
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';

void main() async {
    FlutterMapTileCaching.initialise(await RootDirectory.normalCache);
    final FMTC fmtc = FMTC.instance;
}
```
