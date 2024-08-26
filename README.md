<img align="right" src="https://visitor-badge.laobi.icu/badge?page_id=iamthemag.Bill-Generator" />

# Bill Generator

## Overview

The Bill Generator is a robust and user-friendly tool designed to automate the billing process for restaurants and similar establishments. This script simplifies bill creation by integrating menu items, prices, and real-time user inputs into a comprehensive and professionally formatted bill. It leverages the power of Bash scripting to ensure efficiency, accuracy, and ease of use.

## Why It’s the Best

- **User-Friendly Interface**: The tool prompts users for essential information, including restaurant name, menu items, and prices, ensuring a seamless and intuitive setup.
- **Customizable**: Users can easily add or modify menu items and prices, allowing the tool to adapt to different business needs and offerings.
- **Automatic File Generation**: Upon completing the order, the script automatically generates a detailed bill in both text and PDF formats. This ensures that you have a digital and printable record of every transaction.
- **Print Integration**: The bill can be sent directly to a selected printer, streamlining the process from bill generation to customer handover.
- **Backup and Update Mechanism**: The script creates a new file with the current date and restaurant name each time it runs, ensuring that you always have a fresh and up-to-date billing file without overwriting previous data.

## How It Works

1. **Input Data**: Enter the restaurant name, menu items, and prices.
2. **Order Processing**: Take customer orders and calculate totals.
3. **Generate Bill**: Create a detailed bill in text and PDF formats.
4. **Print Option**: Send the bill to a printer of your choice.

## Usage

1. Run the `setup.sh` script to configure the bill generator.
2. Follow the prompts to enter the restaurant details and menu items.
3. The script will handle the rest, generating and printing the bill automatically.

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/iamthemag/bill-generator.git
    ```

2. Navigate to the project directory:

    ```bash
    cd bill-generator
    ```

3. Run the `setup.sh` script:

    ```bash
    bash setup.sh
    ```

## Features

- **Dynamic Menu Management**: Easily update and manage menu items and prices.
- **Date-Stamped Bill Files**: Bills are saved with the current date for easy tracking.
- **Printable Bills**: Directly print bills from the generated PDF files.

Feel free to contribute or suggest improvements!

## License

This project is licensed under the MIT License.
