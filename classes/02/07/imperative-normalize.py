image = [
  [0, 128, 255],
  [50, 200, 150],
  [30, 100, 220]
]

def normalize_pixel(value):
  return value / 255.0

normalized_image = []
for row in image:
  normalized_row = []
  for pixel in row:
    normalized_row.append(normalize_pixel(pixel))
  normalized_image.append(normalized_row)

print(normalized_image)

