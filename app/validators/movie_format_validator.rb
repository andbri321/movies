class MovieFormatValidator < ActiveModel::EachValidator
  def validate_each(movie, attribute, file)
    return if valid?(file)
    movie.errors.add(attribute, :invalid)
  end

   private

   def valid?(file)
     file.blank? || File.extname(file.filename.to_s) == '.mp4'
   end
end
