```
╔═╗╔═╗╦ ╦╔═╗╔═╗╦╔╗╔╔═╗  ╦ ╦╦
║  ╠═╝║ ║║  ║  ║║║║║ ║  ║ ║║
╚═╝╩  ╚═╝╚═╝╚═╝╩╝╚╝╚═╝  ╚═╝╩
```                                                         

Cpuccino UI Kit built for flutter


## Todo
- [ ] Use map instead of array for modifiers
- [ ] Remove neutral from modifiers - set as default 


```
lib
  │
  ├── configurations
  |   ├── application_configuration.dart // Application specific configuration & metadata ex:  application name, version info
  |   ├── colors_configuration.dart // Define colors used within the app 
  |   ├── fonts_configuration.dart // Define fonts used within the app (styles and size)
  |   ├── gutters_configuration.dart // Defines margin and padding used within the app
  |   └── media_configuration.dart // Defines screensizes to be used within the app ex: xxs: 350, xs: 500, s: 750, m: 1000, l: 1300, xl: 1500, xxl: 2000
  |
  ├── controllers // state management (controllers, providers, blocs)
  |   ├── authentication_controller.dart
  |   ├── authorization_controller.dart
  |   └── etc...
  |
  ├── domain // app specific logic
  |   ├── auth
  |   |   ├── src
  |   |   |   ├── authentication.dart
  |   |   |   ├── authorization.dart
  |   |   |   └── etc...
  |   |   └── auth.dart // exports everything in the auth src
  |   └── etc...
  |
  ├── components // follows atomic design https://atomicdesign.bradfrost.com
  |   ├── atom
  |   ├── molecule
  |   └── organism
  |
  └── screens
      ├── home_screen.dart
      └── etc...
```

