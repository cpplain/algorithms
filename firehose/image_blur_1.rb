class Image
  attr_accessor :image_array

  def initialize(image_array)
    @image_array = image_array
  end

  def output_image
    @image_array.each do |row|
        puts row.join
    end
  end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
