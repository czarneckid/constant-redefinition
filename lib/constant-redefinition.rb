# All credit is due to this post: http://stackoverflow.com/questions/3375360/how-to-redefine-a-ruby-constant-without-warning
class Object
  def define_if_not_defined(const, value)
    mod = self.is_a?(Module) ? self : self.class
    mod.const_set(const, value) unless mod.const_defined?(const)
  end

  def redefine_without_warning(const, value)
    mod = self.is_a?(Module) ? self : self.class
    mod.send(:remove_const, const) if mod.const_defined?(const)
    mod.const_set(const, value)
  end
end
