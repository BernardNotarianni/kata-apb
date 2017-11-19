import Test.Hspec

data Formation = Formation { nom_formation ::String
                           , note_minimum :: Int
                           }
  deriving (Show, Eq)

data Etudiant  = Etudiant  { nom_etudiant :: String
                           , choix :: Formation
                           , note :: Int
                           }
  deriving (Show, Eq)


apb :: [ Etudiant ] -> [ Formation ] -> Formation -> [ (Etudiant, Formation) ]
apb [] _ _ = []
apb ( e : autres) formations defaut
  | note e >= note_minimum (choix e) = (e, choix e) : autres_affectations
  | otherwise = (e, defaut) : autres_affectations
  where
    autres_affectations = apb autres formations defaut


main = hspec $ do
  describe "apb" $ do

    it "donne la formation demandee si note suffisante" $ do
      apb [e1,e2,e3] [f1, f2] defaut `shouldBe`
        [(e1,f1),
         (e2,f2),
         (e3,defaut)]
      where
        f1 = Formation { nom_formation="Informatique", note_minimum=18}
        f2 = Formation { nom_formation="Histoire",     note_minimum=16}
        e1 = Etudiant {nom_etudiant="Jeanne",   choix=f1, note=18}
        e2 = Etudiant {nom_etudiant="Mathilde", choix=f2, note=17}
        e3 = Etudiant {nom_etudiant="Sophie",   choix=f2, note=8}
        defaut = Formation { nom_formation="Mathematique", note_minimum=18}
