class TouristReview < Review
    belongs_to :tourist, class_name: "Traveler"
end
