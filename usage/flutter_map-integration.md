# flutter\_map Integration

Stores also have the method `getTileProvider()`. This is the point of integration with flutter\_map, providing browse caching through a custom image provider, and can be used as so:

```dart
import 'package:flutter_map/flutter_map.dart';

TileLayerOptions(
    tileProvider: FMTC.instance('storeName').getTileProvider(),
),
```

The method optionally takes a `FMTCTileProviderSettings` to override any defaults, whether the package default, or the default set in the initialisation function.

`FMTCTileProviderSettings` can take the following arguments:

| Argument              | Type            | Explanation                                                                          | Default                    |
| --------------------- | --------------- | ------------------------------------------------------------------------------------ | -------------------------- |
| `behavior`            | `CacheBehavior` | Logic used for storage and retrieval of tiles                                        | `CacheBehavior.cacheFirst` |
| `cachedValidDuration` | `Duration`      | Duration until a tile expires and needs to be fetched again                          | `const Duration(days: 16)` |
| `maxStoreLength`      | `int`           | Maximum number of tiles allowed in a cache store before the oldest tile gets deleted | `0`: disabled              |
