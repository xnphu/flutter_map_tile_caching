# Introduction

This package provides the ability to download areas of maps, known as regions throughout this documentation.

After downloading, tiles are stored in the same place as when Browse Caching, meaning that no extra setup is needed to use them in a map (other than the usual [integration](../usage/integration.md))!

{% hint style="danger" %}
You must comply to your tile server's ToS. Failure to do so may result in you being banned from their services.

OpenStreetMap's can be [found here](https://operations.osmfoundation.org/policies/tiles): specifically bulk downloading is discouraged, and forbidden after zoom level 13. Other servers may have different terms.

This package is not responsible for your misuse of another tile server.
{% endhint %}

## 4 Steps To Downloading

1. [Create a region based on the user's input](regions.md)
2. [Convert that region into a downloadable region](prepare.md)
3. Start downloading that region, either in the [foreground](foreground.md) or [background](background/)
4. [Listen for progress events to update your user](progress.md)

## Available APIs

| API                 | Explanation                                   |
| ------------------- | --------------------------------------------- |
| `startForeground()` | Start a download in the foreground            |
| `startBackground()` | Start a download in the background            |
| `check()`           | Check the number of tiles in a certain region |
| `cancel()`          | Cancel any ongoing downloads                  |

These are covered in more detail in other pages.
