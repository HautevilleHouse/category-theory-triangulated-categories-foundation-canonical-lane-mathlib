import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure CategoryTheorySpace where
  carrier : Type
  categoryStructure : Prop

structure CategoryTheoryAdmittedObject where
  space : CategoryTheorySpace
  triangulatedStructure : Prop
  shiftAutomorphismExists : Prop
  octahedralAxiomHolds : Prop
  conclusion : octahedralAxiomHolds

structure TriangulatedEndgameState where
  object : CategoryTheoryAdmittedObject

def TriangulatedWitnessClosed (O : CategoryTheoryAdmittedObject) : Prop :=
  O.octahedralAxiomHolds

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse