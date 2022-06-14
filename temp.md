# Temp

#### Tile Provider: `getTileProvider()`

In addition to the above getter, stores (not roots) also have the method `getTileProvider`. This is the point of integration with flutter\_map, providing browse caching through a custom image provider, and can be used as so:

```dart
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

#### Manage: `manage`

| API         | Structure | Explanation                                                                  |
| ----------- | --------- | ---------------------------------------------------------------------------- |
| `ready`     | Both      | Check if the necessary directory structure exists                            |
| `create()`  | Both      | Create the necessary directory structure, or do nothing if it already exists |
| `delete()`  | Both      | Delete the directory structure, fail if it doesn't exist                     |
| `reset()`   | Roots     | Reset the directory structure (delete and recreate)                          |
| `reset()`   | Stores    | Reset the tiles directory structure (delete and recreate)                    |
| `rename()`  | Stores    | Safely rename the store and the necessary directories                        |
| `tileImage` | Stores    | Retrieve a tile and extract it's `Image` asynchronously                      |

#### Statistics: `stats`

Many statistics are cached for better performance, as some take a long time to calculate. If this causes problems, chain `noCache` before the below API getters/methods, like this: `stats.noCache.storeSize`. Alternatively, clear the currently cached statistics using `invalidateCachedStatistics()`. This is automatically called when new tiles are added to the store.

| API               | Structure | Explanation                                                                  |
| ----------------- | --------- | ---------------------------------------------------------------------------- |
| `watchChanges()`  | Both      | Use a file system watcher to watch for changes, useful for a `StreamBuilder` |
| `storesAvailable` | Roots     | List all the currently ready stores under the root                           |
| `rootSize`        | Roots     | Get the current root size in KiB including all sub-stores                    |
| `rootLength`      | Roots     | Get the number of tiles currently cached in all sub-stores                   |
| `storeSize`       | Stores    | Get the current store size in KiB                                            |
| `storeLength`     | Stores    | Get the number of tiles currently cached                                     |
