# Converter

A simple desktop unit converter built with Lua and [LÖVE](https://love2d.org/) (LÖVE 11.x).

## Features

Converter supports common conversions across five categories:

- **Temperature:** Celsius ↔ Fahrenheit
- **Length:** kilometers/miles, meters/feet, centimeters/inches
- **Weight:** kilograms/pounds, grams/ounces
- **Time:** seconds/minutes, hours/minutes
- **Volume:** liters/milliliters, cups/milliliters, liters/gallons

The app validates numeric input and displays results rounded to two decimal places.

## Requirements

- [LÖVE](https://love2d.org/) 11.x

## Run the project

Clone the repository:

```bash
git clone https://github.com/ffreshaf/Converter.git
cd Converter
```

Run the game directory with LÖVE:

```bash
love code
```

### Windows

Drag the `code` directory onto `love.exe`, or run:

```cmd
love.exe code
```

### macOS

```bash
open -n -a love code
```

## Controls

| Key | Action |
| --- | --- |
| Number keys or `.` | Enter a value |
| `Backspace` | Remove the last character |
| `Up` / `Down` | Select a conversion |
| `Enter` | Calculate the result |

## Project structure

```text
Converter/
├── code/
│   ├── conf.lua  # LÖVE window configuration
│   └── main.lua  # Conversion definitions and application logic
└── converter.love # Packaged LÖVE game
```

## Running the packaged build

On a system with LÖVE installed, open `converter.love` directly:

```bash
love converter.love
```

## License

No license has been specified for this project.
