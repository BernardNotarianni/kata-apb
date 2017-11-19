import Test.Hspec

data Etudiant  = Etudiant  String deriving (Show, Eq)
data Formation = Formation String deriving (Show, Eq)


distribue :: [ a ] -> [ b ] -> [ (a,b) ]
distribue a [] = []
distribue a b =
  dist a b
  where
    dist [] x = []
    dist x [] = dist x b
    dist (xh : xt ) ( yh : yt ) = (xh, yh) : dist xt yt


apb :: [ Etudiant ] -> [ Formation ] -> [ (Etudiant, Formation) ]
apb etudiants formations =
  distribue etudiants formations


main = hspec $ do
  describe "apb" $ do

    it "distribue deux listes comme deux jeux de cartes" $ do
      distribue [1,2] [3] `shouldBe` [(1,3), (2,3)]
      distribue [1] [2,3] `shouldBe` [(1,2)]
      distribue ([] :: [Int]) [2,3] `shouldBe` []
      distribue [1]  ([] :: [Int]) `shouldBe` []
      distribue [1,2,3] [4,5,6] `shouldBe`
        [(1,4),
         (2,5),
         (3,6)]
      distribue [1,2,3] [4,5] `shouldBe`
        [(1,4),
         (2,5),
         (3,4)]

    it "reparti les etudiants sur les formations" $ do
      apb [e1,e2,e3] [f1, f2] `shouldBe`
        [(e1,f1),
         (e2,f2),
         (e3,f1)]
      where
        e1 = Etudiant "Jeanne"
        e2 = Etudiant "Mathilde"
        e3 = Etudiant "Sophie"
        f1 = Formation "Informatique"
        f2 = Formation "Histoire"
