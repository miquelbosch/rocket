# ROCKETS APP

The main purpose of this app is to show all the listed rockets obtained from the API: https://github.com/r-spacex/SpaceX-API

![APP Screens](https://github.com/miquelbosch/rocket/blob/develop/Resources/GIFs/demo.gif)

At this point, you can see that its a simple two screen app where we'd applied different type of knowledgement. Let's see!

## Characteristics 
Firstly, we have to know what type of app we want to do and what goals do you want to achieve with. Here are the main goals:

* Written in Swift 5
* Supported iOS varsion 14
* Code rules with SwiftLint
* Implement views by code or by Xib
* Testability (currently, 94% of coverage)
* Reusability
* Use patterns and clean code

## APP Architecture
When you have to start bulding a new app, you ask yourself what is the best architecture to use. This decision should be based on the requeriments and future expectatives. In this case, it's a very simple app that show only two screens, so we can use a MVC pattern. In MVC patterns, UIViewControllers are the mediators between the view and the model. This pattern put all the logic in the viewController, make it hard to test and mantain. However, is a nice pattern when you want to make an app faster. You need to initialize with few files. For this reason, we didn't chose this pattern and we'd follow MVVM pattern where introduces a new mediator: the View Model. All the business logic will be in the viewModel and this will notify the chances to the viewcontroller. ViewController and Models do not never interact directly.

This project have the follow structure
(photo)
We create a Framework for the app, in therms to reuse all the code between targets. For example, if we want to create widgets we can reuse the viewModels Logic to show the info in the widget. 

Another patterns or rules that we'd followed are: don't use any third resource (libraries) and don't use the api keys to allow an instantly installation(clone) + run app.

## First Screen: Rockets List
(Explicar que es donde se hace la llamada de la lista, se controla si hay algun error y se muestra la lista)

## Second Screen: Rocket Detail
(Dónde se muestra el detalle del cohete, puede haber error en la carrga de la foto, no hay caché)

## Third: Today Widget
(Hemos hecho la lógica en un framework para reutilizar, siempre hay que intentar reutilizar)

## Test
Coverage y reglas seguidas

## Error Handle
Mostrar pantalla error, que es muy top





