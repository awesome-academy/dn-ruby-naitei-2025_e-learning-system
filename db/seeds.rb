# === XÓA DỮ LIỆU CŨ ===
Lesson.destroy_all
CourseModule.destroy_all
Course.destroy_all
Category.destroy_all

category = Category.create!(
  id: 1,
  name: "Lập trình Web",
  description: "Các khóa học lập trình web cơ bản và nâng cao."
)

course = Course.create!(
  id: 1,
  category_id: category.id,
  title: "Ruby on Rails cơ bản",
  description: "Học cách xây dựng ứng dụng web với Ruby on Rails.",
  thumbnail_url: "https://via.placeholder.com/400x200",
  created_by: 1
)

module1 = CourseModule.create!(
  id: 1,
  course_id: course.id,
  title: "Giới thiệu về Rails",
  description: "Hiểu tổng quan về framework Ruby on Rails.",
  order_index: 1
)

module2 = CourseModule.create!(
  id: 2,
  course_id: course.id,
  title: "MVC trong Rails",
  description: "Khám phá mô hình MVC và cách Rails tổ chức ứng dụng.",
  order_index: 2
)

Lesson.create!(
  id: 1,
  course_module_id: module1.id,
  title: "Cài đặt Ruby và Rails",
  description: "Hướng dẫn cài đặt môi trường Ruby, Rails và các công cụ.",
  video_url: "https://www.youtube.com/embed/xyz123",
  attachment_url: "https://example.com/docs/setup.pdf",
  order_index: 1
)

Lesson.create!(
  id: 2,
  course_module_id: module2.id,
  title: "Tạo Model đầu tiên",
  description: "Thực hành tạo model và migration trong Rails.",
  video_url: "https://www.youtube.com/embed/abc456",
  attachment_url: "https://example.com/docs/model.pdf",
  order_index: 1
)
