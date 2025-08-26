module ShuffleRecipesHelper
  def status_class(status)
    case status
    when "accepted"
      "bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300"
    when "rejected"
      "bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-300"
    else
      "bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300"
    end
  end
end
