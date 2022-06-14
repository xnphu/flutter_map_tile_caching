# Additional Setup

## Android

A few more steps are required on Android due to the background download functionality, unfortunately even if you do not intend to use the functionality. This is due to the way the dependency used to perform background downloading works.

For these steps please go to these sites:

* [`background_fetch` Installation Instructions For Android](https://github.com/transistorsoft/flutter\_background\_fetch/blob/master/help/INSTALL-ANDROID.md)
*   [`permission_handler` Installation Instructions](https://pub.dev/packages/permission\_handler#setup)

    If you plan to use background downloading functionality and you want to request to ignore battery optimizations, you should add this to your 'android/app/src/.../AndroidManifest.xml' as seen in the example app:

    ```
    <uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"/>
    ```

{% hint style="success" %}
This library is thoroughly tested on Android devices, specifically Android 11 and 12
{% endhint %}

## iOS

A few more steps are required on iOS due to the background download functionality, even though this functionality is unfortunately currently disabled on iOS. This is due to the way the dependency used to perform background downloading works. For these steps please go to these sites:

* [`background_fetch` Installation Instructions For iOS](https://github.com/transistorsoft/flutter\_background\_fetch/blob/master/help/INSTALL-IOS.md)\
  You should not need to follow the instructions for `BackgroundFetch.scheduleTask`, but do so if you receive build errors - the custom task identifiers asked for in the last step is exactly 'backgroundTileDownload'.
* [`permission_handler` Installation Instructions](https://pub.dev/packages/permission\_handler#setup)

{% hint style="warning" %}
This library has not been tested on iOS devices
{% endhint %}

## Other Platforms

This library has not been tested on other platforms, although it should work for them. To configure this library, you may need to do some research yourself.
