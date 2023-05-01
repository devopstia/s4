
## Goal
- What is a Shell
- Type of shell in Linux (`cat /etc/shells` and `echo $SHELL`)
    - Bourne shell (sh)
    - Korn shell (ksh)
    - Bourne Again Shell also knew as bash (most popular)  
- Shebang (first line in the script): 
    - `#!/bin/sh` : execute the file using the Bourne shell
    - `#!/bin/bash`: execute the file using the Bash shell
    - `#!/usr/bin/pwsh` : execute the file using PowerShell
    - `#!/usr/bin/env python3` : execute with a Python interpreter
    - `#!/usr/local/bin/python3` : execute with a Python interpreter
- Comments
    - one line comment
    - multiple lines comment
- Variables
    - input variables
    - environments variables
    - user define variables
    - global variables
    - local variables
- Input and output (Echo)
    - STDIN (standard input) ====>> `0`
    - STDOUT (standard output) ====>> `1`
    - STDERR (standard error) ====>> `2`
- Operators
    - https://devopseasylearning.atlassian.net/wiki/spaces/DEL/pages/754184/Unix+Linux+-+Shell+Operators
    - Arithmetic Operators
        - `+` (Addition)
        - `/` (Division)
        - `x` (Multiplication)
        - `==` (Equality)
        - `=` (Assignment)
        - `!=` (Not Equality)
    - Relational Operators (`man test` will help here)
        - `-eq or =` : equal
        - `-ne or !=` : not equal
        - `-lt or or <` : less than
        - `-le or <=` : less than or equal
        - `-gt or >` : greater than
        - `-ge or >=` : greater than or equal
    - Boolean Operators 
        - true
        - false
    - Logical operators 
        - Logical OR in a bash script is used with operator -o or | |
        - Logical AND in a bash script is used with operator -a or &&
    - String Operators
        - `-z` : checks if the given string operand size is zero
        - `!=` : checks if the value of two strings are not equal 
        - `-n` : checks if the given string operand size is non-zero
        - `=` checks if the value of two strings are equal 
    - File Test Operators
        - `-d file` : checks if the file is a directory 
        - `-f file` : checks if file is an ordinary file as opposed to a directory
        - `-x file` : checks if the file is executable
        - `-r file` : checks if the file is readable
        - `-w file` : checks if the file is writable
- Conditions
    - if statement. use `[[ ]]` with `==` and `[ ]` with `==`. `if [[ $FIRST_NAME == "tia" ]]` or `if [ $FIRST_NAME = "tia" ]`
        - if
        - elif
        - else
    - case statement
- Fuctionos
- Exit code 
    - echo $?
    - 0 - 255
- Shell Parameters and Argument
    - `$1 - $9`
        - `$1` : Print the first argument
        - `$2` : Print the second argument
        - `$3` : Print the third argument
    - `$0` : Represent name of the script
    - `$@` : Represent the complete list of arguments (Same as $∗, but differ when enclosed in `"`)
    - `$∗` : Represent the complete list of arguments
    - `$#` : Represent total number of arguments
    - `$?` : Represent last return code or exit code 
    - `$$` : PID (process ID) of the script
- Loop
    - for loops
    - while loops


## Inputs
Developers collect users' information through the GUI and shell collect users' information through the CLI with the echo command

```sh
read -p "What is your first name? " FIRST_NAME
read -p "What is your last name? " LAST_NAME
read -p "What is your age? " AGE
read -p "What is your email? " EMAIL
read -s -p "What is your password? " PASSWORD
read -p  "What is the group name that you what to create? " GROUP
```

## Variables
Developers store users data or information into a variable. Shell script also store users data or information into a variable

```sh
read -p "What is your first name? " FIRST_NAME
read -p "What is your last name? " LAST_NAME
read -p "What is your age? " AGE
read -p "What is your email? " EMAIL
read -s -p "What is your password ? " PASSWORD
read -p  "What is the group name that you what to create? " GROUP
```

```sh
name="Paul Smith"
age="45"

echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
echo "my name is $name, I am $age years."
```

## Echo
Developers display information to users through the GUI and shell script desplay information to the user through the GUI using `echo` command

```sh
read -p "What is your first name? " FIRST_NAME
read -p "What is your last name? " LAST_NAME
read -p "What is your age? " AGE
read -p "What is your email? " EMAIL
read -s -p "What is your password ? " PASSWORD
read -p  "What is the group name that you want to create? " GROUP

echo "Your first name is $FIRST_NAME"
echo "Your last name is $LAST_NAME"
echo "Your age is $AGE"
echo "Your password is $PASSWORD"
echo "Your email is $EMAIL"
echo "The group name that you want to create is $GROUP"
```

## Actions and conditions
- check conditioins
- create the user if the user does not exit
- not create a user if the exit already
- denied access if the username or password or email is wrong (invalid user or invalid username or password)

```sh
#!/bin/bash
echo "the DB password is $DB_PASSWORD"
echo "the DB username is $DB_USERNAME"
```

