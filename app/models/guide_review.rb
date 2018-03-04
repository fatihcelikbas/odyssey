class GuideReview < Review
    belongs_to :guide, class_name: "Traveler"
end
