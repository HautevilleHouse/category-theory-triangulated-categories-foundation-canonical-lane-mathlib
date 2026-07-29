import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

def ConstrainedTriangulatedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_triangulated_endgame (A : AdmissibleClass) :
    ConstrainedTriangulatedClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse
