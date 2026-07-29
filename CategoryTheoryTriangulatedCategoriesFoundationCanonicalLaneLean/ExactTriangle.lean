import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.TriangulatedStructure

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure ExactTriangle (T : TriangulatedCategory) where
  X : T.obj
  Y : T.obj
  Z : T.obj
  u : T.mor X Y
  v : T.mor Y Z
  w : T.mor Z (T.shift X)
  distinguished : Triangle.mk X Y Z u v w ∈ T.distinguishedTriangles

structure ExactTriangleEvidence (T : TriangulatedCategory) (E : ExactTriangle T) where
  rotationClosed : ExactTriangle T := { E with u := E.v, v := E.w, w := T.shift E.u ∘ E.u, distinguished := sorry }
  distinguishedProperty : ∀ (f : T.mor E.X E.Y), (∃ g : T.mor E.Y E.Z, g ∘ f = 0) → (∃ h : T.mor E.Z (T.shift E.X), h ∘ g = 0)

def ExactTriangleClosed (T : TriangulatedCategory) (E : ExactTriangle T) : Prop :=
  E.distinguished ∧ ∀ (f : T.mor E.X E.Y), (∃ g : T.mor E.Y E.Z, g ∘ f = 0) → (∃ h : T.mor E.Z (T.shift E.X), h ∘ g = 0)

theorem exact_triangle_closed_from_evidence (T : TriangulatedCategory) (E : ExactTriangle T) (Ev : ExactTriangleEvidence T E) : ExactTriangleClosed T E := by
  refine And.intro E.distinguished ?_
  intro f h
  exact Ev.distinguishedProperty f h

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse