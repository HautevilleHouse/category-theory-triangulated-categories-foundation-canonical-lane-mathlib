import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.TriangulatedStructure
import CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.TriangulatedFunctor

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure DerivedCategory (A : Type u) [AbelianCategory A] where
  chainComplexes : Type v
  homotopyCategory : TriangulatedCategory
  localizationFunctor : TriangulatedFunctor (homotopyCategoryOfChainComplexes A) homotopyCategory
  quasiIsomorphismsInverted : ∀ (f : chainComplexes → chainComplexes), IsQuasiIsomorphism f → IsIsomorphism (localizationFunctor.F f)

structure DerivedCategoryEvidence (A : Type u) [AbelianCategory A] (D : DerivedCategory A) where
  homotopyCategoryTriangulated : TriangulatedCategoryEvidence D.homotopyCategory
  localizationFunctorClosed : TriangulatedFunctorClosed (homotopyCategoryOfChainComplexes A) D.homotopyCategory D.localizationFunctor
  quasiIsomorphismsInvertedClosed : D.quasiIsomorphismsInverted

def DerivedCategoryClosed (A : Type u) [AbelianCategory A] (D : DerivedCategory A) : Prop :=
  TriangulatedClosed D.homotopyCategory ∧ TriangulatedFunctorClosed (homotopyCategoryOfChainComplexes A) D.homotopyCategory D.localizationFunctor ∧ D.quasiIsomorphismsInverted

theorem derived_category_closed_from_evidence (A : Type u) [AbelianCategory A] (D : DerivedCategory A) (E : DerivedCategoryEvidence A D) : DerivedCategoryClosed A D := by
  refine And.intro (triangulated_closed_from_evidence D.homotopyCategory E.homotopyCategoryTriangulated) ?_
  refine And.intro E.localizationFunctorClosed E.quasiIsomorphismsInvertedClosed

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse