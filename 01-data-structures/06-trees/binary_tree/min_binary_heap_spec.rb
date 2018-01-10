include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("Pacific Rim", 72) }

  let (:heap) { MinBinaryHeap.new(root) }
  let (:tree) { heap.tree }
  let (:the_matrix) { Node.new("The Matrix", 87) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#initialize" do
    it "inserts initial argument into root position of tree" do
      expect(tree[0].title).to eq "Pacific Rim"
    end
  end

  describe "#insert" do
    it "inserts a higher rated node as a left child" do
      heap.insert(braveheart)
      expect(tree[1].title).to eq "Braveheart"
    end

    it "inserts multiple nodes properly" do
      heap.insert(the_matrix)
      heap.insert(mad_max_2)
      heap.insert(braveheart)
      heap.insert(empire)
      heap.insert(jedi)
      heap.insert(hope)
      heap.insert(donnie)
      heap.insert(inception)
      heap.insert(district)
      heap.insert(shawshank)
      heap.insert(martian)

      expect(tree[0].title).to eq 'Pacific Rim'
      expect(tree[tree.length - 1].title).to eq 'The Martian'
    end
  end

  describe "#find" do
    it "returns -1 if node with title(data) isn't found" do
      heap.insert(district)
      heap.insert(the_matrix)
      heap.insert(shawshank)

      expect(heap.find('The Mask')).to eq -1
    end

    it "returns node if found" do
      heap.insert(district)
      heap.insert(the_matrix)
      heap.insert(shawshank)

      expect(heap.find('The Matrix')).to eq the_matrix
    end
  end

  describe "#delete" do
    it "returns -1 if node with title(data) isn't available for deletion" do
      heap.insert(district)
      heap.insert(the_matrix)
      heap.insert(shawshank)

      expect(heap.delete('Ace Ventura: Pet Detective')).to eq -1
    end

    it "deletes node if found" do
      heap.insert(district)
      heap.insert(the_matrix)
      heap.insert(shawshank)

      heap.delete('District 9')

      expect(heap.find('District 9')).to eq -1
    end
  end

  describe "#print_heap" do
     specify {
       expected_output ="Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nInception: 86\nDistrict 9: 90\nThe Matrix: 87\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\nThe Martian: 92\n"

       heap.insert(hope)
       heap.insert(empire)
       heap.insert(martian)
       heap.insert(the_matrix)
       heap.insert(inception)
       heap.insert(braveheart)
       heap.insert(shawshank)
       heap.insert(district)
       heap.insert(mad_max_2)
       heap.insert(jedi)

       expect { heap.print_heap }.to output(expected_output).to_stdout
     }
  end
end
