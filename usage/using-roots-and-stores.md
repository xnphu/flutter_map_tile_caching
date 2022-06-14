# Using Roots & Stores

Once you can access `FMTC.instance`, you can chain on other getters and methods. In fact, most functionality is accessed this way. Any of the following can be chained onto this base:

{% tabs %}
{% tab title="Root" %}
To get the root directory and it's associated information, just chain on `rootDirectory`, as so:

```dart
final root = FMTC.instance.rootDirectory;
```
{% endtab %}

{% tab title="Store - Manual Creation" %}
To use a store without automatically creating it (recommended for performance), use `()` (`call()`). Place the store name inside the parenthesis. For example:

```dart
final store = FMTC.instance('storeName');
await store.manage.createAsync(); // Create the store if necessary
```
{% endtab %}

{% tab title="Store - Automatic Creation" %}
To use a store and automatically synchronously create it if it doesn't exist, use `[]`. Place the store name inside the parenthesis. For example:

```dart
final store = FMTC.instance['storeName'];
```

{% hint style="warning" %}
This is not recommended, as it uses synchronous IO operations on every get, which can block your application's main thread.

Only use this if you cannot use asynchronous techniques in your current context, or the slight blocking doesn't matter.
{% endhint %}
{% endtab %}
{% endtabs %}

After this, you can chain any of the following:

| API Getter | Structure | Explanation                                                                               |
| ---------- | --------- | ----------------------------------------------------------------------------------------- |
| `access`   | Both      | Access the real directory structure - only for advanced usage                             |
| `manage`   | Both      | Perform management tasks, such as creation and deletion                                   |
| `stats`    | Both      | Retrieve statistics, such as size and length                                              |
| `recovery` | Roots     | Manage bulk download recovery                                                             |
| `download` | Stores    | Manage bulk downloads                                                                     |
| `metadata` | Stores    | Use a simple key-value pair store - suitable for storing simple store related information |

So, for example, to access statistics for a store, you might use:

```dart
// Recommended if you are certain the store exists, or you don't need to perform actions with the store at this point
final stats = FMTC.instance('storeName').stats;

// Use only if you are not sure the store exists and you can't manually create it asynchronously
final stats = FMTC.instance['storeName'].stats;
```

{% hint style="info" %}
Note that many of the methods and getters beneath the ones listed above, for example those under `manage`, have asynchronous versions which are recommended for performance. To use them, if available, just add 'Async' to the end of the method/getter. For example, `ready` and `readyAsync`.
{% endhint %}
