-- Probability measure p: Σ → [0,1]

import measure_theory.measure_space
import measure_theory.lebesgue_measure
import measure_theory.borel_space
import data.set.intervals.basic

instance inhabitant : fintype (fin 1) := fin.fintype 1

def A :=  λ a, a ∈ (𝒫 ⊤ : set (set (fin 1)))

def M : measurable_space (fin 1) := { is_measurable_empty := by {rw A, finish},
  is_measurable' := A,
  is_measurable_compl := assume a h, by {rw A at *, finish},
  is_measurable_Union := assume f hf, by {rw A at *, simp },
}

noncomputable abbreviation qlbrdl (s: set (fin 1)) (z: @is_measurable (fin 1) M s) : ennreal := 
  finset.card s.to_finset

noncomputable def μ : @measure_theory.measure (fin 1) M :=
@measure_theory.measure.of_measurable _ M
  (qlbrdl)
  (by simp)
  (λ x h a, begin
    simp,
    sorry
  end)

def P : (@measure_theory.probability_measure (fin 1) M μ) := 
{ measure_univ := sorry }

#check P
#check M
#check real.measurable_space
#check real.borel_space
instance B01 : borel_space ℝ := ⟨rfl⟩
#check B01