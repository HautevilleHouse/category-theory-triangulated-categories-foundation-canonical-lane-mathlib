import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure DistinguishedTrianglePackage {C : TriangulatedCategoryPackage} where
  X : C.Obj
  Y : C.Obj
  Z : C.Obj
  u : C.Hom X Y
  v : C.Hom Y Z
  w : C.Hom Z (C.shift X)
  isDistinguished : Prop
  triangleAxioms : Prop

structure DistinguishedTriangleEvidence {C : TriangulatedCategoryPackage}
    (T : DistinguishedTrianglePackage C) where
  isDistinguishedClosed : T.isDistinguished
  triangleAxiomsClosed : T.triangleAxioms

def DistinguishedTriangleClosed {C : TriangulatedCategoryPackage}
    (T : DistinguishedTrianglePackage C) : Prop :=
  T.isDistinguished ∧ T.triangleAxioms

theorem distinguished_triangle_closed_from_evidence
    {C : TriangulatedCategoryPackage} (T : DistinguishedTrianglePackage C)
    (E : DistinguishedTriangleEvidence T) : DistinguishedTriangleClosed T := by
  exact And.intro E.isDistinguishedClosed E.triangleAxiomsClosed

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse