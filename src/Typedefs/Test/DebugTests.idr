module Typedefs.Test.DebugTests

-- specdris
import Specdris.Spec

import Typedefs.Names
import Typedefs.Test
import Typedefs.Typedefs

%access public export

testSuite : IO ()
testSuite = spec $ do

  describe "TNamed debug tests:" $ do

    it "prints correctly the AST for bit" $
      debugTNamed bit
        `Expectations.shouldBe` "TName (\"Bit\", TSum [T1, T1])"

    it "prints correctly the AST for byte" $
      debugTNamed byte
        `Expectations.shouldBe` "TName (\"Byte\", TProd [TApp (TName (\"Bit\", TSum [T1, T1]), []), TApp (TName (\"Bit\", TSum [T1, T1]), []), TApp (TName (\"Bit\", TSum [T1, T1]), []), TApp (TName (\"Bit\", TSum [T1, T1]), []), TApp (TName (\"Bit\", TSum [T1, T1]), []), TApp (TName (\"Bit\", TSum [T1, T1]), []), TApp (TName (\"Bit\", TSum [T1, T1]), []), TApp (TName (\"Bit\", TSum [T1, T1]), [])])"

    it "prints correctly the AST for maybe" $
      debugTNamed maybe
        `Expectations.shouldBe` "TName (\"Maybe\", TSum [T1, TVar 0])"

    it "prints correctly the AST for bar" $
      debugTNamed bar
        `Expectations.shouldBe` "TName (\"Bar\", TProd [TVar 1, TVar 0])"

    it "prints correctly the AST for foo" $
      debugTNamed foo
        `Expectations.shouldBe` "TName (\"Foo\", TApp (TName (\"Bar\", TProd [TVar 1, TVar 0]), [TProd [TVar 1, TVar 2], TVar 0]))"

    it "prints correctly the AST for list" $
      debugTNamed list
        `Expectations.shouldBe` "TName (\"List\", TMu [(\"Nil\", T1), (\"Cons\", TProd [TVar 1, TVar 0])])"

    it "prints correctly the AST for maybe2" $
      debugTNamed maybe2
        `Expectations.shouldBe` "TName (\"Maybe2\", TMu [(\"Nothing\", T1), (\"Just\", TVar 1)])"

    it "prints correctly the AST for nat" $
      debugTNamed nat
        `Expectations.shouldBe` "TName (\"Nat\", TMu [(\"Z\", T1), (\"S\", TVar 0)])"

    it "prints correctly the AST for listNat" $
      debugTNamed listNat
        `Expectations.shouldBe` "TName (\"ListNat\", TMu [(\"NilN\", T1), (\"ConsN\", TProd [TApp (TName (\"Nat\", TMu [(\"Z\", T1), (\"S\", TVar 0)]), []), TVar 0])])"

    it "prints correctly the AST for FRef" $
      debugTNamed (TName "NatRef" $ FRef {n=0} "nat")
        `Expectations.shouldBe` "TName (\"NatRef\", FRef \"nat\")"
