/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Videos : Codable {
	let id : Int?
	let url : String?
	let vimeo_id : String?
	let thumb : String?
	let created_at : String?
	let updated_at : String?
	let category_id : Int?
	let home_workout : Int?
	let is_send_notification : String?
	let is_featured : String?
	let archived : String?
	let is_free : String?
	let keyword : String?
	let type : String?
	let is_nutrition : Int?
	let created_by : Int?
	let video_id : Int?
	let lang : String?
	let lang_code : String?
	let title : String?
	let description : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case url = "url"
		case vimeo_id = "vimeo_id"
		case thumb = "thumb"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case category_id = "category_id"
		case home_workout = "home_workout"
		case is_send_notification = "is_send_notification"
		case is_featured = "is_featured"
		case archived = "archived"
		case is_free = "is_free"
		case keyword = "keyword"
		case type = "type"
		case is_nutrition = "is_nutrition"
		case created_by = "created_by"
		case video_id = "video_id"
		case lang = "lang"
		case lang_code = "lang_code"
		case title = "title"
		case description = "description"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		vimeo_id = try values.decodeIfPresent(String.self, forKey: .vimeo_id)
		thumb = try values.decodeIfPresent(String.self, forKey: .thumb)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
		home_workout = try values.decodeIfPresent(Int.self, forKey: .home_workout)
		is_send_notification = try values.decodeIfPresent(String.self, forKey: .is_send_notification)
		is_featured = try values.decodeIfPresent(String.self, forKey: .is_featured)
		archived = try values.decodeIfPresent(String.self, forKey: .archived)
		is_free = try values.decodeIfPresent(String.self, forKey: .is_free)
		keyword = try values.decodeIfPresent(String.self, forKey: .keyword)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		is_nutrition = try values.decodeIfPresent(Int.self, forKey: .is_nutrition)
		created_by = try values.decodeIfPresent(Int.self, forKey: .created_by)
		video_id = try values.decodeIfPresent(Int.self, forKey: .video_id)
		lang = try values.decodeIfPresent(String.self, forKey: .lang)
		lang_code = try values.decodeIfPresent(String.self, forKey: .lang_code)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
	}

}
