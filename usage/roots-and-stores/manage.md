---
description: Applies to Roots and Stores
---

# Manage

```dart
FlutterMapTileCaching.rootDirectory.manage;
FlutterMapTileCaching.instance('storeName').manage;
```

## Available APIs

| API                                                 | Structure | Explanation                                                                  |
| --------------------------------------------------- | --------- | ---------------------------------------------------------------------------- |
| `ready`                                             | Both      | Check if the necessary directory structure exists                            |
| `create()`                                          | Both      | Create the necessary directory structure, or do nothing if it already exists |
| `delete()`                                          | Both      | Delete the directory structure, fail if it doesn't exist                     |
| `reset()`                                           | Roots     | Reset the directory structure (delete and recreate)                          |
| `reset()`                                           | Stores    | Reset the tiles directory structure (delete and recreate)                    |
| ``[`rename()`](manage.md#undefined)``               | Stores    | Safely rename the store and the necessary directories                        |
| ``[`tileImage()`](manage.md#tile-image-generator)`` | Stores    | Retrieve a tile and extract it's `Image` asynchronously                      |

### Rename

{% hint style="info" %}
The `StoreDirectory` used to run this method will remain valid but not ready. Therefore, if you have a variable with it, you should replace it.

Using the normal `FMTC.instance('newStoreName')` will work afterwards.
{% endhint %}

### Tile Image Generator

```dart
FMTC.instance('storeName').manage.tileImage(randomRange: int?, size: double?);
```

`randomRange` controls the randomness of the tile chosen (defaults to `null`):

* `null`: no randomness - the first tile is chosen
* <= 0: any tile may be chosen
* \>= store length: any tile may be chosen
* < store length: any tile up to this range may be chosen, enforcing an iteration limit internally

{% hint style="info" %}
Tiles are not necessarily ordered chronologically. They are usually ordered alphabetically, which may affect your expectations of your chosen range.
{% endhint %}

Returns `null` if there are no cached tiles in this store, otherwise an `Image` with `size` height and width.
