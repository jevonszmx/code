### manifest_version



 The 'manifest_version' key must be present and set to 2 (without quotes). See developer.chrome.com/extensions/manifestVersion.html for details.

我查了一下，可能是因为chrome的版本不一样，所以要求manifest_version为2，所以在mainfest.json里面加了一句：

  "manifest_version": 2
