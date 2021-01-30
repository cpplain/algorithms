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
    pixels = @image_array[0].count
    blur_array = Array.new(rows) { Array.new(pixels, 0) }

    @image_array.each.with_index do |row, row_index|
      row.each.with_index do |pixel, pixel_index|
        if pixel == 1
          shift1 = 1
          count = n - 1

          # Origination
          blur_array[row_index][pixel_index] = 1 if
            blur_array[row_index][pixel_index] == 0

          n.times do
            shift2 = 1

            # Top-right quadrant
            blur_array[row_index - shift1][pixel_index] = 1 unless
              row_index  - shift1 < 0
            # Bottom-right quadrant
            blur_array[row_index][pixel_index + shift1] = 1 unless
              pixel_index + shift1 > pixels - 1
            # Bottom-left quadrant
            blur_array[row_index + shift1][pixel_index] = 1 unless
              row_index + shift1 > rows - 1
            # Top-left quadrant
            blur_array[row_index][pixel_index - shift1] = 1 unless
              pixel_index - shift1 < 0

            count.times do
              # Top-right quadrant
              blur_array[row_index - shift1][pixel_index + shift2] = 1 unless
                row_index - shift1 < 0 || pixel_index + shift2 > pixels - 1
              # Bottom-right quadrant
              blur_array[row_index + shift2][pixel_index + shift1] = 1 unless
                row_index + shift2 > rows - 1 || pixel_index + shift1 > pixels - 1
              # Bottom-left quadrant
              blur_array[row_index + shift1][pixel_index - shift2] = 1 unless
                row_index + shift1 > rows - 1 || pixel_index - shift2 < 0
              # Top-left quadrant
              blur_array[row_index - shift2][pixel_index - shift1] = 1 unless
                row_index - shift2 < 0 || pixel_index - shift1 < 0
              shift2 += 1
            end
            count -= 1
            shift1 += 1
          end
        end
      end
    end
    return Image.new(blur_array)
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
