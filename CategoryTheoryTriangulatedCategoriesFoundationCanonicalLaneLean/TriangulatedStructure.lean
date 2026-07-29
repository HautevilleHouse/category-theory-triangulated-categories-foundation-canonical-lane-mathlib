import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedCategory where
  obj : Type u
  mor : Type v
  shift : obj → obj
  distinguishedTriangles : Set (Triangle obj mor)
  octahedralAxiom : Prop

structure TriangulatedCategoryEvidence (T : TriangulatedCategory) where
  shiftAutoEquivalence : T.shift ∘ T.shift ≅ id
  distinguishedTriangleProperties : ∀ (t : Triangle T.obj T.mor), t ∈ T.distinguishedTriangles → (TriangleProperty.rotateClosure t ∧ TriangleProperty.complete t)
  octahedralAxiomClosed : T.octahedralAxiom

def TriangulatedClosed (T : TriangulatedCategory) : Prop :=
  T.octahedralAxiom ∧ (∀ t : Triangle T.obj T.mor, t ∈ T.distinguishedTriangles → (TriangleProperty.rotateClosure t ∧ TriangleProperty.complete t))

theorem triangulated_closed_from_evidence (T : TriangulatedCategory) (E : TriangulatedCategoryEvidence T) : TriangulatedClosed T := by
  refine And.intro E.octahedralAxiomClosed ?_
  intro t ht
  exact E.distinguishedTriangleProperties t ht

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse