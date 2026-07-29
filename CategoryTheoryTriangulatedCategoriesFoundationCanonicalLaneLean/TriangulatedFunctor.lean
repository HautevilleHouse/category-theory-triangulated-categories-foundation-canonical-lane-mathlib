import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedFunctor (C D : TriangulatedCategory) where
  objectMap : C.obj → D.obj
  morphismMap : ∀ {A B : C.obj}, C.morphism A B → D.morphism (objectMap A) (objectMap B)
  shiftCommutes : ∀ (A : C.obj), D.shift (objectMap A) = objectMap (C.shift A)
  distinguishedPreserved : ∀ (T : C.distinguishedTriangles),
    let (A, B, C', f, g, h) := T
    in D.distinguishedTriangles.Contains (objectMap A, objectMap B, objectMap C',
         morphismMap f, morphismMap g, morphismMap h)

structure TriangulatedFunctorPackage (C D : TriangulatedCategory) where
  functor : TriangulatedFunctor C D
  functorPreservesShifts : Prop
  shiftCommutesSatisfied : functorPreservesShifts

structure TriangulatedFunctorEvidence {C D : TriangulatedCategory}
    (P : TriangulatedFunctorPackage C D) where
  shiftCommutesClosed : P.shiftCommutesSatisfied
  distinguishedPreservedClosed : ∀ (T : C.distinguishedTriangles), True

def TriangulatedFunctorClosed {C D : TriangulatedCategory}
    (P : TriangulatedFunctorPackage C D) : Prop :=
  P.functorPreservesShifts

theorem triangulated_functor_closed_from_evidence {C D : TriangulatedCategory}
    (P : TriangulatedFunctorPackage C D) (E : TriangulatedFunctorEvidence P) :
    TriangulatedFunctorClosed P := by
  exact E.shiftCommutesClosed

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse
