# Book Gallery

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Usage](#usage)
- [Technology Stack](#technology-stack)
- [Database Design](#database-design)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Project Overview
**Book Gallery** is a full-stack web application built to manage a digital collection of books. The platform provides an intuitive interface for users to view, search, add, update, and delete book entries. Its robust backend ensures seamless interaction with a database, supporting CRUD operations on books and user management.

The project primarily caters to small libraries or personal collections, offering flexibility in managing book details like author, ISBN, publication date, and genre. User authentication is enforced to restrict certain operations based on access levels.

## Features
- **User Authentication**: Registration and login functionality using secure password hashing.
- **Book Management**:
  - Add new books to the collection.
  - Edit or update book details.
  - Delete book records.
- **Search Functionality**: Search for books by title, author, or ISBN.
- **Responsive Design**: The interface is fully responsive and accessible from mobile and desktop devices.

## Getting Started
These instructions will guide you on how to set up and run the Book Gallery project on your local machine.

### Prerequisites
- .NET Framework 5.0+
- SQL Server (for database)
- Visual Studio 2019 or later

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/someshchauhan/Book_Gallery.git
   cd Book_Gallery
Restore NuGet packages:

Open the solution in Visual Studio.
Navigate to the Solution Explorer, right-click on the solution, and select Restore NuGet Packages.
Set up the database:

Ensure SQL Server is running.
Update the appsettings.json file to configure your database connection:
json
Copy code
"ConnectionStrings": {
  "DefaultConnection": "Server=YOUR_SERVER;Database=BookGalleryDB;Trusted_Connection=True;"
}
Run database migrations to set up the necessary tables:

bash
Copy code
dotnet ef database update
Build and run the project:

In Visual Studio, select IIS Express or your preferred server option and hit Run.
Usage
Once the project is running, navigate to http://localhost:5000/ to access the Book Gallery interface.

User Registration: First-time users must sign up with an email and password.
Login: Registered users can log in to manage books.
Manage Books: Users can add, edit, or delete book entries.
Search: Use the search bar to find books based on title, author, or ISBN.
Technology Stack
Backend:
ASP.NET Core (C#)
Entity Framework Core (EF Core) for data access
Frontend:
HTML5, CSS3, Bootstrap for responsive design
JavaScript for interactivity
Database:
SQL Server for data persistence
Tools:
Visual Studio 2019 for development
Git for version control
Database Design
The database is designed to efficiently store and manage book records, users, and related data. The core tables include:

Books: Stores information about each book (e.g., title, author, ISBN, publication date).
Users: Manages user information and authentication details.
Borrowing Records (optional): Tracks when users borrow and return books.
Entity Relationship Diagram (ERD)
To enhance the documentation, an ERD can be provided to visualize the relationships between the tables.

Contributing
Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

Fork the repository.
Create a new feature branch (git checkout -b feature-branch).
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature-branch).
Open a pull request.
License
This project is licensed under the MIT License. See the LICENSE file for more information.

Contact
For any queries or issues, please contact:

Author: Somesh Chauhan
Email: somesh@example.com (Replace with actual email)
