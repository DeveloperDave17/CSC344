-------------------------------------------------------------------------
--- File: npvi.hs
-------------------------------------------------------------------------

-------------------------------------------------------------------------
--- Test data

a :: [Int]
a = [2,5,1,3]

b :: [Int]
b = [1,3,6,2,5]

c :: [Int]
c = [4,4,2,1,1,2,2,4,4,8]

u :: [Int]
u = [2,2,2,2,2,2,2,2,2,2]

x :: [Int]
x = [1,9,2,8,3,7,2,8,1,9]

-------------------------------------------------------------------------
--- pairwiseValues

pairwiseValues :: [Int] -> [(Int,Int)]
pairwiseValues listOfInts = zip (init listOfInts) (tail listOfInts)

-------------------------------------------------------------------------
--- pairwiseDifferences

pairwiseDifferences :: [Int] -> [Int]
pairwiseDifferences listOfElements = map (\(x,y) -> x - y ) (pairwiseValues listOfElements)

-------------------------------------------------------------------------
--- pairwiseSums

pairwiseSums :: [Int] -> [Int]
pairwiseSums listOfElements = map (\(x,y) -> x + y ) (pairwiseValues listOfElements)

-------------------------------------------------------------------------
--- half

half :: Int -> Double
half number = ( fromIntegral number ) / 2

-------------------------------------------------------------------------
--- pairwiseHalves

pairwiseHalves :: [Int] -> [Double]
pairwiseHalves numbers = map (half) numbers

-------------------------------------------------------------------------
--- pairwiseHalfSums

pairwiseHalfSums :: [Int] -> [Double]
pairwiseHalfSums numbers = pairwiseHalves ( pairwiseSums numbers )

-------------------------------------------------------------------------
--- pairwiseTermPairs

pairwiseTermPairs :: [Int] -> [(Int,Double)]
pairwiseTermPairs numbers = zip (pairwiseDifferences numbers) (pairwiseHalfSums numbers)

-------------------------------------------------------------------------
--- term

term :: (Int,Double) -> Double
term ndPair = abs (fromIntegral ( fst ndPair ) / ( snd ndPair ) )

-------------------------------------------------------------------------
--- pairwiseTerms

pairwiseTerms :: [Int] -> [Double]
pairwiseTerms numbers = map (term) (pairwiseTermPairs numbers)

-------------------------------------------------------------------------
--- nPVI

nPVI :: [Int] -> Double
nPVI xs = normalizer xs * sum ( pairwiseTerms xs )
    where normalizer xs = 100 / fromIntegral ( (length xs ) - 1 )