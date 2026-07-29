import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.TriangulatedCategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure DistinguishedTriangleEvidence (C : Type u) [Category C] (shift : C ⥤ C) (triangles : Set (Triangle C)) (T : Triangle C) where
  isDistinguished : T ∈ triangles
  rotationClosed : (rotate T) ∈ triangles
  baseChangeEvidence : ∀ (f : T.X ⟶ T.Y), (someTriangle) ∈ triangles   -- placeholder

def TriangulatedWitnessClosed (O : TriangulatedAdmittedObject) : Prop :=
  O.octahedralAxiom

theorem triangulated_witness_closed_from_evidence (O : TriangulatedAdmittedObject) : TriangulatedWitnessClosed O :=
  O.conclusion.holds

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse