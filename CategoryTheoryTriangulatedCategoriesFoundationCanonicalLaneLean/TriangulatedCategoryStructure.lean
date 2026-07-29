import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure Triangle (C : Type u) [Category C] where
  X Y Z : C
  f : X ⟶ Y
  g : Y ⟶ Z
  h : Z ⟶ X⟦1⟧

structure TriangulatedCategoryStructure where
  cat : Type u
  categoryInstance : Category cat
  shift : cat ⥤ cat
  distinguishedTriangles : Set (Triangle cat)
  axioms : TriangulatedAxioms cat shift distinguishedTriangles

structure TriangulatedAxioms (C : Type u) [Category C] (shift : C ⥤ C) (triangles : Set (Triangle C)) where
  trivialTriangleDistinguished : ∀ (X : C), Triangle.mk X X 0 (𝟙 X) (0 : X ⟶ X) (0 : X ⟶ X⟦1⟧) ∈ triangles
  rotationClosed : ∀ (T : Triangle C), T ∈ triangles → (rotate T) ∈ triangles
  baseChange : ∀ (T : Triangle C) (f : T.X ⟶ T.Y), T ∈ triangles → (someCondition)   -- placeholder
  octahedralAxiom : OctahedralAxiomHolds C shift triangles

structure OctahedralAxiomHolds (C : Type u) [Category C] (shift : C ⥤ C) (triangles : Set (Triangle C)) where
  holds : Prop

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse