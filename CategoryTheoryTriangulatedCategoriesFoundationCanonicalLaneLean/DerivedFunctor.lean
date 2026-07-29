import .TriangulatedCategoryFoundation

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure DerivedFunctorPackage (F : TriangulatedCategoryFoundation) where
  derivedCategory : Type u
  derivedShift : derivedCategory ⥤ derivedCategory
  derivedDistinguishedTriangles : Set (derivedCategory × derivedCategory × derivedCategory)
  derivedCategoryIsTriangulated : Prop
  derivedCategoryIsTriangulatedTerm : derivedCategoryIsTriangulated

structure DerivedFunctorEvidence {F : TriangulatedCategoryFoundation} (D : DerivedFunctorPackage F) where
  derivedCategoryIsTriangulatedClosed : D.derivedCategoryIsTriangulated

def DerivedFunctorClosed {F : TriangulatedCategoryFoundation} (D : DerivedFunctorPackage F) : Prop :=
  D.derivedCategoryIsTriangulated

theorem derived_functor_closed_from_evidence
    {F : TriangulatedCategoryFoundation} (D : DerivedFunctorPackage F)
    (E : DerivedFunctorEvidence D) : DerivedFunctorClosed D := by
  exact E.derivedCategoryIsTriangulatedClosed

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse