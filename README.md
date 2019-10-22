# Task

The objective is to build an application that shows a list of bookings and corresponding booking
details.

The following screens shows a list of bookings and booking detail screens. Your task is to
develop a similar screen on iOS(swift 4.0) or Android(Java or Kotlin) platform, whichever you
are more familiar with.

* Show a list of bookings. Grouped bookings are shown in a list with only start/end time
information.

* Tap on any of the bookings to show a booking detail screen.

* In the booking detail screen ,show a booking details view.

# Requirements

* The detailed style(colors/fonts/icons etc) is not assessed . But please follow the
given UI layout as closely as possible.

* Use the given json files as your local data source

* Avoid using 3rd party libraries unless absolutely necessary.

* There is no time limit for this challenge. Please think about how easy your code will be
to maintain and extend. Try to write what you consider to be production-quality code,
with the comments and tests you consider necessary.

* The user interface should not be blocked while importing data.

* Cope with different screen sizes


# Submission

You should submit the following for review:

* A compressed file contains this whole project

* Or a link to the github page of this exercise project


# Solution

## Software Architecture:

Model–view–viewmodel (MVVM)

* Model : All the model Classes (eg: VehicleBookings, Vehicle, Pod)
* ViewModel : VehicleBookingViewModel use to get VehicleBookings, Vehicle and Pod data.
* LogicController : All the viewcontoller logic written in logic controller
* Views: All ViewControllers

All modules are separated so it can be resuable.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://github.com/pakidanish/MindValley/blob/master/LICENSE)