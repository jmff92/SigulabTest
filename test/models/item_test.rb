require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
# 	fixtures :all
	test "todosLosCamposVacios" do
		item=Item.new
		assert_not item.save
	end
	
	test "todosLosCamposLlenos" do
		item=items(:one)
		assert item.save
	end
	
	test "faltaNombre" do
		item=items(:two)
		assert_not item.save
	end
	
	test "faltaTipo" do
		item=items(:three)
		assert_not item.save
	end
	
	test "faltaDescripcion" do
		item=items(:four)
		assert_not item.save
	end
	
	test "faltaDimeniones" do
		item=items(:five)
		assert item.save
	end
	
	test "faltaCantidad" do
		item=items(:six)
		assert_not item.save
	end
	
	test "faltaUnidad" do
		item=items(:seven)
		assert_not item.save
	end
end
