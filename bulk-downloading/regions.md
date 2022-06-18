# 1⃣ Create A Region

Creating regions is designed to be easy for the user and you (the developer).

The [example application](../get-started/example.md) contains a great way you might want to allow your users to choose a region to download, and it shows how to use Provider to share a created region and the number of approximate tiles it has to a download screen.

## Types Of Region

All regions (before conversion to `DownloadableRegion`) implement `BaseRegion`.

{% tabs %}
{% tab title="Rectangle" %}
The most basic type of region, defined by a North West and South East coordinate bound - specifically a `LatLngBounds` object provided by flutter\_map.

```dart
final region = RectangleRegion(
    LatLngBounds(
        LatLng(), // North West
        LatLng(), // South East
    ),
);
```
{% endtab %}

{% tab title="Circle" %}
A more advanced type of region, defined by a center coordinate and radius (in kilometers).

```dart
final region = CircleRegion(
    LatLng(), // Center
    0, // KM Radius
);
```

If you have two coordinates, one center, and one on the edge of the circle you want, you can use ['latlong2's `Distance.distance()`](https://pub.dev/documentation/latlong2/latest/latlong2/Distance/distance.html) method, as below:

```dart
final region = CircleRegion(
    LatLng(), // Center
    const Distance(roundResult: false).distance(
        LatLng(), // Center
        LatLng(), // Edge Coord
    ) / 1000; // Convert to KM
);
```
{% endtab %}

{% tab title="Line" %}
The most advanced type of region, defined by a list of coordinates and radius (in meters).

```dart
final region = LineRegion(
    [LatLng(), LatLng(), ...], // Series of coordinates
    0, // M Radius
);
```
{% endtab %}
{% endtabs %}

After you've created your region, you can convert it to a drawable polygon (below), or [convert it to a `DownloadableRegion`](prepare.md) ready for downloading.

## Converting To Drawable Polygons

All `BaseRegions` can be drawn on a map with minimal effort from you or the user, using `toDrawable()`.

Internally, this uses the `toList` or `toOutline` methods to generate the points forming the `Polygon`, then it places this/these polygons into a `PolygonLayerOptions`.

```dart
FlutterMap(
    children: [
        PolygonLayerWidget(
            options: region.toDrawable(
                fillColor: Colors.white,
                borderColors: Colors.black,
                borderStrokeWidth: 3,
                // More parameters available
            ),
        ),
    ],
);
```

### Line Regions

Line regions are bit more complicated to draw, as they involve a lot of logic and maths to make smooth. For this reason, they are also the worst performing when it comes to drawing.

{% hint style="warning" %}
Converting a `LineRegion` with many points spaced close together may yield unexpected results, due to the curves that must be drawn.
{% endhint %}

There are additional important parameters:

| Parameter          | Type   | Explanation                                                                                                                                                | Default |
| ------------------ | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `prettyPaint`      | `bool` | Controls whether the rectangles formed are joined nicely, whether they are just joined by the closest corners, or whether they are just left as rectangles | `true`  |
| `curveSmoothening` | `int`  | Amount of curve segments per curve, if `prettyPaint` is enabled                                                                                            | 50      |
| `overlap`          | `int`  | Controls the rendering if `prettyPaint` is disabled                                                                                                        | 0       |

* Set `prettyPaint` to `false` and `overlap` to `-1` to get the 'reduced' appearance. Or, set to `0` to get the normal appearance, and `1` to get the rectangles that are actually downloaded.
* Set `prettyPaint` to `true` and `overlap` to `-1` to get the rectangles joined by their nearest corners. Setting to `0` will show the line with joining curves - the default. Setting to `1` will cause an error.

Disabling `prettyPaint` will increase speed and is recommended on slower devices. Decreasing the `curveSmoothening` will also increase speed - set to a smaller value if corners are likely to be small (for example along a route).
