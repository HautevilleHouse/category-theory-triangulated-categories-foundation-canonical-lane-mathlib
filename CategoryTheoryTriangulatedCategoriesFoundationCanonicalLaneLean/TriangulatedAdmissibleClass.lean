import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedAdmittedObject where
  category : TriangulatedCategoryPackage
  object : Type
  distinguishedTriangleWitness : Prop
  conclusion : distinguishedTriangleWitness

structure TriangulatedAdmissibleClass where
  object : TriangulatedAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def triangulatedAdmittedClosure (A : TriangulatedAdmissibleClass) : Prop :=
  TriangulatedCategoryClosed A.object.category ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse