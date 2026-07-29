import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  TriangulatedWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryTriangulatedCategoriesFoundationCanonicalLaneLean
end HautevilleHouse
