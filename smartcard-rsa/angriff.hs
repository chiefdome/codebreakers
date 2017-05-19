-- |
-- Copyright:  (c) 2017 Ertugrul Söylemez
-- License:    BSD3
-- Maintainer: Ertugrul Söylemez <esz@posteo.de>

module Main (main) where


modExp :: Integer -> Integer -> Integer -> Integer
modExp n = go 1
    where
    go y _ 0 = y
    go y x e
        | even e    = go y             x2 (e `div` 2)
        | otherwise = go (y*x `mod` n) x2 (e `div` 2)
        where
        x2 = x*x `mod` n


smartcardBrute :: [Integer]
smartcardBrute =
    filter (> 1) .
    map (\x -> gcd n (x - 2)) .
    iterate (\x -> mod (x*x0) n) $
    1

    where
    x0 = modExp n 2 e

    n = 75489763393055314128289985760068186621492280562287920094260074153209517236970341572518559797153344946557614545420102689128360149448826277159732843552885090712289384951797592094776916869951359415795387573058732394347634041226477604151022089442263032171551224119059291246759481118626066831025730728959763973939
    e = 46933839936513203806814534785430440399121060041961563534238921289223215886833155748923329942768184793127030357335234488752951998951952300752961654791044921714986192071286036662233822586116573773834895955581767885885461402578281187712069245154703440996167817002215606658260574029353837097272922247982958120199
    y = 17303115588385783231855542914594436033706210611592142994148195847161380369694148898294321316619889161465646741342622951747792020391919396377166600390042691916460332038663202841616005426744660399537915742224300757610350068952082197457369985659556824400134147883343181884291377763582387957067404145280221333702


main :: IO ()
main = print (take 1 smartcardBrute)
