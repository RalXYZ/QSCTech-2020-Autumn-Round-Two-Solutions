import Data.Set as Set

data Foo = Foo {lSet :: Set Foo, rSet :: Set Foo}
    deriving (Show)

instance Eq Foo where
    x == y = ((lSet x) == (lSet y)) && ((rSet x) == (rSet y))

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

