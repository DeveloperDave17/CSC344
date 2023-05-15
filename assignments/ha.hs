-------------------------------------------------------------------------
--- ha.hs houses task 2 of the haskell assignment

-------------------------------------------------------------------------
--- squareArea :: takes one real number representing the side length
--- of a square and returns the area of the square with the given side
--- length

squareArea x = x * x

-------------------------------------------------------------------------
--- circleArea :: takes one real number representing the radius of a circle
--- and returns the corresponding circles area

circleArea r = pi * r ^ 2

-------------------------------------------------------------------------
--- blueAreaOfCube :: takes the length of one edge of the cube and computes
--- the area of the cube that is equivalent to the cube's area minus a 
--- centered dots area ( on each side of the cube )
--- with a radius 1/4 the edges length.

blueAreaOfCube el = (6 * el ^ 2) - (6 * pi * ( el / 4 ) ^ 2)


-------------------------------------------------------------------------
--- paintedCube1 :: takes the order of a n by n by n cube where n is 
--- equal to order and returns the number of cubes that are painted once
--- when the entire cube is painted

paintedCube1 order = if order < 3 then 0 else 6 * (( order - 2 ) ^ 2)

-------------------------------------------------------------------------
--- paintedCube2 :: takes the order of a n by n by n cube where n is equal
--- to order and returns the number of cubes that are painted twice when the
--- entire cube is painted

paintedCube2 order = if order < 3 then 0 else 12 * ( order - 2 )

-------------------------------------------------------------------------
--- reverseWords :: reverses the words of a string

reverseWords wordString = unwords ( reverse ( words wordString ) )

-------------------------------------------------------------------------
--- averageWordLength :: takes a string of words and returns the average
--- word length

averageWordLength wordString = fromIntegral ( sum letterCountList ) /  fromIntegral wordCount 
    where wordList = words wordString
          wordCount = length wordList
          letterCountList = map length wordList

-------------------------------------------------------------------------
--- list2set :: takes a list and turns it into a set

list2set l = if (length l) == 0 then [] else (if elem (head l) set then set else (head l) : set)
    where set = list2set(tail l)

-------------------------------------------------------------------------
--- isPalindrome :: checks to see if a list is a palindrome

isPalindrome l = if (length l) < 2 then True else (if (head l) == (last l) then (isPalindrome (tail (init l))) else False)

-------------------------------------------------------------------------
--- collatz :: takes a number as an input and generates a list containing
--- the corresponding collatz sequence

collatz :: Integer -> [Integer]
collatz num = if num == 1 then [1] else ( num : l )
    where nextNum = if ( rem num 2 ) == 0 then (div num 2) else (3 * num + 1)
          l = ( collatz nextNum )

-------------------------------------------------------------------------
--- count :: takes an object and a list of objects then returns the amount
--- of times the object appears within the list.

--count object [] = 0
--count object objects = if object == (head objects) then (count object (tail objects)) + 1
                       --else (count object (tail objects))

count object objects = length [ x | x <- objects, x == object]

-------------------------------------------------------------------------
--- freqTable :: takes a list of objects and returns a list of ordered
--- pairs each consisting of an element of the list together with the number
--- of times it occured

--freqTable objects = zip (list2set objects) (map (\x -> count x objects) (list2set objects))

freqTable objects = [ (x,y) | x <- (list2set objects), y <- [(count x objects)]]

-------------------------------------------------------------------------
--- tgl :: takes a positive Int and returns the triangular number
--- corresponding to the given Int.

tgl posInt = foldl (+) 0 [1..posInt]

-------------------------------------------------------------------------
--- triangleSequence :: takes a positive Int and returns a list of triangular
--- numbers from 1 to the given number

triangleSequence posInt = map (tgl) [1..posInt]

-------------------------------------------------------------------------
--- vowelCount :: takes a string of lower case letters and returns the number
--- of lowercase vowels that appear in the string

vowelCount str = length (filter (\x -> (x == 'a' || x == 'e' || x == 'i' || 
                                        x == 'o' || x == 'u')) str)

-------------------------------------------------------------------------
--- lcsim :: takes a function for mapping, a predicate for filtering, and
--- a list of elements and returns the same value as:
--- [f x | x <- xs, p x]

lcsim mapFunc pred elems = map (mapFunc) (filter (pred) elems)
