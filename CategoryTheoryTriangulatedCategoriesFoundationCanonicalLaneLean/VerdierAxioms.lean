import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.TriangulatedStructure

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure VerdierAxioms (T : TriangulatedCategory) where
  TR1 : ∀ X : T.obj, Triangle.mk X X (0 : T.mor) ∈ T.distinguishedTriangles
  TR2 : ∀ (t : Triangle T.obj T.mor), t ∈ T.distinguishedTriangles → t.rotate ∈ T.distinguishedTriangles
  TR3 : ∀ (t u : Triangle T.obj T.mor) (f : t.X → u.X) (g : t.Y → u.Y), t ∈ T.distinguishedTriangles → u ∈ T.distinguishedTriangles → CommutativeSquare f g (t.mor) (u.mor) → ∃ h : t.Z → u.Z, CommutativeSquare g h (t.ZMor) (u.ZMor)
  TR4 : T.octahedralAxiom

structure VerdierAxiomsEvidence (T : TriangulatedCategory) (V : VerdierAxioms T) where
  TR1Closed : V.TR1
  TR2Closed : V.TR2
  TR3Closed : V.TR3
  TR4Closed : V.TR4

def VerdierAxiomsClosed (T : TriangulatedCategory) (V : VerdierAxioms T) : Prop :=
  V.TR1 ∧ V.TR2 ∧ V.TR3 ∧ V.TR4

theorem verdier_axioms_closed_from_evidence (T : TriangulatedCategory) (V : VerdierAxioms T) (E : VerdierAxiomsEvidence T V) : VerdierAxiomsClosed T V := by
  exact And.intro E.TR1Closed (And.intro E.TR2Closed (And.intro E.TR3Closed E.TR4Closed))

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse