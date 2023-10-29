# Fiori Elements School of Magic
In this repository, you learn how to make buttons in Fiori Elements Apps disappear.

There are two groups of annotations to control whether the buttons are visible or enabled in Fiori Elements:
 - `@UI.<Operation>Hidden` is intended to control the visibility of the buttons.
 - `@Capabilities.<Operation>able` is intended to control whether the buttons are enabled.

To control the availability of the buttons on the List Report, the annotations **must** be bound to a field that is not part of the displayed entities.

To control the availability of the buttons on the Object Page, both annotations can either be bound to a field that is part of the displayed entities per entity or to a field that is **not** part of the entities to control the visibility for all entities at once.

---

## Create Button (Only on List Report)
Annotations to hide it: `@UI.CreateHidden`</br>
Annotation to grey it out: None

## Edit Button (Only on Object Page)
Annotation to hide it: `@UI.UpdateHidden` </br>
Annotation to grey it out: None

## Delete Button (On both List Report and Object Page)
Annotation to hide it: `@UI.DeleteHidden` </br>
Annotation to grey it out: `@Capabilities.Deletable`

---

## Users
The app provides three users: alice, bob and charlie. alice and bob are admin which means, they can create books and update and delete the books they have created themselves, but not those created by others. charlie is not an admin, i.e. he can only read books.

## How to test
- Run `npm i` to install the dependencies.
- Run `cds watch` to start the app.
