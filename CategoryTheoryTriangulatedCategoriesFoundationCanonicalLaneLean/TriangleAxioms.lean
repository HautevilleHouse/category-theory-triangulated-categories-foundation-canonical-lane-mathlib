import .TriangulatedCategoryFoundation

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangleAxiomsPackage (F : TriangulatedCategoryFoundation) where
  existenceOfZeroTriangle : Prop
  rotationClosure : Prop
  morphismExtension : Prop
  existenceOfZeroTriangleTerm : existenceOfZeroTriangle
  rotationClosureTerm : rotationClosure
  morphismExtensionTerm : morphismExtension

structure TriangleAxiomsEvidence (F : TriangulatedCategoryFoundation) (P : TriangleAxiomsPackage F) where
  existenceOfZeroTriangleClosed : P.existenceOfZeroTriangle
  rotationClosureClosed : P.rotationClosure
  morphismExtensionClosed : P.morphismExtension

def TriangleAxiomsClosed {F : TriangulatedCategoryFoundation} (P : TriangleAxiomsPackage F) : Prop :=
  P.existenceOfZeroTriangle ∧ P.rotationClosure ∧ P.morphismExtension

theorem triangle_axioms_closed_from_evidence
    {F : TriangulatedCategoryFoundation} (P : TriangleAxiomsPackage F)
    (E : TriangleAxiomsEvidence F P) : TriangleAxiomsClosed P := by
  exact And.intro E.existenceOfZeroTriangleClosed
    (And.intro E.rotationClosureClosed E.morphismExtensionClosed)

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse