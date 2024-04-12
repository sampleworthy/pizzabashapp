# PizzaBashApp

This is the PizzaBashApp, a simple command-line application for managing a pizza menu. It's written in Bash and uses `jq` for JSON processing.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Prerequisites

- Bash
- jq
- moreutils

### Installing

1. Clone the repository:
    ```
    git clone https://github.com/sampleworthy/pizzabashapp.git
    ```
2. Navigate to the project directory:
    ```
    cd PizzaBashApp
    ```

## Usage

There are two main scripts in the application:

- `POST-pizza.sh`: This script adds a new pizza to the menu. You can specify the item number, name, description, and prices for small, medium, and large sizes.
- `PUT-pizza.sh`:
- `DELETE-pizza.sh`: This script deletes a pizza from the menu. You need to specify the item number of the pizza to delete.

## Example:
Make to run Chmod +x (~bashscript~)
jaymlaws@cloudnoobs-MBP pizzabashapp % ./POST-pizza.sh
Item number 1 has been added.
jaymlaws@cloudnoobs-MBP pizzabashapp % ./PUT-pizza.sh
Item number 1 has been updated.
jaymlaws@cloudnoobs-MBP pizzabashapp % ./POST-pizza.sh
Item number 2 has been added.
jaymlaws@cloudnoobs-MBP pizzabashapp % ./DELETE-pizza.sh
Item number 2 has been deleted.
jaymlaws@cloudnoobs-MBP pizzabashapp % 
