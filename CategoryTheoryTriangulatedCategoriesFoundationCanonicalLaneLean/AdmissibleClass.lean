import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedCategory where
  obj : Type u
  morphism : obj → obj → Type v
  composition : ∀ {A B C : obj}, morphism B C → morphism A B → morphism A C
  identity : ∀ (A : obj), morphism A A
  shift : obj → obj
  shiftMorphism : ∀ (A B : obj), morphism A B → morphism (shift A) (shift B)
  distinguishedTriangles : Set (obj × obj × obj × (morphism A B) × (morphism B C) × (morphism C (shift A)))

structure AdmissibleObject where
  category : TriangulatedCategory
  octahedralAxiom : Prop
  octahedralAxiomSatisfied : octahedralAxiom
  conclusion : octahedralAxiom

structure AdmissibleClass where
  object : AdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  TriangulatedWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse
