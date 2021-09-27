import System.IO ()
import Data.Char
import GHC.Float.RealFracMethods (roundFloatInt)
import GHC.Exts (inline)
import Text.Show (Show)
import Distribution.SPDX (LicenseId(XSkat))
import Distribution.SPDX.LicenseId (LicenseId(XSkat))

--Higher-Order Function that will be able to subtract, divide, mod, 
--compute remainder, and power
higherOrderFunc :: [Int] -> (Int->Int->Int) -> [Int]
higherOrderFunc [] f = []
higherOrderFunc [a] f = [a]
higherOrderFunc (x:y:xs) f = f x y : higherOrderFunc xs f

-- The following functions are for running the higher order functions 
-- includes diff, divide, modular, remainder, power
diff :: Int -> Int -> Int 
diff a b = a - b

divide :: Int -> Int -> Int 
divide a b = a `div` b

modular :: Int -> Int -> Int 
modular a b = a `mod` b

remainder :: Int -> Int -> Int 
remainder a b = a `rem` b

power :: Int -> Int -> Int 
power a b = a ^ b
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!NOTE TO NICK FOR README!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- how map2 works: take in a function and an int list. Can call functions such as round, abs, 
--(*3) this will mult every elenent in the list by 3, (/10) this will divide every element in the list by 10, 
--(10/) this will divide 10 by every element in the list.
-- format on how to use it: map2 (*3) [1, 2, 3] will output [3, 6, 9]
-- map2 (/10) [1, 2, 3] will output [0.1, 0.2, 0.3]
-- map2 round [1.1, 2.2, 3.3] will output [1, 2, 3]
-- map2 abs [-1, 2, -3] will output [1, 2, 3]

-- mapHO does basically the same thing but does it in a higher order way
-- Format: mapHO abs [-1, 2, -3] will output [1, 2, 3]
-- mapHO round [1.1, 2.2, 3.3] will output [1, 2, 3]
-- mapHO (/10) [1, 2, 3] will output [0.1, 0.2, 0.3]
-- mapHO (*3) [1, 2, 3] will output [3, 6, 9]

--absHO does what abs was doing in the above functions, but uses higher order functions
-- Format: absHO [-1, 2, -3] will output [1, 2, 3]

--sum2 takes in an int list and outputs an int that is the sum of all the elements in the list
-- Format: sum2 [1, 2, 3] will output 6
-- sum2 [-1, -2, -3] will output -6
-- sum2 [1, -2, 3] will output 2 this is because Haskell added the list up like this: (1 + (-2 + (3 + 0)))

--sub2 does the same thing sum2 does except it subtracts every element in an int list
-- sub2 [1, -2, 3] will output 6
-- sub2 [1, 2, 3] will output 2

-- lambda functions aka anonymous functions:
-- lambda1 takes in a positive int or 0 and subs it into the equation that I defined in the code
-- Format: lambda1 2 will output 23
-- lambda1 0 will output 3

-- lambda1' takes in a list of ints and applys the equation to each number in the list
-- Format: lambda1' [1, 2, 3] outputs [8, 23, 48]
-- lambda1' [1, 2, -1] outputs [8, 23, 8]
-- lambda1' [-3] outputs [48]

-- modnum takes 2 positive ints or 0 as parameters and mods the first int by the second int
-- Format: modnum 5 5 outputs 0
-- modnum 2 3 outputs 2
-- modnum 0 2 outputs 0

--modlst takes in a list of tuples of 2 ints and mods the first int in the tuple by the second int in the tuple
-- Format: modlst [(8, 9), (0, 10), (-2, 3)] outputs [8, 0, 1]

-- upper takes in a string and outputs the string in uppercase letters
-- Format: upper "abs" outputs "ABS"
-- upper "a" outputs "A"
-- upper "A" outputs "A"
-- upper " " outputs " "


-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!NOTE TO NICK FOR README END !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- map2 takes a function f and applies it to the second parameter
-- we can use the built in map function from the Haskell library
-- to round, take absolute value, multiply, and divide, every element
-- in the input list. Since lists are mutable it adds the new
-- elements to a new list.
map2 :: (t -> a) -> [t] -> [a]
map2 f [] = []
map2 f (x:xs) = (f x):(map2 f xs)

-- mapHO uses the Haskell library to use map.
-- This function does the same thing as the function above
-- but it does it in a Higher-Order way
mapHO :: (a -> b) -> [a] -> [b]
mapHO = map

-- absHO uses the Haskell library to use map and abs functions.
-- This function does the same thing as using the map2 function,
-- but it does it in a higher-order way
absHO :: [Integer] -> [Integer]
absHO = map abs

-- sum2 takes in an int list and sum all the numbers together
sum2 :: Num p => [p] -> p
sum2 [] = 0
sum2 (x:xs) = x + (sum2 xs)

-- sum2 takes in an int list and subtracts all the numbers together
sub2 :: Num p => [p] -> p
sub2 [] = 0
sub2 (x:xs) = x - (sub2 xs)

-- These functions are lambda functions aka anonymous functions
-- some functions use the higher order function, map, to loop through
-- the input and apply the lambda function to each element

-- lambda1 takes in an int that the user inputs and outputs the result
-- This is just a simple math equation where x is the user input
lambda1 = (\x -> 5*(x)^2 + 3)
lambda1' = map (\x -> 5*(x)^2 + 3)

--modnum takes in two ints and mods the first input by the second input
modnum =  (\x y -> x `mod` y)

--modlst takes in a list of tuples of two ints and mods the first element in the tuple
-- by the second element and it will do this for all tuples in the list because
-- we are using the map function that will mod every element.
modlst = map (\(x, y) -> x `mod` y)

-- upper takes in a string and outputs the string in all uppercase letters
-- it does this by using the built-in functions map (to loop through the whole string)
-- and toUpper (which converts the letter to an uppercase letter)
upper = map (\x -> toUpper x)

-- This is the function that is run if the user decideds to run the program 
-- using the first method detailed in the README.
-- This main() function is a simple input/output from user 
main :: IO ()
main = do  
    let welcomeMessage = "Welcome to Fun-With-Haskell!"
    putStrLn welcomeMessage
    cyclicResponse

-- will continue so long as the program is running 
cyclicResponse :: IO()
cyclicResponse = do
    putStrLn "Select which tool to use:\n-Add\n-Subtract"   -- simple calculator menu
    userResp <- getLine                                     -- arrow notation used to get the user's response from the standard in
    let n = toUpperCase userResp                            -- helper function to convert the user's response to all capital case
    if n == "ADD" then addition                             -- if gates to filer user's response and call appropriate functions
    else if n == "SUBTRACT" then subtraction
    else putStrLn "Not a known command!" 

-- simple calculator:: ADDITION
-- when called this function will get user input 
addition :: IO()
addition = do 
    putStrLn "Enter first number:"
    x<-getLine                      -- gets user response for first int
    putStrLn "Get second number:"
    y<-getLine                      -- gets user response for second int
    let a = (read x::Int)           -- converts the String to an int
    let b = (read y::Int)           -- converts the String to an int
    print (a+b)                     -- prints to standard out the sum of the two passed in values

-- simple calculator:: SUBTRACTION
-- this function will get the user's input, convert the String input into an int; then 
-- gets the difference between the two 
subtraction :: IO()
subtraction = do 
    putStrLn "Enter first number:"     -- print to standard out prompt
    x<-getLine                         -- arrow notation to get the user's response 
    putStrLn "Get second number:"      -- print to standard out prompt 
    y<-getLine                         -- arrow notation to get the user's response
    let a = (read x::Int)              -- converts the String into an int 
    let b = (read y::Int)
    print (a-b)                        -- prints to standard out the difference of the two passed in values 

--------------------------------------------
-- REVERSE INTEGER ---
-- function that takes in an integer and reverses it using various mathematical
-- operations
reverseInteger :: Int -> Int 
reverseInteger num = reverseIntegerHelper num ((getNumberPlaces num 0)-1)

--Helper function that does the recursive call to reverse the integer
-- first the function checks to see if the number is 0; if it is, return the num variable passed in
-- if the number is not zero, then we recurse by "hacking" off the last portion of the integer and subtracting 
-- our x (which represents the total number of digits found in num) then multiplies this recursive call
-- by the `mod` 10 of the passed in num which will represent the first digit found in the num
reverseIntegerHelper :: Int -> Int -> Int
reverseIntegerHelper num x = 
    if num == 0 then num
    else reverseIntegerHelper (num `div` 10) (x - 1) + a *(10^x)
    where a = num `mod` 10

-- Helper function that counts and returns the total number of digits found in a passed 
-- in parameter 
getNumberPlaces :: Int -> Int -> Int 
getNumberPlaces num x =
    if num == 0 then x
    else getNumberPlaces (num `div` 10) (x+1) 

-------------------------------------------------
-- BASIC MADLIB --
--Madlib beginning prompt and response collector
-- The beginning of this function simply asks for user input then calls the specific madlib story dependent
-- on the user's response
madlibs :: IO()
madlibs = do
    putStrLn "What sort of story do you want (pick the number)?\n[1] Basic Story\n[2] Story of the Cute Dog"
    resp <- getLine
    if resp == "1" then madlibBasic
    else if resp == "2" then madlibDog
    else putStrLn "not a madlib"

-- The following two functions are very similiar, they are simply feeder functions
-- that open the correct keys and madlib text files dependent on the user's response
-- at the start of the program
-- IF USER CHOSE 1::
madlibDog :: IO()
madlibDog = do 
    madlibKey1 <- readLines "prompt2Key.txt"
    madlibBasicStory <- readLines "cuteDogMadlib.txt"
    userResponses <- getUserResponses madlibKey1 []
    putChar '\n'
    putStrLn "Here is your story!\n"
    displayStory madlibKey1 userResponses madlibBasicStory
-- IF USER CHOSE 2::
madlibBasic :: IO()
madlibBasic = do
    madlibKey1 <- readLines "prompt1Key.txt"
    madlibBasicStory <- readLines "madlibsBasicStory.txt"
    userResponses <- getUserResponses madlibKey1 []
    putChar '\n'
    putStrLn "Here is your story!\n"
    displayStory madlibKey1 userResponses madlibBasicStory

-- Helper function that reads all the lines in a given string and adds them to a list to be 
-- returned to the caller 
readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile   --fmap is a Haskell built in function that allows the programmer to add
-- a large amount of values to an array in a single line. Since data is immutable in Haskell, simply adding to an
-- array is not as simple as it is in other languages, so the use of build in Haskell functions like fmap allow
-- the programmer to not worry so much about these nuances.

-- function that demonstrates overloading:
-- function can either be called with an empty user input array 
-- or with an array of atleast one element 
getUserResponses :: [String]-> [String]-> IO[String]    -- takes in 2 string array, returns an IO string array
getUserResponses [] outL = return outL          -- the input array has become empty 
getUserResponses inL outL = do
    let pos = head inL                          -- get the first element of the input list
    let str = "Enter a: " ++ pos                -- display a prompt to the user
    putStrLn str                                
    resp <- getLine                             -- get the user's response from standard in 
    getUserResponses (tail inL) (outL ++ [resp])-- recurse and add the user's response to the beginning of output list

-- Function that takes in arrays taht hold the lines of the madlibs story as read in from 
-- files in the directory and an array that holds all of the user's responses. 
-- This function outputs the entire story with user's input to standard out 
displayStory :: [String] -> [String] -> [String] -> IO ()
displayStory [] [] [] = putStrLn ""
displayStory key resp story = do
    let insertResp = head resp                  -- gets the head of the User's Response (first element)
    let regex = head key                        -- Will be the regex used to replace in the story string
    let line = head story                       -- the entire line in the mad libs story
    let frontHalf = getFrontHalf line ""        -- funtion that gets the front half of a <> statement
    let backHalf = getBackHalf line "" False    -- function that gets the back half of a <> statement 
    let wholeLine = frontHalf ++ insertResp ++ backHalf  -- String concatenation in Haskell
    putStrLn wholeLine                          -- print the entire line with user's response
    displayStory (tail key) (tail resp) (tail story)    --recurse the rest of the lines 


-- Helper function that searches for the last instnace of the ">" character in a string.
-- This chracter is used internally as an indicator to the beginning of the section of the
-- story line the follows a part of speech prompt to the user 
getBackHalf :: String -> String -> Bool ->String
getBackHalf line new found = 
    if null line then new     -- base case: string is empty
    else do
        if found then getBackHalf (tail line) (new ++ [head line]) found   -- found the ">" character, build the new string to return 
        else do 
            let x = head line                   -- gets the first character in a string 
            if x == '>' then getBackHalf(tail line) new True  -- checks to see if that character is the ">"
            else getBackHalf(tail line) new False       -- recurse; we did not find the character 

-- Helper function that finds and returns the FRONT half of a given string representing 
-- a single line in a Madlib story. This method scans each character looking for the "<" character
-- which indicates that the first half of the Madlib story line has been built and can be returned 
getFrontHalf :: String -> String-> String 
getFrontHalf line new = 
    if length(line) == 0 then new      -- scanned the entire line without finding the "<" character
    else if head line == '<' then new  -- found the "<" character, return the buil String 
    else getFrontHalf (tail line) (new ++ [head line])  -- recurse with one less character being removed from the 
                                                        -- beginning of the string 

-- quick function that converts a string to Uppercase 
toUpperCase :: String -> String
toUpperCase = map toUpper           -- Uses Haskell map function with its built in toUpper function
                                    -- which gets each character in a string, converts it to upper case
                                    -- and saves it as a new string 
