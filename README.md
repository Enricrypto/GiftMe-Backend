# Gift Me Backend

Welcome to the backend repository for Gift Me, an app designed to manage the creation of groups, wishlists, and the addition of gifts to those wishlists. This app helps users keep track of their gift-giving participation within various groups.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Gift Me is a backend service that supports the management of groups and wishlists, allowing users to add and track gifts within these lists. The application leverages Supabase for authentication and is built using Node.js, Express, and Prisma (ORM) for robust and efficient backend operations.

## Features

- **Group Management**: Create and manage groups of users.
- **Wishlist Management**: Create and manage wishlists for each group.
- **Gift Tracking**: Add and track gifts in wishlists.
- **User Authentication**: Secure user login and registration using Supabase.

## Tech Stack

- **Node.js**: JavaScript runtime for building scalable network applications.
- **Express**: Web framework for Node.js to create robust APIs.
- **Prisma**: Modern ORM for Node.js and TypeScript.
- **Supabase**: Backend-as-a-Service (BaaS) providing authentication, database, and storage services.

## Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/yourusername/gift-me-backend.git
    cd gift-me-backend
    ```

2. **Install dependencies**:
    ```sh
    npm install
    ```

3. **Set up environment variables**:
    Create a `.env` file in the root directory and add the following variables:
    ```plaintext
    DATABASE_URL=your_database_url
    SUPABASE_URL=your_supabase_url
    SUPABASE_KEY=your_supabase_key
    ```

4. **Run database migrations**:
    ```sh
    npx prisma migrate dev
    ```

5. **Start the server**:
    ```sh
    npm start
    ```

## Configuration

The application relies on environment variables for configuration. Ensure that you have a `.env` file with the necessary configurations.

## Usage

After setting up the project, you can start the server and use the provided API endpoints to manage groups, wishlists, and gifts.

## API Endpoints

### Authentication
- **POST /auth/signup**: Register a new user.
- **POST /auth/login**: Authenticate a user.

### Groups
- **POST /groups**: Create a new group.
- **GET /groups**: Get a list of all groups.
- **GET /groups/:id**: Get details of a specific group.
- **PUT /groups/:id**: Update a group.
- **DELETE /groups/:id**: Delete a group.

### Wishlists
- **POST /wishlists**: Create a new wishlist.
- **GET /wishlists**: Get a list of all wishlists.
- **GET /wishlists/:id**: Get details of a specific wishlist.
- **PUT /wishlists/:id**: Update a wishlist.
- **DELETE /wishlists/:id**: Delete a wishlist.

### Gifts
- **POST /gifts**: Add a new gift to a wishlist.
- **GET /gifts**: Get a list of all gifts.
- **GET /gifts/:id**: Get details of a specific gift.
- **PUT /gifts/:id**: Update a gift.
- **DELETE /gifts/:id**: Delete a gift.

## Contributing

We welcome contributions to enhance the functionality of Gift Me. Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

Thank you for using Gift Me! If you have any questions or need further assistance, feel free to open an issue or contact the project maintainers.

![image](https://github.com/Enricrypto/GiftMe-Backend/assets/105727501/4f5a5cb6-1dff-4700-89b8-8402aafe7666)


