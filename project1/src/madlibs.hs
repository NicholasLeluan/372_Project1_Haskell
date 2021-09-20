import System.IO
 
 -- adding user input is kinda finickey; so we will need to come up with a 
 -- way to store values recursively in an order that we can use to add to a
 -- madlibs game 

main :: IO ()
main = do  
    foo <- putStrLn "Hello, what's your name?"  
    name <- getLine  
    let prompts = ["prompt1","promp2","prompt3"]
    -- can have 2 or 3 stories; this can filter by user response 
    if name == "1" then myFunc prompts else testLib name


myFunc :: [String]->IO()
myFunc = mapM_ putStrLn

testLib :: String -> IO()
testLib a = putStrLn ("Hello " ++ a ++ " from prompt")