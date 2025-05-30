#   Documentation for Whirly Machine Control Library

##   1.  Introduction

This document describes a library designed to control a Whirly machine for testing purposes. This document outlines the keywords, parameters, and functions available to the tester to control the machine.

##   2.  Purpose

The purpose of this document is to provide information so that the user can:
* Control the operation of the machine in various ways.
* Remotely grasp the status of the machine.

##   3.  Keywords and Parameters
This section details the keywords available for controlling the Whirly machine and their associated parameters.

### Start Whirly In Forever Style
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Usage**: **`Start Whirly In Forever Style`** `WhirlyConfig()`
* **Description**: Run continuously according to user settings for a certain period of time or until receiving a "stop" command.
* **Arguments**:
    * `WhirlyConfig` *(object)*
        - Refer to object [WhirlyConfig()](#whirlyconfig).
        - Refer to the whirly configuration rules [Whirly_config_rules](#whirly-config-rules).
* **Return**: A respond will be returned. May raise an exception error.
    * "ACK": Success.
    * "NAK": Failed.
* **Example**: `Start Whirly In Forever Style` `WhirlyConfig(speed=30, unit='mpm', timeLife=2, wheelDiameter=114, forced=true, whirlySubConfig(direction='clockwise'))`
* ***Meaning***: Start the 'whirly' to run continuously for 2 days. Use the following configuration: speed 30 meters/minute, wheel diameter 114 units, forced running and rotating clockwise.

---

### Start Whirly In Startstop Style
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Usage**: **`Start Whirly In Startstop Style`** `WhirlyConfig()`
* **Description**: Control the machine to run and stop for a certain period of time and repeat this for the duration desired by the user.
* **Arguments**:
    * `WhirlyConfig` *(object)*
        - Refer to object [WhirlyConfig()](#whirlyconfig).
        - Refer to the whirly configuration rules [Whirly_config_rules](#whirly-config-rules).
* **Return**: A respond will be returned. May raise an exception error.
    * "ACK": Success.
    * "NAK": Failed.
* **Example**: `Start Whirly In Startstop Style` `WhirlyConfig(speed=30, unit='mpm', timeLife=2, wheelDiameter=114, forced=true, whirlySubConfig(direction='clockwise', cycles=[10,2]))`
* ***Meaning***: Whirly will run for 10 minutes, then stop for 2 minutes, and run for another 10 minutes, repeating this continuously for 2 days. Use the following configuration: speed 30 meters/minute, wheel diameter 114 units, forced running and rotating clockwise.

---

### Start Whirly In Blocks Style
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Usage**: **`Start Whirly In Blocks Style`** `WhirlyConfig()`
* **Description**: The wheel will be divided into many blocks of equal size (2 blocks, 4 blocks, ...). The machine will run through each block for a certain period of time, at each block the machine will perform the rotation type depending on the configuration (pause, loop).
    * Precondition: Align the wheel's arrow match with "Maker" on the body machine.
    * Before running, the machine will automatically rotate the arrow towards the sensor and then run.
* **Arguments**:
    * `WhirlyConfig` *(object)*
        - Refer to object [WhirlyConfig()](#whirlyconfig).
        - Refer to the whirly configuration rules [Whirly_config_rules](#whirly-config-rules).
* **Return**: A respond will be returned. May raise an exception error.
    * "ACK": Success.
    * "NAK": Failed.
* **Example**: `Start Whirly In Blocks Style` `WhirlyConfig(speed=30, unit='mpm', timeLife=2, wheelDiameter=114, forced=true, whirlySubConfig(direction='clockwise', cycles=[1], blocksNumber=2, rotatyType="stop"))`
* ***Meaning***: Divide the rotation of the wheel into two equal parts, the wheel will rotate and stop at the end of the block for 1 minute in the first block, the wheel rotates clockwise at a speed of 30 meters per minute. Do the same with the second block after 1 minute. Repeat the above process for 2 days.

---

### Start Whirly In Reverse Style
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Usage**: **`Start Whirly In Reverse Style`** `WhirlyConfig()`
* **Description**: The Whirly rotates clockwise for a set amount of time and counterclockwise for a set amount of time. The machine will repeat this for the desired amount of time.
* **Arguments**:
    * `WhirlyConfig` *(object)*
        - Refer to object [WhirlyConfig()](#whirlyconfig).
        - Refer to the whirly configuration rules [Whirly_config_rules](#whirly-config-rules).
* **Return**: A respond will be returned. May raise an exception error.
    * "ACK": Success.
    * "NAK": Failed.
* **Example**: `Start Whirly In Reverse Style` `WhirlyConfig(speed=30, unit='mpm', timeLife=2, wheelDiameter=114, forced=true, whirlySubConfig(cycles=[7,5]))`
* ***Meaning***: Whirly will run clockwise for 7 minutes, then counterclockwise for 5 minutes, then clockwise for 7 minutes, repeating continuously for 2 days. Use the following configuration: speed 30 meters/minute, wheel diameter 114 units, forced running.

---

### Start Whirly In Ease Style
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Usage**: **`Start Whirly In Ease Style`** `WhirlyConfig()`
* **Description**: The machine will rotate the wheel in the specified direction at an increasing or decreasing speed for a certain period of time.
* **Arguments**:
    * `WhirlyConfig` *(object)*
        - Refer to object [WhirlyConfig()](#whirlyconfig).
        - Refer to the whirly configuration rules [Whirly_config_rules](#whirly-config-rules).
* **Return**: A respond will be returned. May raise an exception error.
    * "ACK": Success.
    * "NAK": Failed.
* **Example**: `Start Whirly In Ease Style` `WhirlyConfig(speed=30, unit='mpm', timeLife=2, wheelDiameter=114, forced=true, whirlySubConfig(direction='clockwise', cycles=[10], rotatyType="speedup"))`
* ***Meaning***: The wheel rotates at a speedup rate starting at 30 meters per minute to its maximum speed. The speedup will occur over a 10 minute period, after which the machine will start over again. The wheel rotates clockwise. This process is repeated for approximately 2 days.

---

### Start Whirly With Config File
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Usage**: **`Start Whirly With Config File`** `pathFile`
* **Description**: Whirly is initiated using settings defined in a configuration file. Using JSON file to setting.
* **Arguments**:
    * `pathFile` *(file)*
        - Refer to file format [Whirly Config File - JSON](#whirly-config-file---json)
* **Return**: A respond will be returned. May raise an exception error.
    * "ACK": Success.
    * "NAK": Failed.
* **Example**: `Start Whirly With Config File` `/Data/Whirly/whirly_config.json`

---

### Stop Whirly Machine
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Usage**: `Stop Whirly Machine`
* **Description**: Halts the Whirly machine's operation.
* **Arguments**: *(None)*
* **Return**: A respond will be returned. May raise an exception error.
    * "ACK": Success.
    * "NAK": Failed.
* **Example**: `Stop Whirly Machine`

---

### Get Whirly Status
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Usage**: `Get Whirly Status`
* **Description**: The Whirly machine should respond with a string containing the status information.
* **Arguments**: *(None)*
* **Return**: A ***[WhirlyStatus](#whirlystatus)*** will be returned. May raise an exception status.
* **Example**: `Get Whirly Status`

---

### Get Whirly Config
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Usage**: `Get Whirly Config`
* **Description**: The Whirly machine should respond with a object containing the current configuration information.
* **Arguments**: *(None)*
* **Return**: *(obj)* A ***[WhirlyConfig](#whirlyconfig)*** object will be returned. May raise an exception status.
* **Example**: `Get Whirly Config`

###   3.1: Objects
#### WhirlyConfig
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Properties**:
    | Name | Description    | Return Type    |
    | :---   | :--- | :---: |
    | speed | Represents the speed of wheel.   | int   |
    | [unit](#whirlyunit) | Unit of measurement for the speed field.  | string   |
    | timeLife | The machine uptime, unit is days.   | int   |
    | wheelDiameter | The diameter of the wheel, default is 114.   | int   |
    | forced | Run the machine in any way.   | bool   |
    | [whirlySubConfig](#whirlysubconfig) | Set up more settings for the machine.   | WhirlySubConfig()   |

#### WhirlySubConfig
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Properties**:
    | Name | Description    | Return Type    |
    | :---   | :--- | :---: |
    | [direction](#whirlydirection) | The direction of rotation of the wheel, Counterclockwise or Clockwise.   | string   |
    | cycles | The cycle of performing a small action of the machine.  | list[]   |
    | blocksNumber | The number of blocks divided on the wheel.   | int   |
    | [rotatyType](#whirlyrotatytype) | The machine operation scenario.   | string   |

###   3.2: Enums
#### WhirlyStatus
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Description**: Enumeration of possible status codes and value.
* **Properties**:
    | Name | Value    |
    | :---   | :--- |
    | READY | 0   |
    | RUNNING | 1   |
    | ERROR | 2   |
    | CONNECTION_FAILED | 3   |
    | CONNECTION_LOST | 4  |

#### WhirlyStyle
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Properties**:
    | Name | Value    |
    | :---   | :--- |
    | FOREVER | 'forever'   |
    | START_STOP | 'startstop'   |
    | BLOCKS | 'blocks'   |
    | REVERSE | 'reverse'   |
    | EASE | 'ease'   |

#### WhirlyUnit
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Properties**:
    | Name | Value    |
    | :---   | :--- |
    | RPM | 'rpm'   |
    | MPM | 'mpm'   |

#### WhirlyDirection
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Properties**:
    | Name | Value    |
    | :---   | :--- |
    | CLOCKWISE | 'clockwise'   |
    | COUNTERCLOCKWISE  | 'counterclockwise'   |

#### WhirlyRotatyType
* ***Defined in***: *\testmate\RF_Keywords\Whirly_Keywords.resource*
* **Properties**:
    | Name | Value    |
    | :---   | :--- |
    | PAUSE | 'pause'   |
    | LOOP | 'loop'   |
    | SLOW_DOWN | 'slowdown'   |
    | SPEED_UP | 'speedup'   |

###   3.3: Files
#### Whirly Config File - JSON
* ***Stored at***: *\testmate\RF_Keywords\Data*
* **Description**: To start running the machine in the desired way, JSON file is used to set configuration for the machine. Some fields will have separate values, refer [Rules](#whirly-config-rules).
* **Format**:

```json
{
    "style": "forever",
    "speed": 50,
    "unit": "rpm",
    "timeLife": 2,
    "wheelDiameter": 114,
    "forced": true,
    "subConfig": {
        "direction": "clockwise",
        "cycles": [10, 3],
        "blocksNumber": 4,
        "rotatyType": "slowdown"
    }
}
```

###   3.4: Rules
This section defines the configuration initialization rules.

#### Whirly Config Rules
* **Description**: Configure the running mode for whirly, depending on the different rotation types of the machine, there will be corresponding configurations as well as specific regulations on parameter values.

* **Input Parameters**: The table below defines the parameters required for each different type of rotation.

| Style         | Speed |  Unit | Time Life | Wheel Diameter | Forced | Direction | Cycles | Block Number | Rotaty Type |
| :---          | :---: | :---: |   :---:   |      :---:     | :---:  |   :---:   | :---:  |     :---:    |       :---:      |
| **Forever**   |   x   |   x   |     x     |      x         |    x   |     x     |        |              |                  |
| **StartStop** |   x   |   x   |     x     |      x         |    x   |     x     |    x   |              |                  |
| **Blocks**    |   x   |   x   |     x     |      x         |    x   |     x     |    x   |       x      |       x          |
| **Reverse**   |   x   |   x   |     x     |      x         |    x   |           |    x   |              |                  |
| **Ease**      |   x   |   x   |     x     |      x         |    x   |     x     |    x   |              |       x          |

* **Regulations**
    * **Speed**: depending on the unit, there will be different limit values.
        *  mpm: range 2 - 40.
        *  rpm: range 5 - 99.
    * **Time Life**: unit is days.
        * Value = 0: The machine will operate continuously, stopping only when receiving a stop command.
        * Value > 0: The machine will run continuously and stop when the specified time is up.
    * **Forced**: True or False:
        * True: Requires the machine to operate regardless of whether the machine is performing another request or not.
        * False: The machine will execute the command if the machine is in "READY" state with response of ACK/NAK. If the machine is in "RUNNING" state, the command will return message to stop the current command and start a new command with question "YES NO".
    * **With StartStop style**:
        * Cycles:
            * Unit is minute.
            * Format is list ```[<start time>, <stop time>]```. 
            * Required Value > 0.
    * **With Blocks style**:
        * Cycles: 
            * Unit is minute.
            * Format is list with only one value ```[<stop time/loop time>]```. 
            * Required Value > 0.
        * Block Number: The value are defined on the wheel. 
        * Rotaty Type: only support 2 types: stop and loop.
            * stop: the wheel will spin "Direction" and stop at the end of the block. After "Cycles" time expires, the wheel will repeat the action with other blocks.
            * loop: the wheel will rotate in the "Direction" configuration and reverse, repeating this for the "Cycle" time. After "Cycles" time expires, the wheel will repeat the action with other blocks.
    * **With Reverse style**:
        * Cycles: 
            * Unit is minute.
            * Format is list ```[<clockwise time>, <counterclockwise time>]```.
            * Required Value > 0.
    * **With Ease style**:
        * Cycles: 
            * Unit is minute.
            * Format is list with only one value ```[<slowndown time/speedup time>]```.
            * Required Value > 0.
        * Rotaty Type: only support 2 types: slowndown and speedup.
            * slowndown: the wheel rotates at a decreasing speed, starting from "Speed" to minimum, which takes place over a period of "Cycle".
            * speedup: The wheel rotates at increasing speed, starting from "Speed" to maximum, which takes place over a period of "Cycle".

##   4.  Implementation Details
_(This section provides lower-level details and is intended for developers maintaining the library.)_

```Update Later```

##   5.  Future Enhancements
* Nothing
