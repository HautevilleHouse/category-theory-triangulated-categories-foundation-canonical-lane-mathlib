import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure TriangulatedCategoryPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  shift : objects → objects
  distinguishedTriangles : Set (objects × objects × objects)
  tr0_loop : Prop
  tr1_morphisms : Prop
  tr2_rotation : Prop
  tr3_morphismExt : Prop
  tr4_octahedral : Prop

structure TriangulatedCategoryEvidence (C : TriangulatedCategoryPackage) where
  tr0_loopClosed : C.tr0_loop
  tr1_morphismsClosed : C.tr1_morphisms
  tr2_rotationClosed : C.tr2_rotation
  tr3_morphismExtClosed : C.tr3_morphismExt
  tr4_octahedralClosed : C.tr4_octahedral

def TriangulatedCategoryClosed (C : TriangulatedCategoryPackage) : Prop :=
  C.tr0_loop ∧ C.tr1_morphisms ∧ C.tr2_rotation ∧ C.tr3_morphismExt ∧ C.tr4_octahedral

theorem triangulated_category_closed_from_evidence (C : TriangulatedCategoryPackage)
    (E : TriangulatedCategoryEvidence C) : TriangulatedCategoryClosed C := by
  exact And.intro E.tr0_loopClosed
    (And.intro E.tr1_morphismsClosed
      (And.intro E.tr2_rotationClosed
        (And.intro E.tr3_morphismExtClosed E.tr4_octahedralClosed)))

end HautevilleHouse.CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse