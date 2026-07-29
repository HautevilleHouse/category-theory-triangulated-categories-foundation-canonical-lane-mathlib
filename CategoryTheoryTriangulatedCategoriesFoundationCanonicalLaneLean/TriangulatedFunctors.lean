import HautevilleHouse.CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.TriangulatedCategoryAxioms

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedFunctorPackage (C D : TriangulatedCategoryPackage) where
  mapObject : C.objects → D.objects
  mapMorphism : ∀ {X Y : C.objects}, C.morphisms X Y → D.morphisms (mapObject X) (mapObject Y)
  shiftCommutes : ∀ X : C.objects, mapObject (C.shift X) = D.shift (mapObject X)
  trianglePreserving : Prop

structure TriangulatedFunctorEvidence {C D : TriangulatedCategoryPackage}
    (F : TriangulatedFunctorPackage C D) where
  shiftCommutesClosed : F.shiftCommutes
  trianglePreservingClosed : F.trianglePreserving

def TriangulatedFunctorClosed {C D : TriangulatedCategoryPackage}
    (F : TriangulatedFunctorPackage C D) : Prop :=
  F.shiftCommutes ∧ F.trianglePreserving

theorem triangulated_functor_closed_from_evidence {C D : TriangulatedCategoryPackage}
    (F : TriangulatedFunctorPackage C D) (E : TriangulatedFunctorEvidence F) :
    TriangulatedFunctorClosed F := by
  exact And.intro E.shiftCommutesClosed E.trianglePreservingClosed

end HautevilleHouse.CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse