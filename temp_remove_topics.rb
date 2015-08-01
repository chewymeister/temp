topic_ids = Topic.where(trading: true).pluck(:id)

old_not_trading_topic_ids = topic_ids.select do |topic_id|
  ProviderTopic.where(topic_id: topic_id).count == 0
end

old_not_trading_topic_ids.all? do |provider_topic_id|
  ProviderTopic.where(topic_id: provider_topic_id).count == 0
end

new_not_trading_topic_ids = topic_ids.select do |topic_id|
  ProviderTopic.where(topic_id: topic_id).count == 0
end

new_not_trading_topic_ids.all? do |provider_topic_id|
  ProviderTopic.where(topic_id: provider_topic_id).count == 0
end

old_not_trading_topic_ids.each do |provider_topic_id|
  Topic.find(provider_topic_id).update_attributes(trading: false)
end

new_not_trading_topic_ids.each do |provider_topic_id|
  Topic.find(provider_topic_id).update_attributes(trading: false)
end

###################################################################

all_topic_ids = ProviderTopic.all.pluck(:topic_id).uniq

suspicious_pt_ids = all_topic_ids - topic_ids

suspicious_pts = suspicious_pt_ids.map do |pt_id|
  pts = ProviderTopic.where(topic_id: pt_id)
end

suspicious_topic_names = suspicious_pt_ids.map do |pt_id|
  Topic.find(pt_id).name
end

[547, 353, 454, 455, 456, 457, 458, 459, 460, 544, 546, 354, 355, 356, 357, 358, 359, 
  360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 
  377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 
  394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 
  411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 
  428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 441, 443, 444, 445, 446, 447, 
  448, 449, 450, 451, 452, 453, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 
  472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 
  489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 
  506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 521, 522, 523, 
  524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 440, 543]
