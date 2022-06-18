# Basic Terminology

{% hint style="info" %}
If you don't understand the concept of map tiles and servers yet, you should first become familiar with these. Try reading through the ['flutter\_map' documentation](https://fleaflet-docs.netlify.app/introduction/how-does-it-work).
{% endhint %}

For development with this package, it is essential to become familiar with some terminology used throughout the documentation and API:

*   A 'Root' can hold multiple 'Stores'.

    There is usually only one root per application, but more complex applications may wish to use more than one. In this case, the initialisation function below can be run more than once
* '[Browse Caching](integration.md)' (or just 'caching') is the caching performed when a user pans over a tile in a map view and it becomes visible.
* '[Bulk Downloading](../bulk-downloading/introduction.md)' is the caching performed when a user initiates a download by specifying a region to download at once.
