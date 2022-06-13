module Rotate
  def rotate_a
    shifts
    @A_hash = Hash[@a_z.zip(@a_z.rotate(shifts[0]))]
  end

  def rotate_b
    shifts
    @B_hash = Hash[@a_z.zip(@a_z.rotate(shifts[1]))]
  end

  def rotate_c
    shifts
    @C_hash = Hash[@a_z.zip(@a_z.rotate(shifts[2]))]
  end

  def rotate_d
    shifts
    @D_hash = Hash[@a_z.zip(@a_z.rotate(shifts[3]))]
  end

  def reverse_rotate_a
    rotate_a.invert
  end

  def reverse_rotate_b
    rotate_b.invert
  end

  def reverse_rotate_c
    rotate_c.invert
  end

  def reverse_rotate_d
    rotate_d.invert
  end
end
