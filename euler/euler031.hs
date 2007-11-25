-- denominations = [ 1,2,5,10,20,50,100,200 ]
denominations = [ 200, 100, 50, 20, 10, 5, 2, 1]

change :: Integer -> [Integer] -> [[Integer]]
change 1 _ = [[1]]
change _ [] = []
change 0 _ = []
change n denominations = 
	concatMap (\d -> map (\x -> d:x) (change (n-d) denominations) ++ change d denominations) (filter (<=n) denominations)

{--

change 1 = [[1]]
change 2 = [[2],[1,1]]
change 3 = [[2,1],[1,1,1]]
change 4 = [[2,2],[2,1,1],[1,1,1,1]]
change 5 = [[5],[2,2,1],[2,1,1,1],[1,1,1,1,1]]

}
