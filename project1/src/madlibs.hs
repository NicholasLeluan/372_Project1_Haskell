--for testing purposes
import System.IO
--import System.Process (StdStream(Inherit))
import Data.Char
import GHC.Float.RealFracMethods (roundFloatInt)
--import Distribution.SPDX.LicenseId (LicenseId(D_FSL_1_0))
import GHC.Exts (inline)
import Text.Show (Show)
--import Data.Text.Lazy (splitOn)
--import Distribution.Simple.PackageIndex (insert)

-- Runs once when the program is started
main :: IO ()
main = do  
    let welcomeMessage = "Welcome to Fun-With-Haskell!"
    putStrLn welcomeMessage
    cyclicResponse

-- will continue so long as the program is running 
cyclicResponse :: IO()
cyclicResponse = do
    putStrLn "Select which tool to use:\n-Add\n-Subtract"
    userResp <- getLine 
    let n = toUpperCase userResp
    if n == "ADD" then addition
    else if n == "SUBTRACT" then subtraction
    else putStrLn "Not a known command!" 

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

subtraction :: IO()
subtraction = do 
    putStrLn "Enter first number:"
    x<-getLine 
    putStrLn "Get second number:"
    y<-getLine
    let a = (read x::Int)
    let b = (read y::Int)
    print (a-b)        

--------------------------------------------
-- REVERSE INTEGER ---
-- function that takes in an integer and reverses it using various mathematical
-- operations
reverseInteger :: Int -> Int 
reverseInteger num = reverseIntegerHelper num ((getNumberPlaces num 0)-1)

reverseIntegerHelper :: Int -> Int -> Int
reverseIntegerHelper num x = 
    if num == 0 then num
    else reverseIntegerHelper (num `div` 10) (x - 1) + a *(10^x)
    where a = num `mod` 10

getNumberPlaces :: Int -> Int -> Int 
getNumberPlaces num x =
    if num == 0 then x
    else getNumberPlaces (num `div` 10) (x+1) 

-------------------------------------------------
-- BASIC MADLIB --
madlibs :: IO()
madlibs = do
    putStrLn "What sort of story do you want (pick the number)?\n[1] Basic Story\n[2] Story of the Cute Dog"
    resp <- getLine
    if resp == "1" then madlibBasic
    else putStrLn "not a madlib"

madlibBasic :: IO()
madlibBasic = do
    madlibKey1 <- readLines "prompt1Key.txt"
    madlibBasicStory <- readLines "madlibsBasicStory.txt"
    userResponses <- getUserResponses madlibKey1 []
    putChar '\n'
    putStrLn "Here is your story!\n"
    displayStory madlibKey1 userResponses madlibBasicStory

readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile

-- function that demonstrates overloading
getUserResponses :: [String]-> [String]-> IO[String]    -- takes in 2 string array, returns an IO string array
getUserResponses [] outL = return outL          -- the input array has become empty 
getUserResponses inL outL = do
    let pos = head inL                          -- get the first element of the input list
    let str = "Enter a: " ++ pos                -- display a prompt to the user
    putStrLn str                                
    resp <- getLine                             -- get the user's response from standard in 
    getUserResponses (tail inL) (outL ++ [resp])-- recurse and add the user's response to the beginning of output list

displayStory :: [String] -> [String] -> [String] -> IO ()
displayStory [] [] [] = putStrLn ""
displayStory key resp story = do
    let insertResp = head resp                  -- gets the head of the User's Response (first element)
    let regex = head key                        -- Will be the regex used to replace in the story string
    let line = head story                       -- the entire line in the mad libs story
    let frontHalf = getFrontHalf line "" 
    let backHalf = getBackHalf line "" False 
    let wholeLine = frontHalf ++ insertResp ++ backHalf
    putStrLn wholeLine
    displayStory (tail key) (tail resp) (tail story)

getBackHalf :: String -> String -> Bool ->String
getBackHalf line new found = 
    if null line then new
    else do
        if found then getBackHalf (tail line) (new ++ [head line]) found
        else do 
            let x = head line
            if x == '>' then getBackHalf(tail line) new True
            else getBackHalf(tail line) new False

getFrontHalf :: String -> String-> String 
getFrontHalf line new = 
    if length(line) == 0 then new
    else if head line == '<' then new
    else getFrontHalf (tail line) (new ++ [head line])

toUpperCase :: String -> String
toUpperCase = map toUpper

myFunc :: [String]->IO()
myFunc = mapM_ putStrLn

testLib :: String -> IO()
testLib a = putStrLn ("Hello " ++ a ++ " from prompt")