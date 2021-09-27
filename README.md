# 372 Project 1 Haskell - Nicholas Leluan and Taylor Willittes
<h2>Download Haskell & GHC Compiler:</h2>
<b>Windows:</b>
<ul>
  <li>If your machine has Choclatey:</li>
  <ul>
    <li> follow these steps : <code>https://www.haskell.org/platform/#windows</code></li>
  </ul>
  <li> If your machine <b> doesn't </b> have Choclatey installed: </li>
    <ul>
      <li> follow just the steps under 'How to install': <code>https://docs.haskellstack.org/en/stable/README/</code></li>
    </ul> 
  </ul>
 <b>Mac / Linux </b>
 <ul>
  <li>If your machine has Homebrew installed:</li>
  <ul>
    <li> Run the following command: <code>brew install ghc</code></li>
  </ul>
  <li>If your machine <b> doesnt </b> have Homebrew installed:
    <ul>
      <li>Run the following command: <code>curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh</code></li>
      <li>Follow the instructions after command</li>
    </ul>
  </ul>
 <h2>Running the Glasgow Haskell Compiler (ghci)</h2>
 Once you have successfully installed the Haskell stack and ghc compiler (which should have been included in all the above downloads), 
 now you can run a Haskell program!
 Follow these steps to play with the Haskell ghci:
 <ol>
  <li>Open terminal</li>
  <li>Run command: <code>ghci</code></li>
  <li>BOOM! Thats it!</li>
  </ol>
Now this is just the interactive shell to run scripts and practice basics in Haskell, but we will come back to this to run the project program.<br>
<h2>Running programs in <code>ghci</code></h2>
Here are the steps to run a Haskell program, first you need a program -- start by cloning this repository to your local machine! The follwoing should work on all platforms, we recommend imprting the project file into your preferred IDE (installing any plugins necessary for Haskell given your IDE) then running the program in the interactive shell within the IDE!
Steps:
<ol>
  <li>Clone repository onto local machine</li>
  <li>Make sure that your present working directory is "cd'ed" to the src file of this repository</li>
  <li>Compile the program with the following command: <code>ghc ./haskell_project1.hs</code></li>
  <ul><li><i>note this is the name of the MAIN file of our project!</i></li></ul>
  <li>Once the program has compiled, run the <code>ghci</code> command introduced above by typing: <code>ghci</code></li>
  <ul><li><i>You should be greeted with a prompt that starts with <code>Prelude></code></i></li></ul>
  <li>Now we need to load the program so we can interact with its functions! Run the following command: <code>:load haskell_project1</code></li>
  <ul><li><i>upon successful program load, the <code>Prelude></code> prompt should be changed to the<code>Main*></code> prompt</i></li></ul>
  </ol>
<h2>Running our Project 1 code </h2>
There are two ways to run our code! We wanted to get a feel for what its like to run Haskell like a dynamic Java/Python program, where use can input values. A majority of our code can be run much like the class examples, by simply calling the function with the correct input! Below we will walk through how to do each approach.
<ol>
  <li>Running Main with a very simple calculator:</li>
  <ul>
    <li>Compile the program using the following command (being cd'ed into src): <code> ghc ./haskell_project1.hs </code></li>
    <li>Now, run the program with the command: <code>./haskell_project1</code>
      <ul><i><li>This will run the Main() function in the file, which demonstrates a very simple calculator that takes user input</i></li></ul>
  <li>The program will now prompt you for some input, plug away and have fun!</li>
  </ul>
  <li>Running individual functions in our file</li>
  <ul>
  <li>Compile the program using the following command (being cd'ed into src): <code> ghc ./haskell_project1.hs </code></li>
  <li>Run the GHCi compiler with the command: <code>ghci</code></li>
  <li>Load the program into the compiler with the command: <code>:load haskell_project1</code></li>
  <li>Now run any of the following functions, passing the correct parameters:</li>
  <ul>
    <li><b>reverseInteger int -> int</b> :: this function when called and passed an integer value, will reverse the ordering and return the value</li>
    <li><b>madlibs</b> :: running this function without any arguments well allow the user to complete one of two madlib stories given a user's input</li>
    <li><b>higherOrderFunc [Int] (Int,Int,Int) -> Int </b> :: a function that takes in another function and does some computations on a list of integers of any size. The following pre-defined functions may be used:
      <ul>
        <li><i>diff</i> : gets the difference between two neighboring values and combines them</li>
        <li><i>divide</i> : gets the quatient between two neighboring values and combines them</li>
        <li><i>modular</i> : gets the modulous between two neighboring values in an array and returns its madulous value</li>
        <li><i>remainder</i> : gets the remainder between two neighboring values in an array and returns its remainder value</li>
        <li><i>power</i> : gets the a^b power value of two neighboring values in an array and returns it</li>
        
  </ol>
  

  

