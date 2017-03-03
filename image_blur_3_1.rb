class Image
  def initialize(image_array)
    @image_array = image_array
  end

  def output
    @image_array.each do |row|
        puts row.join(' ')
    end
  end

  def blur(n = 1)
    rows = @image_array.count
    columns = @image_array[0].count
    index_array = []

    n.times do
      @image_array.each.with_index do |row, row_index|
        row.each.with_index do |column, column_index|
          index_array << [row_index, column_index] if column == 1
        end
      end

      index_array.each do |index|
        row_index, column_index = index

        # Origination
        @image_array[row_index][column_index] = 1
        # Top
        @image_array[row_index - 1][column_index] = 1 unless
          row_index - 1 < 0
        # Right
        @image_array[row_index][column_index + 1] = 1 unless
          column_index + 1 > columns - 1
        # Bottom
        @image_array[row_index + 1][column_index] = 1 unless
          row_index + 1 > rows - 1
        # Top-left
        @image_array[row_index][column_index - 1] = 1 unless
          column_index - 1 < 0
      end
    end
    return Image.new(@image_array)
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
image_blur = image.blur
image_blur.output

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image_blur = image.blur
image_blur.output

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])
image_blur = image.blur
image_blur.output

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image_blur = image.blur(1)
image_blur.output

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image_blur = image.blur(2)
image_blur.output

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
image_blur = image.blur(3)
image_blur.output
