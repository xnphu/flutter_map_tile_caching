# Cancel Download

If you need to stop a bulk download early, you can use the `cancel()` method to safely exit. This will also remove the active recovery link. Any progress streams will stop emitting events.

This is automatically called at the end of a successful download.
