class Image
  def initialize(image_array)
    @image_array = image_array
    @rows = @image_array.count
    @columns = @image_array[0].count
  end

  def output
    @image_array.each do |row|
        puts row.join(' ')
    end
  end

  def blur!(n = 1)
    generate_blur_pixels(n).each do |index|
      @image_array[index[0]][index[1]] = 1 if
        index[0] >= 0 && index[0] < @rows && index[1] >= 0 && index[1] < @columns
    end

    Image.new(@image_array)
  end

  private

  def generate_distance_pairs(n)
    distance_pair_array = []
    (1..n).each do |x|
      (0..x).each do |y|
        z = x - y
        distance_pair_array.push([y, z], [-y, -z])
        distance_pair_array.push([y, -z], [-y, z]) unless y == 0 || z == 0
      end
    end
    distance_pair_array
  end

  def generate_blur_pixels(n)
    distance_pair_array = generate_distance_pairs(n)
    blur_pixel_array = []
    @image_array.each.with_index do |row, row_index|
      row.each.with_index do |pixel, column_index|
        distance_pair_array.each do |delta|
          blur_pixel_array.push([row_index + delta[0], column_index + delta[1]])
        end if pixel == 1
      end
    end
    blur_pixel_array
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur!
image.output

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur!
image.output

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur!
image.output

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur!(1)
image.output

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur!(2)
image.output

puts

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])
image.blur!(3)
image.output
