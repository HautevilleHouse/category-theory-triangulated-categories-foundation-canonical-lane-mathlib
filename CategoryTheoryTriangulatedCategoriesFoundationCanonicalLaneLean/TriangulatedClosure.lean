import HautevilleHouse.CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

def TriangulatedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem triangulated_endgame (A : AdmissibleClass) :
    TriangulatedClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse