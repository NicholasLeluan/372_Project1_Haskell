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

-- defines functions for higher order functions 
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
