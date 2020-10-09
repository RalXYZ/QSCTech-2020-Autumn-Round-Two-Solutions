import Data.Set as Set

data Foo = Foo {lSet :: Set Foo, rSet :: Set Foo}
    deriving (Show)


instance Eq Foo where
    x == y = (x <= y) && (y <= x)

instance Ord Foo where
    x <= y = if ((Set.size (lSet x)) == 0 && (Set.size (rSet y)) == 0)
                then True 
                else (
                    if ((Set.size (lSet x)) == 0) 
                    then (Set.findMin (rSet y) > x)
                    else (
                        if ((Set.size (rSet y)) == 0) 
                        then (Set.findMax (lSet x) < y)
                        else (
                            (Set.findMax (lSet x) < y) && (Set.findMin (rSet y) > x)
                        )
                    )
                )

instance Num Foo where
    (+) x y = Foo (Set.union (Set.map (+y) (lSet x)) (Set.map (+x) (lSet y))) (Set.union (Set.map (+y) (rSet x)) (Set.map (+x) (rSet y)))
    (negate) x = Foo (Set.map (negate) (rSet x)) (Set.map (negate) (lSet x))
    (abs) x = if (x >= (Foo Set.empty Set.empty))
                then x
                else -x
    
    -- 顺便实现了个加法逆元和绝对值...反正挺好实现的

{-
instance Show Foo where
    show foo = "{" +  + "}"
    -}