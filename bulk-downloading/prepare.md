# 2⃣ Prepare For Downloading

``[`BaseRegions`](regions.md) must be converted to `DownloadableRegions` before they can be used to download tiles.

These contain the original `BaseRegion`, but also some other information necessary for downloading, such as zoom levels and URL templates.

See this basic example:

```dart
final downloadable = region.toDownloadable(
    1, // Minimum Zoom
    18, // Maximum Zoom
    TileLayerOptions(),
),
```

## Additional Parameters

| Parameter                                    | Type                      | Explanation                                                   | Default            |
| -------------------------------------------- | ------------------------- | ------------------------------------------------------------- | ------------------ |
| `parallelThreads`                            | `int`                     | Number of download threads allowed to run simultaneously      | 10                 |
| `preventRedownload`                          | `bool`                    | Controls whether to skip downloading tiles that already exist | `false`            |
| ``[`seaTileRemoval`](prepare.md#undefined)`` | `bool`                    | Controls whether to remove tiles that are entirely sea        | `false`            |
| `start`                                      | `int`                     | Skip past a number of tiles 'at the start' of a region        | 0                  |
| `end`                                        | `int?`                    | Skip a number of tiles 'at the end' of a region               |                    |
| `crs`                                        | `Crs`                     | Map projection to use to calculate tiles                      | `const Epsg3857()` |
| `errorHandler`                               | `void Function(Object?)?` | Function to be called if a tile fails to download             |                    |

## Sea Tile Removal

By not storing pure tiles of sea, we can save a bunch of space on the user's device with every download. But how to do this?

Well, this package does it by analysing the bytes of the tile and checking if it's identical to a sample taken at lat/lng 0, 0 (Null Island) with zoom level 17. This tile should always be sea, and therefore any matching tile must also be sea.

In this way, we can delete tiles after we've checked them, if they are indeed sea. This method also means that tiles with ferry paths and other markings remain safe.

{% hint style="info" %}
Sea Tile Removal does not reduce time or data consumption. Every tile must still be downloaded to check it.
{% endhint %}
