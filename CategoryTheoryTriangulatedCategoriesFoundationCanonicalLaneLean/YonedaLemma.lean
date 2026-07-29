import HautevilleHouse.CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean.TriangulatedCategory

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

structure YonedaLemmaPackage (C : TriangulatedCategory) where
  representableFunctor : Prop
  naturalIsomorphism : Prop
  fullyFaithfulEmbedding : Prop

structure YonedaLemmaEvidence (C : TriangulatedCategory) (Y : YonedaLemmaPackage C) where
  representableFunctorClosed : Y.representableFunctor
  naturalIsomorphismClosed : Y.naturalIsomorphism
  fullyFaithfulEmbeddingClosed : Y.fullyFaithfulEmbedding

def YonedaLemmaClosed (C : TriangulatedCategory) (Y : YonedaLemmaPackage C) : Prop :=
  Y.representableFunctor ∧ Y.naturalIsomorphism ∧ Y.fullyFaithfulEmbedding

theorem yoneda_lemma_closed_from_evidence (C : TriangulatedCategory)
    (Y : YonedaLemmaPackage C) (E : YonedaLemmaEvidence C Y) : YonedaLemmaClosed C Y := by
  exact And.intro E.representableFunctorClosed (And.intro E.naturalIsomorphismClosed E.fullyFaithfulEmbeddingClosed)

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse