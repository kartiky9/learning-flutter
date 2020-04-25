# Learning Flutter
Personalized Notes

## Table of Contents

* [Layouts](#layouts)
  * [Row & Column](docs/layouts.md#row--column)
    * [Expanded](docs/layouts.md#Expanded)
    * [Flexible](docs/layouts.md#Flexible)
    * [Spacer](docs/layouts.md#Spacer)
    * [SizedBox](docs/layouts.md#SizedBox)
    * [FittedBox](docs/layouts.md#FittedBox)
    * [Divider](docs/layouts.md#Divider)
* [Cards](#cards)
* [Stack](#stack)
* [InkWell](#InkWell)
* [ColorSwatch](#ColorSwatch)
* [Navigator](#Navigator)

### Layouts

Flutter's Layout System is based on the web’s flexbox layout model.

[More over here](./docs/layouts.md)

### Stack

[![Watch Stack \(Flutter Widget of the Week\)](https://img.youtube.com/vi/liEGSeD3Zt8/hqdefault.jpg)](https://youtu.be/liEGSeD3Zt8)

### Cards
- A Component used to display information as per Material Card design.

![Card Image](https://flutter.github.io/assets-for-api-docs/assets/material/card.png)

### InkWell
- A rectangular area of a Material that responds to touch.

![InkWell Image](https://flutter.github.io/assets-for-api-docs/assets/material/ink_well.png)


### ColorSwatch
- Used to set multiple colors or a color palete (eg. color shades or different colors for different type of child widgets like textbox, button, bgcolor, etc.) to single variable
- The multiple colors is accessed same way as that of Materials Colors variable. (`Colors.grey[200]`)

### Navigator
- Used to navigate between pages. Similar to web frameworks.
- Can provide route names to navigate for each page (just like web frameworks routes)
- In flutter pages are called as Screens. Using Scaffold AppBar on the new screen will add back button top-left corner.