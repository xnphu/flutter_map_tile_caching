# flutter\_map Integration

Stores also have the method `getTileProvider()`. This is the point of integration with flutter\_map, providing browse caching through a custom image provider, and can be used as so:

```dart
import 'package:flutter_map/flutter_map.dart';

TileLayerOptions(
    tileProvider: FMTC.instance('storeName').getTileProvider(),
),
```

## Tile Provider Settings

The method optionally takes a `FMTCTileProviderSettings` to override any defaults, whether the package default, or the default set in the initialisation function.

`FMTCTileProviderSettings` can take the following arguments:

| Parameter             | Type                                            | Explanation                                                                          | Default                    |
| --------------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------ | -------------------------- |
| `behavior`            | ``[`CacheBehavior`](integration.md#undefined)`` | Logic used for storage and retrieval of tiles                                        | `CacheBehavior.cacheFirst` |
| `cachedValidDuration` | `Duration`                                      | Duration until a tile expires and needs to be fetched again                          | `const Duration(days: 16)` |
| `maxStoreLength`      | `int`                                           | Maximum number of tiles allowed in a cache store before the oldest tile gets deleted | `0`: disabled              |

### Cache Behavior

This enumerable contains 3 values, which are used to dictate which logic should be used to store and retrieve tiles from the store.

| Value         | Explanation                                                                                                                             |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `cacheFirst`  | <p>Get tiles from the local cache if possible.</p><p>Only uses the Internet if it doesn't exist, or to update it if it has expired.</p> |
| `onlineFirst` | <p>Get tiles from the Internet if possible.</p><p>Updates every cached tile every time it is fetched (ignores expiry).</p>              |
| `cacheOnly`   | <p>Only get tiles from the local cache, and throw an error if not found.</p><p>Recommended for dedicated offline modes.</p>             |

## Check If A Tile Is Cached

The object returned by this function also has the method `checkTileCached`, with the following parameters:

```dart
FMTC.instance('storeName').getTileProvider().checkTileCached(
    coords: Coords<num>,
    options: TileLayerOptions,
    customUrl: String?,
 )
```

Pass the `coords` of the tile to check for, and the same/similar `TileLayerOptions` used to store the tile in the first place.

It will return a boolean dependent on whether or not the tile could be found.
