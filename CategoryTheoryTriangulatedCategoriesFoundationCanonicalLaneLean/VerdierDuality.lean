import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure VerdierDuality (C D : TriangulatedCategory) where
  leftAdjoint : TriangulatedFunctor C D
  rightAdjoint : TriangulatedFunctor D C
  adjunctionIso : ∀ (A : C.obj) (B : D.obj),
    D.morphism (leftAdjoint.objectMap A) B ≅ C.morphism A (rightAdjoint.objectMap B)
  dualityIsomorphism : TriangulatedFunctor C C

structure VerdierDualityPackage (C D : TriangulatedCategory) where
  duality : VerdierDuality C D
  coherenceCondition : Prop
  coherenceConditionSatisfied : coherenceCondition

structure VerdierDualityEvidence {C D : TriangulatedCategory}
    (P : VerdierDualityPackage C D) where
  adjunctionIsoClosed : ∀ (A : C.obj) (B : D.obj),
    D.morphism (P.duality.leftAdjoint.objectMap A) B ≅ C.morphism A (P.duality.rightAdjoint.objectMap B)
  coherenceConditionClosed : P.coherenceCondition

def VerdierDualityClosed {C D : TriangulatedCategory}
    (P : VerdierDualityPackage C D) : Prop :=
  P.coherenceCondition

theorem verdier_duality_closed_from_evidence {C D : TriangulatedCategory}
    (P : VerdierDualityPackage C D) (E : VerdierDualityEvidence P) :
    VerdierDualityClosed P := by
  exact E.coherenceConditionClosed

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse
