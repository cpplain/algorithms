class Image
  def initialize(image_array)
    @image_array = image_array
  end

  def blur_image
    row_count = @image_array.count
    pixel_count = @image_array[0].count
    blur_array = Array.new(row_count) { Array.new(pixel_count, 0) }
    @image_array.each.with_index do |row, row_index|
      row.each.with_index do |pixel, pixel_index|
        if pixel == 1
          blur_array[row_index][pixel_index] = 1
          blur_array[row_index - 1][pixel_index] = 1 unless row_index == 0
          blur_array[row_index + 1][pixel_index] = 1 unless row_index == row_count - 1
          blur_array[row_index][pixel_index - 1] = 1 unless pixel_index == 0
          blur_array[row_index][pixel_index + 1] = 1 unless pixel_index == pixel_count - 1
        end
      end
    end

    return Image.new(blur_array)
  end

  def output_image
    @image_array.each do |row|
        puts row.join(' ')
    end
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
image_blur = image.blur_image
image_blur.output_image

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image_blur = image.blur_image
image_blur.output_image

puts

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])
image_blur = image.blur_image
image_blur.output_image
