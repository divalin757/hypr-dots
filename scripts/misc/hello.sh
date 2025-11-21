#tell bash that this is a bash file even though file extension is sh its called shebang
#!/bin/bash

#function
main() {
  #print a string
  echo "type your desired word"
  #get input
  read word

  #check if the word variable is equal to hello
  if [[ $word == "hello" ]]; then
    echo "correct"
  #check if the word variable is equal to hi
  elif [[ $word == "hi" ]]; then
    echo "also correct"
  #if it sint then print no
  else 
    echo "no"
  fi
}

#call the function
main
