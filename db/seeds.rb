require 'csv'

# CLEAR DATABASE
Mushroom.destroy_all

dictionary = [
  # 0. CLASS
  {
    "e": "edible",
    "p": "poisonous"
  }, 
  # 1. CAP SHAPE
  {
    "b": "bell",
    "c": "conical",
    "x": "convex",
    "f": "flat",
    "k": "knobbed",
    "s": "sunken"
  },
  # 2. CAP SURFACE
  {
    "f": "fibrous",
    "g": "grooves",
    "y": "scaly",
    "s": "smooth",
  },
  # 3. CAP COLOR
  {
    "n": "brown",
    "b": "buff",
    "c": "cinnamon",
    "g": "gray",
    "r": "green",
    "p": "pink",
    "u": "purple",
    "e": "red",
    "w": "white",
    "y": "yellow"
  },
  # 4. BRUISES
  {
    "t": "bruises",
    "f": "no"
  },
  # 5. ODOR
  {
    "a": "almond",
    "l": "anise",
    "c": "creosote",
    "y": "fishy",
    "f": "foul",
    "m": "musty",
    "n": "none",
    "p": "pungent",
    "s": "spicy"
  },
  # 6. GILL ATTACHMENT
  {
    "a": "attached",
    "d": "descending",
    "f": "free",
    "n": "notched"
  },
  # 7. GILL SPACING
  {
    "c": "close",
    "w": "crowded",
    "d": "distant"
  },
  # 8. GILL SIZE
  {
    "b": "broad",
    "n": "narrow"
  },
  # 9. GILL COLOR
  {
    "k": "black",
    "n": "brown",
    "b": "buff",
    "h": "chocolate", 
    "g": "gray",
    "r": "green",
    "o": "orange",
    "p": "pink",
    "u": "purple",
    "e": "red",
    "w": "white",
    "y": "yellow"
  },
  # 10. STALK SHAPE
  {
    "e": "enlarging",
    "t": "tapering"
  },
  # 11. STALK ROOT
  {
    "b": "bulbous",
    "c": "club",
    "u": "cup",
    "e": "equal",
    "z": "rhizomorphs",
    "r": "rooted",
    "?": "missing"
  },
  # 12. STALK SURFACE ABOVE RING
  {
    "f": "fibrous",
    "y": "scaly",
    "k": "silky",
    "s": "smooth"
  },
  # 13. STALK SURFACE BELOW RING
  {
    "f": "fibrous",
    "y": "scaly",
    "k": "silky",
    "s": "smooth"
  },
  # 14. STALK COLOR ABOVE RING
  {
    "n": "brown",
    "b": "buff",
    "c": "cinnamon",
    "g": "gray",
    "o": "orange",
    "p": "pink",
    "e": "red",
    "w": "white",
    "y": "yellow"
  },
  # 15. STALK COLOR BELOW RING
  {
    "n": "brown",
    "b": "buff",
    "c": "cinnamon",
    "g": "gray",
    "o": "orange",
    "p": "pink",
    "e": "red",
    "w": "white",
    "y": "yellow"
  },
  # 16. VEIL TYPE
  {
    "p": "partial",
    "u": "universal"
  },
  # 17. VEIL COLOR
  {
    "n": "brown",
    "o": "orange",
    "w": "white",
    "y": "yellow"
  },
  # 18. RING NUMBER
  {
    "n": "none",
    "o": "one",
    "t": "two"
  },
  # 19. RING TYPE
  {
    "c": "cobwebby",
    "e": "evanescent",
    "f": "flaring",
    "l": "large",
    "n": "none",
    "p": "pendant",
    "s": "sheathing",
    "z": "zone"
  },
  # 20. SPORE PRINT COLOR
  {
    "k": "black",
    "n": "brown",
    "b": "buff",
    "h": "chocolate",
    "r": "green",
    "o": "orange",
    "u": "purple",
    "w": "white",
    "y": "yellow"
  },
  # 21. POPULATION
  {
    "a": "abundant",
    "c": "clustered",
    "n": "numerous",
    "s": "scattered",
    "v": "several",
    "y": "solitary"
  },
  # 22. HABITAT
  {
    "g": "grasses",
    "l": "leaves",
    "m": "meadows",
    "p": "paths",
    "u": "urban",
    "w": "waste",
    "d": "woods"
  }
]


filepath = 'db/data/agaricus-lepiota.csv'

CSV.foreach(filepath) do |row|
  mushroom = Mushroom.new
  row.each_with_index do |signifier, index|
    category = dictionary[index][signifier.to_sym]
    case index
    when 0
      mushroom.classification             = category
    when 1
      mushroom.cap_shape                  = category
    when 2
      mushroom.cap_surface                = category
    when 3
      mushroom.cap_color                  = category
    when 4
      mushroom.bruises                    = category
    when 5
      mushroom.odor                       = category
    when 6
      mushroom.gill_attachment            = category
    when 7
      mushroom.gill_spacing               = category
    when 8
      mushroom.gill_size                  = category
    when 9 
      mushroom.gill_color                 = category
    when 10
      mushroom.stalk_shape                = category
    when 11
      mushroom.stalk_root                 = category
    when 12
      mushroom.stalk_surface_above_ring   = category
    when 13
      mushroom.stalk_surface_below_ring   = category
    when 14
      mushroom.stalk_color_above_ring     = category
    when 15
      mushroom.stalk_color_below_ring     = category
    when 16
      mushroom.veil_type                  = category
    when 17
      mushroom.veil_color                 = category
    when 18
      mushroom.ring_number                = category
    when 19
      mushroom.ring_type                  = category
    when 20
      mushroom.spore_print_color          = category
    when 21
      mushroom.population                 = category
    when 22
      mushroom.habitat                    = category
    end
    mushroom.save
  end
end





# DICTIONAIRY REFERENCE

#  0. class                     edible=e, poisonous=p
#  
#  1. cap-shape:                bell=b,conical=c,convex=x,flat=f,
#                               knobbed=k,sunken=s
#                               
#  2. cap-surface:              fibrous=f,grooves=g,scaly=y,smooth=s
#  
#  3. cap-color:                brown=n,buff=b,cinnamon=c,gray=g,green=r,
#                               pink=p,purple=u,red=e,white=w,yellow=y
#                               
#  4. bruises?:                 bruises=t,no=f
#  
#  5. odor:                     almond=a,anise=l,creosote=c,fishy=y,foul=f,
#                               musty=m,none=n,pungent=p,spicy=s
#                               
#  6. gill-attachment:          attached=a,descending=d,free=f,notched=n
#  
#  7. gill-spacing:             close=c,crowded=w,distant=d
#  
#  8. gill-size:                broad=b,narrow=n
#  
#  9. gill-color:               black=k,brown=n,buff=b,chocolate=h,gray=g,
#                               green=r,orange=o,pink=p,purple=u,red=e,
#                               white=w,yellow=y
#                               
# 10. stalk-shape:              enlarging=e,tapering=t
# 
# 11. stalk-root:               bulbous=b,club=c,cup=u,equal=e,
#                               rhizomorphs=z,rooted=r,missing=?
#                               
# 12. stalk-surface-above-ring: fibrous=f,scaly=y,silky=k,smooth=s
# 
# 13. stalk-surface-below-ring: fibrous=f,scaly=y,silky=k,smooth=s
# 
# 14. stalk-color-above-ring:   brown=n,buff=b,cinnamon=c,gray=g,orange=o,
#                               pink=p,red=e,white=w,yellow=y
#                               
# 15. stalk-color-below-ring:   brown=n,buff=b,cinnamon=c,gray=g,orange=o,
#                               pink=p,red=e,white=w,yellow=y
#                               
# 16. veil-type:                partial=p,universal=u
# 
# 17. veil-color:               brown=n,orange=o,white=w,yellow=y
# 
# 18. ring-number:              none=n,one=o,two=t
# 
# 19. ring-type:                cobwebby=c,evanescent=e,flaring=f,large=l,
#                               none=n,pendant=p,sheathing=s,zone=z
#                               
# 20. spore-print-color:        black=k,brown=n,buff=b,chocolate=h,green=r,
#                               orange=o,purple=u,white=w,yellow=y
#                               
# 21. population:               abundant=a,clustered=c,numerous=n,
#                               scattered=s,several=v,solitary=y
#                               
# 22. habitat:                  grasses=g,leaves=l,meadows=m,paths=p,
#                               urban=u,waste=w,woods=d
#                               
#                               