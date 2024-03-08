summary: How to Create a Checklist in Android SDK
id: ChecklistsAndroid
categories: android
tags: Checklists
status: Published 
authors: Shubhasai
Feedback Link: https://zarin.io
# How to Integrate Checklists
<!-- ------------------------ -->
## Prerequisites 
Duration: 1

### Make Sure You have
- Min SDK Level: 24 
- Kotlin Version: 1.7.10 
- JAVA: 1.8 
- Android Gradle Plugin Version: 7.0.4
- Gradle: 7.2

<!-- ------------------------ -->
## Adding Dependencies
Duration: 1

In order to use Nudge Experience you have to Install Nudge Core and the Experience (in this case Checklists SDK). In order to add the below dependencies, follow the below steps.
-Step: 1 Add the below URL to the setting.gradle file of your project.

```groovy
maven{
            url "https://github.com/nudgenow/libraries/raw/main/nudge_android/"
     }
```
```kotlin
maven {
            url = uri("https://github.com/nudgenow/libraries/raw/main/nudge_android/")
        }
```

-Step: 2 Add the NudgeCore and Challenges dependency to your project.

```groovy
implementation 'com.nudgenow.nudge_android:nudge_core:1.0.0'
```
```kotlin
implementation ("com.nudgenow.nudge_android:checklists:1.0.0")
```


<!-- ------------------------ -->
## Initialise Nudge SDK
Duration: 3

To initialise Nudge SDK in your code, You need to follow below steps
- Step 1
### Initialise Nudge Class

- Initialize the Nudge class with a reusable variable name and access all its functions through it.

> 🚧 
> 
> **Note:**`apiKey` (required): The secret key obtained from the settings section in the Nudge dashboard, is used for authentication.

```java Java
Nudge nudge = new Nudge(apiKey);
```
```kotlin Kotlin
val nudge: Nudge = Nudge(apiKey)
```
To get your API Key, follow these steps:
1. Navigate to [Nudge's official website](https://www.nudgenow.com/) to book a demo and get access to Nudge's dashboard.
2. Create an account on Nudge's Dashboard
3. In the settings tab, you will obtain a unique secret key. Use this secret key while initializing the package.

### Initialise Nudge Provider

> 📘 **Info:** Nudge core gives you the core capabilities which include tracking events and users. But to use various features that Nudge has to offer, you need to add the respective plugins for those features.

- The plugin for Checklists is called `ChecklistsUi`
- Initialize an instance of `ChecklistsUi` and pass them into your `NudgeProvider` instance as a list.

```java Java
ChecklistsUi checklistUi = new ChecklistsUi();
NudgeProvider nudgeProvider = new NudgeProvider(
        activityContext,
        nudge,
        Arrays.asList(checklistUi)
);

```
```kotlin
val checklistUi = ChecklistsUi()
val nudgeProvider = NudgeProvider(
                {activityContext},
                nudge,
                Arrays.asList(checklistUi)
            )
```

<!-- ------------------------ -->
## User Initialisation
Duration: 1
### Init Function
- Whenever a distinct user ID that is used to identify users at the client's end is defined, call the `initSession` method to initialize the user session.

```java Java
  nudge.initSession("externalId", properties, new Nudge.InitSessionCallback() {
    @Override
    public void onSuccess() {
        // Handle success
    }

    @Override
    public void onError(Exception e) {
        // Handle error
    }
});
```
```kotlin Kotlin
  nudge.initSession(CLIENT_IDENTIFIABLE_USER_ID, null, object : Nudge.InitSessionCallback {
                override fun onSuccess() {
                    // Handle success
                }
                override fun onError(e: Exception) {
                    // Handle error
                }
            })
```

- You can also send more user attributes along with the user ID for making segments of audiences.

```dart Java
JSONObject userProperties = new JSONObject();
userProperties.put("name","Client User 1");
userProperties.put("age", 27);
userProperties.put("gender", "M");
userProperties.put( "country","US");

nudge.initSession(apiKey: <TOKEN>, externalId:'CLIENT_IDENTIFIABLE_USER_ID',properties: userProperties);
```
```Text Kotlin
val userProperties = JSONObject().apply {
    put("name", "Client User 1")
    put("age", 27)
    put("gender", "M")
    put("country", "US")
}
nudge.initSession(apiKey = "<TOKEN>", externalId = "CLIENT_IDENTIFIABLE_USER_ID", properties = userProperties)
```
## Tracking Event
Duration: 1
### Track Function
> 🚧 
> 
> **Make sure you have initialized the session before tracking**

- To track an event, simply call `Nudge.track()`. Pass the name of the event and its properties that you want to track at the point where the function is called.

```dart Java
Nudge.track("NAME_OF_EVENT", eventProperties, new Nudge.TrackCallback() {
    @Override
    public void onSuccess(String response) {
        // Handle successful tracking
    }

    @Override
    public void onError(Exception e) {
        // Handle error in tracking
    }
});
```
```dart Kotlin
Nudge.track(eventType, eventProperties, object : Nudge.TrackCallback {
    override fun onSuccess(response: String) {
        // Handle successful tracking
    }

    override fun onError(e: Exception) {
        // Handle error in tracking
    }
})
```

- You can also add event properties for analytics and make segments of users based on the properties of their events performed for custom audience experiences.

```dart Java
JSONObject eventProperties = new JSONObject();
eventProperties.put("product", "Fortune Cookies");
eventProperties.put("quantity", 5);
eventProperties.put("gender", "M");
eventProperties.put("countryOfExport","US");

Nudge.track(type:'EVENT_TYPE', eventProperties);
```
```dart Kotlin
val eventProperties = JSONObject().apply {
    put("product", "Fortune Cookies")
    put("quantity", 5)
    put("gender", "M")
    put("countryOfExport", "US")
}

Nudge.track(type = "EVENT_TYPE", properties = eventProperties)
```

## That's it!
Duration: 1
### Congrats
You have sucessfully added the Checklists SDK to you App.