# Digidentity
Digidentity test task

Build a one screen application that shows a list containing the items in the catalog. All the fields need to be visible in the UI (including the ID).
When the application is opened a new request is performed and the most recent 10 items should be shown. When the user scrolls down past the oldest item another block of 10 items should be appended to the list. When the user scrolls up past the most recent item the application should request the API for newer items. Scrolling up past the beginning of the list should trigger a visual effect that indicates that more data is being loaded.
The application should cache the loaded items persistently between application launches. When the application is opened the most recent 10 items from cache should be shown.
The use of SSL pinning is required for each communication with the backend and the app must fail and warn the user.
Please write at least 3 unit tests to cover a small part of your code.
Optional
In case you'd like to produce more code to show your skills, you can implement the following items. 1) Encrypt (AES 256) the local cache used to store the data using a static key.
2) A screen for posting new content. This screen should allow a user to take a photo and, using an OCR (optical character recognition) tool of your choice, to extract the text (if any) from it.
The maximum image size should be 512x512 pixel.
