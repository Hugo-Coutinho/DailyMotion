# DailyMotion

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                    <img src="https://github.com/Hugo-Coutinho/README-Assets/blob/master/Other/DailyMotion.gif?raw=true" width="250" height="450"/>
                </a>
            </td>            
        </tr>   
    </table>
</div>


To use this project, you'll need to install the following package dependencies:

- **UI Components**: This project utilizes the UI components provided by the `HGUIComponents` package, developed by the project owner. The goal of this package is to encapsulate reusable UI elements and provide a clean interface for UI development. You can install it via Swift Package Manager by adding the following dependency to your `Package.swift` file:

  ```swift
  .package(url: "https://github.com/Hugo-Coutinho/HGUIComponents", from: "1.0.3")


- **Network Layer**: The networking functionalities are powered by the Network-Layer-Framework package, also developed by the project owner. The aim of this package is to abstract network interactions and provide a modular and scalable solution for handling network requests. You can add it to your project using Swift Package Manager with the following dependency:

```swift
  .package(url: "https://github.com/Hugo-Coutinho/Network-Layer-Framework", from: "1.0.5")

```

- **Video Feature**: For the video feature, this project depends on another package named Video-Feature-Package, developed by the project owner. The purpose of this package is to isolate video-related functionality and maintain a clear separation of concerns. You can integrate it into your project using Swift Package Manager with the following dependency:

```swift
.package(url: "https://github.com/Hugo-Coutinho/Videos-DailyMotion", from: "1.0.0")

```

The goal of these packages is to isolate code and promote clean architecture principles, such as single responsibility and modularity. Ensure that you add these dependencies to your Package.swift file and import the necessary modules in your project to leverage the functionalities provided by these packages.


## Architecture

This project follows the MVVM-C (Model-View-ViewModel with Coordinator) architecture pattern. MVVM-C is a variation of the MVVM pattern that incorporates a coordinator to handle navigation and flow control within the application.

### Benefits of MVVM-C Architecture

- **Separation of Concerns**: MVVM-C promotes a clear separation of concerns by dividing responsibilities among different components. Models represent the data, Views display the UI, ViewModels contain the presentation logic, and Coordinators manage the navigation flow.

- **Testability**: MVVM-C makes it easier to write unit tests for individual components. ViewModels encapsulate the business logic, making them testable in isolation. Coordinators can also be tested to ensure proper navigation behavior.

- **Reusability**: With MVVM-C, Views are decoupled from the business logic, allowing for better code reuse. ViewModels can be reused across different Views, and Coordinators can be reused to manage navigation in multiple parts of the application.

- **Maintainability**: Regarding principles of separation of concerns and single responsibility, MVVM-C helps maintain a clean and modular codebase. Changes to one part of the application are less likely to impact other parts, making maintenance easier over time.

- **Scalability**: MVVM-C provides a scalable architecture that can accommodate the growth of the application. As the project grows in size and complexity, MVVM-C helps maintain a structured and organized codebase, facilitating collaboration among team members.

By using MVVM-C architecture, this project aims to achieve these benefits and create a maintainable, testable, and scalable application structure.

## Unit Tests

This project includes comprehensive unit tests to ensure the reliability and correctness of its components. The unit tests are written using XCTest framework and follow best practices for unit testing in Swift.

### Mocking Dependencies with Spies

To isolate the units under test and simulate interactions with dependencies, this project utilizes the concept of spies. Spies are test doubles that allow us to observe and verify interactions between the unit under test and its dependencies without invoking the actual implementation.

For example, when testing a ViewModel that depends on a service for data fetching, we create a spy for the service protocol and use it to verify that the ViewModel makes the correct calls to the service methods with the expected parameters.

### Mocking Data with JSON Files

In addition to mocking dependencies, this project also mocks data using JSON files. JSON files containing sample data are included in the test bundle, and these files are used to provide realistic test data for various scenarios.

For instance, when testing a network layer component that parses JSON responses, we load sample JSON data from a file and pass it to the component's parsing method. This allows us to simulate different network responses and ensure that the parsing logic works as expected under various conditions.

### Memory Leak Testing

This project includes unit tests specifically designed to detect memory leaks. One such test is the `test_viewModelNotRetained()` test, which checks whether the ViewModel is deallocated properly after it goes out of scope. Here's how it works:

1. **Given**: Create an instance of the ViewModel (`sut`) and retain it.

2. **When**: Invoke a method on the ViewModel that triggers its internal logic.

3. **Then**: Set the reference to the ViewModel to `nil` and ensure that it has been deallocated by checking whether a weak reference to it is `nil`.

This test verifies that the ViewModel is properly deallocated and does not cause any memory leaks, ensuring the application's memory usage remains efficient and stable.

### System Under Test (SUT)

The "System Under Test" (SUT) refers to the component or module being tested in a unit test. In the context of these unit tests, the SUT typically refers to the ViewModel or other classes being tested for correctness and functionality. The unit tests interact with the SUT to exercise its behavior and verify its expected outputs under different conditions.

## TableViewController

The `TableViewController` included in this project is designed to provide a flexible and reusable solution for managing UITableView-based interfaces. It offers several benefits:

### Isolation and Decoupling

The `TableViewController` isolates table view management logic from the view controller, promoting a clean separation of concerns. By encapsulating table view-related functionality within a dedicated class, it reduces the complexity of view controllers and makes them more focused on handling high-level application logic.

### Reusability

With its modular architecture, the `TableViewController` can be easily reused across different parts of the application or even in other projects. By abstracting away common table view tasks such as data binding, cell configuration, and event handling, it simplifies the process of creating and maintaining table view-based UI components.

### Customization and Extension

The `TableViewController` provides extension points and customization options to adapt to various use cases and design requirements. Developers can subclass the `TableViewController` to override default behavior or add custom functionality without modifying the core implementation. This promotes code reusability and facilitates the creation of tailored table view interfaces.

### Clean and Concise View Controllers

By delegating table view management tasks to the `TableViewController`, view controllers remain focused on their primary responsibilities, such as coordinating user interactions and view Presentation. This results in cleaner, more maintainable view controller code that is easier to understand and debug.


- **Section Communication**: In conjunction with the `Section` protocol, the ViewController facilitates communication between the TableViewController and individual feature sections. This protocol allows each section to encapsulate its own MVVM-C architecture, effectively breaking down the overall architecture into mini MVVM-C components for each feature section.

- **Isolation and Reusability**: By leveraging the Section protocol, developers can create feature sections that are completely isolated from the rest of the application. Each section encapsulates its own ViewModel, View, and Coordinator, enabling modular development and easy reuse of components across different parts of the application or even in other projects.

- **Mini MVVM-C Architecture**: With the Section protocol, developers can implement a mini MVVM-C architecture within each feature section. This promotes separation of concerns and maintainability by keeping the logic, presentation, and navigation related to a specific feature contained within its own module.

- **Modularity and Scalability**: The use of feature sections and the Section protocol enhances the modularity and scalability of the application architecture. Developers can add or remove feature sections independently, without affecting other parts of the application, making it easier to manage complexity and extend functionality over time.
