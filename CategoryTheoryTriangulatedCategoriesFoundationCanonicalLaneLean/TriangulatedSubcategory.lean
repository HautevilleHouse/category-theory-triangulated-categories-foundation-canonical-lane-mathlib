import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedSubcategory (C : TriangulatedCategory) where
  objSet : Set C.obj
  shiftClosed : ∀ (X : C.obj), X ∈ objSet → C.shift X ∈ objSet
  triangleClosed : ∀ (A B C' : C.obj) (f : C.morphism A B) (g : C.morphism B C') (h : C.morphism C' (C.shift A)),
    (A, B, C', f, g, h) ∈ C.distinguishedTriangles → A ∈ objSet → B ∈ objSet → C' ∈ objSet

structure TriangulatedSubcategoryPackage (C : TriangulatedCategory) where
  subcategory : TriangulatedSubcategory C
  extensionAxiom : Prop
  extensionAxiomSatisfied : extensionAxiom

structure TriangulatedSubcategoryEvidence {C : TriangulatedCategory}
    (P : TriangulatedSubcategoryPackage C) where
  shiftClosedClosed : ∀ (X : C.obj), X ∈ P.subcategory.objSet → C.shift X ∈ P.subcategory.objSet
  triangleClosedClosed : ∀ (A B C' : C.obj) (f : C.morphism A B) (g : C.morphism B C') (h : C.morphism C' (C.shift A)),
    (A, B, C', f, g, h) ∈ C.distinguishedTriangles → A ∈ P.subcategory.objSet → B ∈ P.subcategory.objSet → C' ∈ P.subcategory.objSet
  extensionAxiomClosed : P.extensionAxiom

def TriangulatedSubcategoryClosed {C : TriangulatedCategory}
    (P : TriangulatedSubcategoryPackage C) : Prop :=
  P.extensionAxiom

theorem triangulated_subcategory_closed_from_evidence {C : TriangulatedCategory}
    (P : TriangulatedSubcategoryPackage C) (E : TriangulatedSubcategoryEvidence P) :
    TriangulatedSubcategoryClosed P := by
  exact E.extensionAxiomClosed

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse
