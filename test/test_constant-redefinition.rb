require 'test_helper'

class TestConstantRedefinition < Test::Unit::TestCase
  def test_can_define_a_constant_if_not_already_defined
    define_if_not_defined(:A, 1)
    
    assert_equal 1, A
  end
  
  def test_can_redefine_a_constant_if_already_defined
    define_if_not_defined(:B, 1)
    assert_equal 1, B

    redefine_without_warning(:B, 2)
    assert_equal 2, B    
  end
  
  def test_redefine_a_constant_sets_constant_if_not_already_defined
    redefine_without_warning(:C, 3)
    
    assert_equal 3, C
  end
  
  def test_can_define_a_constant_in_a_module_if_not_already_defined
    Math.define_if_not_defined(:FOO, 2 * Math::PI)
    
    assert_equal 2 * Math::PI, Math::FOO
  end
  
  def test_can_redefine_a_constant_in_a_module_if_already_defined
    Math.define_if_not_defined(:BAR, 3)
    assert_equal 3, Math::BAR
    
    Math.redefine_without_warning(:BAR, 5)
    assert_equal 5, Math::BAR
  end
  
  def test_redefine_a_constant_in_a_module_sets_constant_if_not_already_defined
    Math.redefine_without_warning(:AMAZING, 3)
    
    assert_equal 3, Math::AMAZING
  end
end
