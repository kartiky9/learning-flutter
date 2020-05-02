# layouts

## Layouts

Flutter's Layout System is based on the web’s flexbox layout model.

* Row and Column are two of the most commonly used layout patterns.
* Row and Column each take a list of child widgets.
* A child widget can itself be a Row, Column, or other complex widget.
* You can specify how a Row or Column aligns its children, both vertically and horizontally.
* You can stretch or constrain specific child widgets.
* You can specify how child widgets use the Row’s or Column’s available space.

## Table of Contents

* [Row & Column](layouts.md#row--column)
* [Wrap](#wrap)
  * [Expanded](layouts.md#Expanded)
  * [Flexible](layouts.md#Flexible)
  * [Spacer](layouts.md#Spacer)
  * [SizedBox](layouts.md#SizedBox)
  * [FittedBox](layouts.md#FittedBox)
  * [Divider](layouts.md#Divider)
* 

## Row & Column

* Inherited from Flex Container, Row or Column Widget used to organize children widgets.
* Both Row and Column can be nested in each other.
* Alignment is controlled along axis with `mainAxisAlignment` center, spaceAround, spaceEvenly and `crossAxisAlignment` (start, end, strech). 
* Widgets used inside can be wrapped with layout widgets like [`Expanded`](layouts.md#Expanded) or [`Flexible`](layouts.md#Flexible) to adjust flex proportions and also adjust responsively with increase in number of elements, example, when elements gets added programatically in the row/column.

## Wrap
* This widget can be used when you want to display child widgets/containers in multiple horizontal or vertical runs.
* Example, If you are using row/column and adding multiple widgets of same size, your row might overflow. Wrap helps with that by wrapping putting the overflowed container into next row/column

[![Watch Wrap (Flutter Widget of the Week)](https://img.youtube.com/vi/z5iw2SeFx2M/hqdefault.jpg)](https://youtu.be/z5iw2SeFx2M)


### Expanded

* Used inside Row or Column.
* Wraps the Widget containing content (eg. Container, Text, Image etc.) to expand and fill the available space (relative to parent size) between sibling widgets.
* Also used to overcome overflow in row/column and dynamically shrinks as the number of sibling widgets increases.
* Flex property can be used to prioritize the ratio of remaining spaces to allocate to the sibling widgets wrapped with Expanded.

[![Watch Expanded (Flutter Widget of the Week)](https://img.youtube.com/vi/_rnZaagadyo/hqdefault.jpg)](https://youtu.be/_rnZaagadyo)

### Flexible

* Almost Similar properties and behavior as Expanded.
* Difference is it does not forces child widget to expand to available space.
* Use it when you want to shrink the widget as more sibling widgets get added.

[![Watch Flexible (Flutter Widget of the Week)](https://img.youtube.com/vi/CI7x0mAZiY0/hqdefault.jpg)](https://youtu.be/CI7x0mAZiY0)

### Spacer

* Spacer creates an adjustable, empty spacer that can be used to tune the spacing between widgets in a Flex container, like Row or Column.
* `flex` property to be prioritize the distribution of space between them.
* When Spacer is used, Row or Column's property `mainAxisAlignment` will not have any visible effect.

[![Watch Spacer (Flutter Widget of the Week)](https://img.youtube.com/vi/7FJgd7QN1zI/hqdefault.jpg)](https://youtu.be/7FJgd7QN1zI)

### SizedBox

* Unlike Spacer, SizedBox is used to define specific width and height to be used widgets.

[![Watch SizedBox (Flutter Widget of the Week)](https://img.youtube.com/vi/EHPu_DzRfqA/hqdefault.jpg)](https://youtu.be/EHPu_DzRfqA)

### FittedBox

* FittedBox is used to fit a bigger child widget inside a parent widget with BoxFit properties like `contain`, `cover`, `fill`, etc.

[![Watch FittedBox (Flutter Widget of the Week)](https://img.youtube.com/vi/T4Uehk3_wlY/hqdefault.jpg)](https://youtu.be/T4Uehk3_wlY)

### Divider

* A thin horizontal line, with padding on either side computed as per viewport.
* It is used to seperate content in `ListTile`, `Dropdowns`, `PopUpMenu`.

