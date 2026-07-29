import canonicalLaneMathlib.TriangulatedFunctor

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedEquivalence (C D : TriangulatedCategory) where
  forward : TriangulatedFunctor C D
  backward : TriangulatedFunctor D C
  unitIso : ...
  counitIso : ...

structure TriangulatedEquivalenceEvidence {C D : TriangulatedCategory} (E : TriangulatedEquivalence C D) where
  forwardClosed : TriangulatedFunctorClosed E.forward
  backwardClosed : TriangulatedFunctorClosed E.backward
  unitIsoClosed : ...
  counitIsoClosed : ...

def TriangulatedEquivalenceClosed {C D : TriangulatedCategory} (E : TriangulatedEquivalence C D) : Prop :=
  TriangulatedFunctorClosed E.forward ∧ TriangulatedFunctorClosed E.backward ∧ ...

theorem triangulated_equivalence_closed_from_evidence {C D : TriangulatedCategory} (E : TriangulatedEquivalence C D) (Ev : TriangulatedEquivalenceEvidence E) : TriangulatedEquivalenceClosed E := by
  exact And.intro Ev.forwardClosed (And.intro Ev.backwardClosed (And.intro Ev.unitIsoClosed Ev.counitIsoClosed))

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse