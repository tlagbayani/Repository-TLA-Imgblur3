# Image Blur #3: Perform an Image Transformation with Manhattan Distance

class Image

  # clear arrays for the image
  def initialize (icon)
    @icon = icon
  end

  # identify the coordinates of the pixel with "1"
  def get_ones
    ones = []
    @icon.each_with_index do |row, row_index|
      row.each_with_index do |item, col_index|
        if item == 1
          ones << [row_index, col_index]
        end
      end
    end
    ones
  end

  # blur transformation routine using manhattan distance
  def blur!(blur_distance)
    ones = get_ones

    @icon.each_with_index do |row, row_index|
      row.each_with_index do |item, col_index|
        ones.each do |found_row_index, found_col_index|
          if manhattan_distance(col_index, row_index, found_col_index, found_row_index) <= blur_distance
            @icon[row_index][col_index] = 1
          end
        end
      end
    end
  end

  # calculate manhattan distance 
  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    # (x2 - x1).abs + (y2 - y1).abs
    horizontal_distance + vertical_distance
  end

  # displays the image on screen
  def output_image
    @icon.each do |data|
      puts data.join
    end
  end
end

# defines image arrays
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

# output original image
puts "original image:"
image.output_image

# output blurred image
puts "blurred image:"
image.blur!(3)
image.output_image

