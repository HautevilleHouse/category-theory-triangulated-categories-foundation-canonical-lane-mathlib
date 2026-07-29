import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.TriangulatedCategoryStructure
import HautevilleHouse.CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.DistinguishedTriangleEvidence

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedFunctor (C D : Type u) [Category C] [Category D] (shiftC : C ⥤ C) (shiftD : D ⥤ D) (F : C ⥤ D) where
  commutesWithShift : shiftD.comp F = F.comp shiftC
  preservesDistinguished : ∀ (T : Triangle C), T ∈ (distinguishedTriangles C) → (mapTriangle F T) ∈ (distinguishedTriangles D)

structure TriangulatedFunctorEvidence (C D : Type u) [Category C] [Category D] (shiftC : C ⥤ C) (shiftD : D ⥤ D) (F : C ⥤ D) (TF : TriangulatedFunctor C D shiftC shiftD F) where
  commutesWithShiftClosed : TF.commutesWithShift
  preservesDistinguishedClosed : TF.preservesDistinguished

def FunctorClosed (TF : TriangulatedFunctor C D shiftC shiftD F) : Prop :=
  TF.commutesWithShift ∧ TF.preservesDistinguished

theorem functor_closed_from_evidence (E : TriangulatedFunctorEvidence C D shiftC shiftD F TF) : FunctorClosed TF :=
  And.intro E.commutesWithShiftClosed E.preservesDistinguishedClosed

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse