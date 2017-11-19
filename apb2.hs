import Test.Hspec

data Formation = Formation String deriving (Show, Eq)
data Etudiant  = Etudiant  { nom :: String
                           , choix :: Formation
                           }
  deriving (Show, Eq)


apb :: [ Etudiant ] -> [ Formation ] -> [ (Etudiant, Formation) ]
apb [] _ = []
apb ( e : autres) formations =
  (e, choix e) : apb autres formations


main = hspec $ do
  describe "apb" $ do

    it "donne a chaque etudiante la formation qu'elle demande" $ do
      apb [e1,e2,e3] [f1, f2] `shouldBe`
        [(e1,f1),
         (e2,f2),
         (e3,f2)]
      where
        f1 = Formation "Informatique"
        f2 = Formation "Histoire"
        e1 = Etudiant {nom="Jeanne",   choix=f1}
        e2 = Etudiant {nom="Mathilde", choix=f2}
        e3 = Etudiant {nom="Sophie",   choix=f2}
