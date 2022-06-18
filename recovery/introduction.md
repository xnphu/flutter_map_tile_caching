# Introduction

The recovery system is designed to rescue failed bulk downloads, in the event of an unexpected error - such as a fatal crash or other external event.

{% hint style="warning" %}
You should not rely on the recovery system to be 100% reliable, even though it is built to be as close to that as possible.
{% endhint %}

## ID System

Recoverable regions are identified internally by an `int` ID number. All the methods above take this ID number. It is almost guaranteed that this number is unique, and it must be for the system to work correctly.

## Available APIs

| API                      | Explanation                                                            |
| ------------------------ | ---------------------------------------------------------------------- |
| `recoverableRegions`     | Get a list of all recoverable regions, not just those that have failed |
| `failedRegions`          | Get a list of recoverable regions that have failed                     |
| `getRecoverableRegion()` | Get a specific region from the recoverable list                        |
| `getFailedRegion()`      | Get a specific region from the failed list                             |
| `cancel()`               | Safely cancel/remove a recoverable region                              |

