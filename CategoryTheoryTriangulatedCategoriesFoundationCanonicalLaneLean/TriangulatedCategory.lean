import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedCategory where
  underlyingCategory : Type u
  shiftFunctor : underlyingCategory ⥤ underlyingCategory
  distinguishedTriangles : Type v
  shiftIsEquivalence : IsEquivalence shiftFunctor
  octahedralAxiom : Prop
  allTrianglesDecidable : Prop

structure TriangulatedCategoryEvidence (C : TriangulatedCategory) where
  shiftIsEquivalenceClosed : C.shiftIsEquivalence
  octahedralAxiomClosed : C.octahedralAxiom
  allTrianglesDecidableClosed : C.allTrianglesDecidable

def TriangulatedCategoryClosed (C : TriangulatedCategory) : Prop :=
  C.shiftIsEquivalence ∧ C.octahedralAxiom ∧ C.allTrianglesDecidable

theorem triangulated_category_closed_from_evidence (C : TriangulatedCategory) (E : TriangulatedCategoryEvidence C) :
    TriangulatedCategoryClosed C := by
  exact And.intro E.shiftIsEquivalenceClosed (And.intro E.octahedralAxiomClosed E.allTrianglesDecidableClosed)

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse
