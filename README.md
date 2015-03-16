## Docker Android

A simple Docker Image for Android Development via Cordova Framework. Build it with:

```
docker build -t xxx/xxx .
```

## Android SDK Platforms
Mount your local Android `platforms` folder (usually in `/opt/android-sdk/platforms`) to Docker Image in `/opt/android-sdk/platforms`.

## Bootstrap

```
cordova create anu
cd anu
cordova platform add android
cordova build android
```
