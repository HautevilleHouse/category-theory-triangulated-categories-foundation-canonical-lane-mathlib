import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedSpace where
  carrier : Type
  category : Type
  triangulatedStructure : Prop

structure TriangulatedAdmittedObject where
  space : TriangulatedSpace
  triangulated : Prop
  shiftAutomorphism : Prop
  distinguishedTriangles : Prop
  octahedralAxiom : Prop
  conclusion : triangulated

def TriangulatedWitnessClosed (O : TriangulatedAdmittedObject) : Prop :=
  O.triangulated

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse