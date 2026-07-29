import Mathlib.CategoryTheory.Triangulated.Basic

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedCategoryFoundation where
  category : Type u
  shift : category ⥤ category
  distinguishedTriangles : Set (category × category × category)
  shiftAutoequivalence : IsEquivalence shift
  triangleAxiomTR1 : Prop
  triangleAxiomTR2 : Prop
  triangleAxiomTR3 : Prop
  octahedralAxiom : Prop
  shiftAutoequivalenceTerm : shiftAutoequivalence
  triangleAxiomTR1Term : triangleAxiomTR1
  triangleAxiomTR2Term : triangleAxiomTR2
  triangleAxiomTR3Term : triangleAxiomTR3
  octahedralAxiomTerm : octahedralAxiom

structure TriangulatedCategoryFoundationEvidence (F : TriangulatedCategoryFoundation) where
  shiftAutoequivalenceClosed : F.shiftAutoequivalence
  triangleAxiomTR1Closed : F.triangleAxiomTR1
  triangleAxiomTR2Closed : F.triangleAxiomTR2
  triangleAxiomTR3Closed : F.triangleAxiomTR3
  octahedralAxiomClosed : F.octahedralAxiom

def TriangulatedCategoryFoundationClosed (F : TriangulatedCategoryFoundation) : Prop :=
  F.shiftAutoequivalence ∧ F.triangleAxiomTR1 ∧ F.triangleAxiomTR2 ∧ F.triangleAxiomTR3 ∧ F.octahedralAxiom

theorem triangulated_category_foundation_closed_from_evidence
    (F : TriangulatedCategoryFoundation) (E : TriangulatedCategoryFoundationEvidence F) :
    TriangulatedCategoryFoundationClosed F := by
  exact And.intro E.shiftAutoequivalenceClosed
    (And.intro E.triangleAxiomTR1Closed
      (And.intro E.triangleAxiomTR2Closed
        (And.intro E.triangleAxiomTR3Closed E.octahedralAxiomClosed)))

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse