class Survey < ActiveRecord::Base
  validates(:name, :presence => true)
  before_save(:capitalize_name)

  private

  define_method(:capitalize_name) do
    capitalized_name = self.name.split("")
    capitalized_name[0].capitalize!()
    self.name = capitalized_name.join()
  end

end
