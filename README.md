Important Note:

This Application was built by keeping in mind the limited scope and time for this assesment. You can find some improvements that I wanted to make to the application.

Key Features:
User Authentication & Login:

The app fetches login details from a mock API or local storage and stores the user’s login information in a cache manager.
On successful login, the app navigates to a dashboard where the user’s personal data (name, avatar, earnings, etc.) is displayed.

Dashboard with Navigation:

The main dashboard screen features a bottom navigation bar with multiple sections: Home, Jobs, Earnings, and Profile.
Users can navigate between these sections, with each section displaying relevant information such as the user’s profile details, earnings, and other personalized content.

Profile Management:

The app allows users to view and update their profile, including details like their name, email, bio, and avatar.
The profile screen dynamically loads user data passed from the login process and cache.

State Management:

The app uses StatefulWidgets and relies on routing mechanisms (with named routes) to ensure a smooth transition between screens.
The login information is passed from the login screen to the dashboard, with appropriate error handling and data integrity checks.
Routing and Navigation:

Named routes are implemented for managing navigation and routing, ensuring that each screen can be accessed easily.
Arguments, such as the Login object, are passed via routes to maintain seamless data flow across screens.


Can be Improved:

Centeralizd Themeing for application.
Use Media Query helper functions to give dynamic paddings,font-size etc for more responsive app.
Better and more Robust Base classes for networking.
Use Statemanagement packages like Bloc, Riverpod for App wide Statemanagent and better seperation of logic and presentation layer.
If you want to add many feautres in this application, a file structre where screens, controllers are grouped based on features will be better suited.
