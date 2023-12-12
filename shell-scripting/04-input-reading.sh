#!bin/bash
echo "enter username:"
read USERNAME
echo "entered username is: $USERNAME"
echo "enter password:"
read -s PASSWORD # -S is for not displaying the text we entered on the console
echo "entered password is: $PASSWORD"