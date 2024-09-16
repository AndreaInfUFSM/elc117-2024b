image = [
  [0, 128, 255],
  [50, 200, 150],
  [30, 100, 220]
]

def normalize_pixel(value):
  return value / 255.0

normalized_image = list(map(lambda row: list(map(normalize_pixel, row)), image))

print(normalized_image)

