describe "#my_zip" do

  let(:a) { [ 4, 5, 6 ] }
  let(:b) { [ 7, 8, 9 ] }

  let(:evens) { [ 2, 4, 6 ] }
  let(:odds) { [ 7, 9, 11 ] }

  let(:animals)     { ["aardvark", "hedgehog", "serval",  "wallaby"       ] }
  let(:plants)      { ["aloe",     "hedge",    "sage",    "weeping willow"] }
  let(:ingredients) { ["anise",    "honey",    "scallop", "wasabi"        ] }

  it "doesn't use Ruby's zip method" do
     expect_any_instance_of(Array).to_not receive(:zip)
     a.my_zip(b)
  end

  it "zips two arrays  of equal length together" do
    expect(evens.my_zip(odds)).to eq([[2, 7], [4, 9], [6, 11]])
    expect(odds.my_zip(evens)).to eq([[7, 2], [9, 4], [11, 6]])
    expect(a.my_zip(b)).to eq([[4, 7], [5, 8], [6, 9]])
    expect(b.my_zip(a)).to eq([[7, 4], [8, 5], [9, 6]])
  end

  it "zips three arrays of three elements together" do
    expect([1,2,3].my_zip(a, b)).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end

  it "zips three arrays of four elements together" do
    animal_result = [
      ["aardvark", "aloe", "anise"], 
      ["hedgehog", "hedge", "honey"], 
      ["serval", "sage", "scallop"], 
      ["wallaby", "weeping willow", "wasabi"]
    ]
    expect(animals.my_zip(plants, ingredients)).to eq(animal_result)
    
    plant_result = [
      ["aloe", "aardvark", "anise"], 
      ["hedge", "hedgehog", "honey"], 
      ["sage", "serval", "scallop"], 
      ["weeping willow", "wallaby", "wasabi"]
    ]
    expect(plants.my_zip(animals, ingredients)).to eq(plant_result)
    
    ingredient_result = [
      ["anise", "aardvark", "aloe"], 
      ["honey", "hedgehog", "hedge"], 
      ["scallop", "serval", "sage"], 
      ["wasabi", "wallaby", "weeping willow"]
    ]
    expect(ingredients.my_zip(animals, plants)).to eq(ingredient_result)
  end

  it "always makes the number of nested arrays equal to the length of the array on which it's called" do
    length = [1,2].length
    result = [1,2].my_zip(odds, evens)
    expect(result.length).to eq(length)
    result.each { |a| expect(a.length).to eq(3) }
    expect(result).to eq([[1, 7, 2], [2, 9, 4]])
  end

  it "fills empty spots with nil values if arguments don't have enough values" do
    array = ["a", "h", "s", "w", "x", "z"]
    result = array.my_zip(animals, ingredients)
    desired_result = [
      ["a", "aardvark", "anise"  ],
      ["h", "hedgehog", "honey"  ], 
      ["s", "serval",   "scallop"], 
      ["w", "wallaby",  "wasabi" ], 
      ["x", nil,        nil      ],
      ["z", nil,        nil      ]
    ]
    expect(result).to eq(desired_result)
    expect(a.my_zip([1,2],[8])).to eq([[4,1,8], [5,2,nil], [6,nil,nil]])
  end
 
end
