# Limitations

## iOS Support

Unfortunately, background downloading is available on Android only, due to the strict limitations imposed by iOS. This is unlikely to change in the future, especially as I am currently unable to develop for iOS.

iOS users must still carry out the [Additional Setup](../../get-started/setup.md) instructions to prevent build and runtime failures.

## Background Processes

There is some confusion about the way background process handling works on Android, so let me clear it up for you: it is confusing.

Each vendor (eg. Samsung, Huawei, Motorola) has their own methods of handling background processes.

Some manage it by providing the bare minimum user-end management, resulting in process that drain battery because they can't be stopped easily; others manage it by altogether banning/strictly limiting background processes, resulting in weird problems and buggy apps; many manage it by some layer of control on top of Android's original controls, making things more confusing for everyone.&#x20;

Therefore there is no guaranteed behaviour when using this functionality. You can see how many vendors will treat background processes here: [dontkillmyapp.com](https://dontkillmyapp.com/); you may wish to link your users to this site so they can properly configure your app to run in the background.

To try and help your users get to the right settings quicker, use the `requestIgnoreBatteryOptimizations()` method before starting a background download. This will interrupt the app with either a dialog or a settings page where they can opt-in to reduced throttling. There is no guarantee that this will work, but it should help: this is not required and the background download will still _try_ to run even if the user denies the permissions.

If the download doesn't start, your app may be being throttled by the system already. Try setting `useAltMethod` to `true` in this case, or fallback to downloading in the foreground.
