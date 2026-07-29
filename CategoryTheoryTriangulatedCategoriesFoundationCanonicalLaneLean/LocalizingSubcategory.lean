import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure LocalizingSubcategoryPackage {C : TriangulatedCategoryPackage} where
  subcategory : Set C.Obj
  closedUnderShifts : Prop
  closedUnderDirectSums : Prop
  closedUnderTriangles : Prop
  isLocalizing : Prop

structure LocalizingSubcategoryEvidence {C : TriangulatedCategoryPackage}
    (L : LocalizingSubcategoryPackage C) where
  closedUnderShiftsClosed : L.closedUnderShifts
  closedUnderDirectSumsClosed : L.closedUnderDirectSums
  closedUnderTrianglesClosed : L.closedUnderTriangles
  isLocalizingClosed : L.isLocalizing

def LocalizingSubcategoryClosed {C : TriangulatedCategoryPackage}
    (L : LocalizingSubcategoryPackage C) : Prop :=
  L.closedUnderShifts ∧ L.closedUnderDirectSums ∧ L.closedUnderTriangles ∧ L.isLocalizing

theorem localizing_subcategory_closed_from_evidence
    {C : TriangulatedCategoryPackage} (L : LocalizingSubcategoryPackage C)
    (E : LocalizingSubcategoryEvidence L) : LocalizingSubcategoryClosed L := by
  exact And.intro E.closedUnderShiftsClosed
    (And.intro E.closedUnderDirectSumsClosed
      (And.intro E.closedUnderTrianglesClosed E.isLocalizingClosed))

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse