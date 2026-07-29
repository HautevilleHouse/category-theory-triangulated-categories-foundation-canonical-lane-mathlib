import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure OctahedralPackage (C : TriangulatedCategory) where
  compositionTwoMorphisms : (C.underlyingCategory) ⟶ (C.underlyingCategory)
  distinguishedTriangleSequence : Prop
  octahedralCommutes : Prop

structure OctahedralEvidence (C : TriangulatedCategory) (O : OctahedralPackage C) where
  distinguishedTriangleSequenceClosed : O.distinguishedTriangleSequence
  octahedralCommutesClosed : O.octahedralCommutes

def OctahedralClosed (C : TriangulatedCategory) (O : OctahedralPackage C) : Prop :=
  O.distinguishedTriangleSequence ∧ O.octahedralCommutes

theorem octahedral_closed_from_evidence (C : TriangulatedCategory) (O : OctahedralPackage C) (E : OctahedralEvidence C O) :
    OctahedralClosed C O := by
  exact And.intro E.distinguishedTriangleSequenceClosed E.octahedralCommutesClosed

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse
