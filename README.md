Xcode : Swift UI for App Build
Database : Firebase

Leveraged Firebasefirestore to maintain datbases and firebase auth to authenticate user

Applications built:
1. User can sign in / sign out and create a new account
2. they can create custom tasks, which is stored in todo collections of our user database in firebase
3. to create a custom task they enter name and select a due date
4. the database stores information such as name, email id, password, userid, date joined
5. they can view all their tasks, swipe left to delete a task
6. Each task has a checkmark next to it to mark it as done
7. For profile view we fetch the user information and display it
8. Signout Button logs the user out

A video demonstration 


https://github.com/prachikaag/ToDoListApp/assets/37405362/f3966181-216a-466a-beaf-4b7cdf58bcaa


To acheive we create 8 views and corresponding view models as listed below:
1. To Do List View - here all the fields from new Item view are displayed, the + sign opens up the newitem view
<img width="305" alt="Screenshot 2024-04-03 at 8 07 48 PM" src="https://github.com/prachikaag/ToDoListApp/assets/37405362/7b926e13-4348-41a3-a3f1-fce7a2356c63">

2. Header View - this contains styling details we call in our Registration and login pages
<img width="213" alt="Screenshot 2024-04-03 at 8 00 35 PM" src="https://github.com/prachikaag/ToDoListApp/assets/37405362/dae69d92-a0a7-4e29-a9c5-abe524245342">

3. To Do List Item View - this view takes in user information such as id, title, duedate, currentdate and isdone status and call the view model which toggles the isDone status and sets the firestore record
<img width="208" alt="Screenshot 2024-04-03 at 8 07 08 PM" src="https://github.com/prachikaag/ToDoListApp/assets/37405362/e6121c88-6409-478e-a98e-19252eee0b69">
  
4. New Item View - this takes in all the Form field values and shows an alert if invalid values are entered. It call the view model which creates a database field with the details
<img width="317" alt="Screenshot 2024-04-03 at 8 05 50 PM" src="https://github.com/prachikaag/ToDoListApp/assets/37405362/88bb285b-25f1-4dd3-a5d8-908620172d72">

5. Login View - here the user enters the login info and the view model validates the info
<img width="202" alt="Screenshot 2024-04-03 at 8 04 28 PM" src="https://github.com/prachikaag/ToDoListApp/assets/37405362/e0dc185b-5685-4df0-9f68-ae725415889b">

6. Profile View - here we use the view model to fetch user information from the database and display it, for the signout button create a separate function in viewmodel which signs a user out
<img width="310" alt="Screenshot 2024-04-03 at 8 01 41 PM" src="https://github.com/prachikaag/ToDoListApp/assets/37405362/5518160e-4c3d-4d44-bd56-0e1b8a6fb769">

7. Register View - the user can create an account, we have added basic email and password validation
<img width="202" alt="Screenshot 2024-04-03 at 8 05 15 PM" src="https://github.com/prachikaag/ToDoListApp/assets/37405362/4876c869-29f1-4abb-bad0-d1c6e5ef385d">

8. Button View - this creates the logic for a button you can call this by entering title of the button and background color and it creates a button with the details mentioned
<img width="202" alt="Screenshot 2024-04-03 at 8 02 53 PM" src="https://github.com/prachikaag/ToDoListApp/assets/37405362/afd0cfda-c6ef-486c-a877-67a970063ce0">
