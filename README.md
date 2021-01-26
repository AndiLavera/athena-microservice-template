# Athena Mono-Micro Template

> Note: Name is work in progress.

This is a fullstack SSR template for [Athena](https://github.com/athena-framework/athena). The goal of this template is to reduce some of the burden when developing microservices. Rather than spinning up multiple servers in development, you can run the app as single-monolithic application. Then, come deployment time, you can build & deploy each piece independently.

# Quick Start

## Installation

Click [here](https://github.com/andrewc910/athena-microservice-template/generate) to generate this repo

Clone your new repo:

    ```sh
    git clone https://github.com/YOUR_USERNAME/YOUR_REPO
    ```

## Getting Started

Install all dependencies

    ```sh
    shards install
    npm i
    ```

Test that everything works and visit `localhost:3000`

    ```sh
    npm run dev:all
    ```

(Optional) If you plan on using a database, you should start with building your [micrate](https://github.com/amberframework/micrate) binary.

    ```sh
    crystal build db/cli.cr
    ```

# Features

This template is designed for fullstack applications. Some features of this template (excluding native Athena features) include:

- A root server and a single microservice to display how others can be created

  - Routes are `/` & `/about`

- Nodemon for watching crystal files

- Snowpack Bundler for NPM packages with Hot Module Reloading configured & enabled

- Static File Handling

- Granite ORM

- A set of npm scripts to easily manage the entire application

# Potential Problems

### Event Listeners

In monolith mode, an event listener will be invoked regardless of the microservice it is defined it. IE: An event listener listening to requests will be invoked on any request.

##### Potential Fix

- Find some way to register request/response events (and in the future, orm events) to a specific controller/model.

- Guard clause pased on path if it's a request or response event.
