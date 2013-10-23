class Chef
  attr_reader :yummy_cakes

  def yummy?(ingredients)
    yummy_combinations.each do |combination|
      combination = [ingredients[combination[0]],
                     ingredients[combination[1]],
                     ingredients[combination[2]]].uniq

      return true if is_yummy_combination?(combination)
    end

    false
  end

  def cook_yummy_cakes!
    @yummy_cakes = ingredients_combination.select{ |ingredients| yummy?(ingredients) }.uniq

    display "Ahoi! Our Chef has cooked #{total_yummy_cakes_recipes} yummy cakes recipes,
    with these ingredients #{ingredients.uniq}"
  end

  def share_yummy_cakes_recipes
    display "Recipes #{@yummy_cakes.inspect}"
  end

  private

  def total_yummy_cakes_recipes
    @yummy_cakes.size
  end

  def display(msg)
    puts msg
  end

  def yummy_combinations
    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8]]
  end

  def ingredients
    [ 'fruit', 'fruit', 'fruit', 'candy', 'candy', 'candy', 'sweetmeat',
      'sweetmeat', 'sweetmeat','paste' ]
  end

  def is_yummy_combination?(combination)
    (combination.size == 1 || (combination.size == 2 && combination.include?('paste')))
  end

  def ingredients_combination
    ingredients.permutation(9).to_a
  end
end