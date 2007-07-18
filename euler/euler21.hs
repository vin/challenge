factors n = factors' 2 n
	where 
	factors' k n | k*k > n = [1]
                     | n `mod` k == 0 =  k : n `div` k : factors' (k+1) n
                     | otherwise = factors' (k+1) n

d = sum . factors 

amicable =  filter (\n -> (d n /= n) &&  (d (d n) == n)) [1..]

main = do
	print $ takeWhile (<10000) amicable
	print $ takeWhile (<10000) amicable
	print $ sum $ takeWhile (<10000) amicable
