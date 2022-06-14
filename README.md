---
description: >-
  A plugin for 'flutter_map' providing advanced caching functionality, with
  ability to download map regions for offline use
cover: .gitbook/assets/OpenStreetMap Screenshot.jpg
coverY: -47.966226138032305
layout: landing
---

# flutter\_map\_tile\_caching

[![Pub](https://camo.githubusercontent.com/5d55ce561ca77d5138fb8b7cea8fda63e30a5ef100928a6baaa4cf4107d5fe11/68747470733a2f2f696d672e736869656c64732e696f2f7075622f762f666c75747465725f6d61705f74696c655f63616368696e672e737667)](https://pub.dev/packages/flutter\_map\_tile\_caching) [![likes](https://camo.githubusercontent.com/99cff0deca272d4650ca9dbbec5ebbb3e03e5ff1d3c62a594c94ab689370fc1f/68747470733a2f2f6261646765732e6261722f666c75747465725f6d61705f74696c655f63616368696e672f6c696b6573)](https://pub.dev/packages/flutter\_map\_tile\_caching/score) [![pub points](https://camo.githubusercontent.com/8aa1919b7ae7d9b1ec23713f08abc0dec6122561d2c417d399bf9d0389f43a24/68747470733a2f2f6261646765732e6261722f666c75747465725f6d61705f74696c655f63616368696e672f707562253230706f696e7473)](https://pub.dev/packages/flutter\_map\_tile\_caching/score)      [![GitHub stars](https://camo.githubusercontent.com/1b70aa5f1edce98247aea6c52addd7f6abfbb780f4c967fc2fb787687c88e01a/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f73746172732f4a616666614b6574636875702f666c75747465725f6d61705f74696c655f63616368696e672e7376673f6c6162656c3d5374617273)](https://github.com/JaffaKetchup/flutter\_map\_tile\_caching/stargazers/) [![GitHub issues](https://camo.githubusercontent.com/d64e0e0d2a1d2921b4b697e7d23488c38e47132f2957436141c2bcbf742cd40f/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f6973737565732f4a616666614b6574636875702f666c75747465725f6d61705f74696c655f63616368696e672e7376673f6c6162656c3d497373756573)](https://github.com/JaffaKetchup/flutter\_map\_tile\_caching/issues/) [![GitHub PRs](https://camo.githubusercontent.com/091d49c5807d3fa7cb445f4f90c2fd58a369375aa8a13d76cfe7885dce5f0daa/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f6973737565732d70722f4a616666614b6574636875702f666c75747465725f6d61705f74696c655f63616368696e672e7376673f6c6162656c3d50756c6c2532305265717565737473)](https://github.com/JaffaKetchup/flutter\_map\_tile\_caching/pulls/)

[![ko-fi](https://camo.githubusercontent.com/cd07f1a5d90e454e7bbf69d22ebe4cdbd3a0b3dcf56ba0b6c2495a8e99c776be/68747470733a2f2f6b6f2d66692e636f6d2f696d672f676974687562627574746f6e5f736d2e737667)](https://ko-fi.com/N4N151INN)

## Source Code

{% embed url="https://github.com/JaffaKetchup/flutter_map_tile_caching" %}
Visit the GitHub repository
{% endembed %}

{% embed url="https://pub.dev/packages/flutter_map_tile_caching" %}
Visit the pub.dev package listing
{% endembed %}

## Feature Highlights

<details>

<summary>Browse Caching</summary>

Setup customisable caching that works in the background, and makes your app more reliable for your user!

You choose the behaviour, we do the right thing. Only display existing cached tiles to your user, or choose between updating the cache every time the tile is loaded, or only if it has expired. All of this, with only a tiny performance impact, and a visible increase in loading speed compared to the network!

</details>

<details>

<summary>Bulk Downloading</summary>

Use alongside browse caching, or just standalone!

Allow your user to choose from a multitude of region shapes to download, more than the official Google Maps app provides:

* Rectangle regions are formed from 2 coordinates, representing the north-west and south-east corners. The code automatically creates the other necessary corners.
* Circle regions are formed from a center coordinate and a radius. Internal 'outline' coordinates are generated per degree automatically from this information.
* Line-based regions are formed from multiple coordinates and a radius, creating a locus. Internal 'outline' coordinates are generated for every vertex and curve.

Save time and storage with features like sea tile removal and multithreading, enabled by default.

</details>

<details>

<summary>Recoverable Downloads</summary>

Oh no! For some reason, the download stopped unexpectedly, and now you have no way of knowing which region was created to download again. But, with recoverable downloads by default, you do have a way.

When starting a download, a special one-off file is stored that contains persistent information about the running download. This file is then deleted at the end of a successful download.

Therefore, if the file exists, but there is no ongoing download, an error must have happened. You can use the inbuilt functionality to check for recoverable downloads on initialization, and restart them quickly and easily if necessary.

</details>

<details>

<summary>Background Downloading</summary>

Even some professional apps can't compete with this! Perform your bulk downloading in the background on Android, with minimal time hit! Optionally configure notifications to display to your users as well.

</details>

## Get Help

Not quite sure about something? No problem.

Raise an issue on GitHub, or get quicker support on the official [flutter\_map Discord server](https://github.com/fleaflet/flutter\_map#discord-server)'s plugin channel. I'm always happy to help as soon as possible :smile:.
