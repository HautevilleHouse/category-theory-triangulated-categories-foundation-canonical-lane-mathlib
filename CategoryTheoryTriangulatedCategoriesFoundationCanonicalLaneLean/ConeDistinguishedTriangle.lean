import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure ConeStructure (C : TriangulatedCategory) where
  cone : C.underlyingCategory → C.underlyingCategory
  coneDistinguished : ∀ (f : C.underlyingCategory ⟶ C.underlyingCategory), distinguishedTriangle (cone f, _, _)
  coneFunctorial : Prop
  coneFunctorialClosed : coneFunctorial

structure ConeEvidence (C : TriangulatedCategory) (CS : ConeStructure C) where
  coneDistinguishedClosed : CS.coneDistinguished
  coneFunctorialClosed : CS.coneFunctorial

def ConeClosed (C : TriangulatedCategory) (CS : ConeStructure C) : Prop :=
  CS.coneDistinguished ∧ CS.coneFunctorial

theorem cone_closed_from_evidence (C : TriangulatedCategory) (CS : ConeStructure C) (E : ConeEvidence C CS) :
    ConeClosed C CS := by
  exact And.intro E.coneDistinguishedClosed E.coneFunctorialClosed

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse
